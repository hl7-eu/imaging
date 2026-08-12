const fs = require('fs');
const path = require('path');

// FHIR-56773 — Build/refresh the EU Imaging obligations table.
//
// Produces scripts/eu-imaging-obligations.csv covering ALL fields defined by ALL
// EU Imaging profiles (both R5 and R4), overlaid with obligations from the
// Xt-EHR mapping table (xtehr-model-mapping.tsv). Columns:
//   Profile, Field, Card, MS, EHDS Producer, EHDS Consumer,
//   R5 Producer, R5 Consumer, R4 Producer, R4 Consumer, EHDS Description, Description
//
// Rules:
//  - When multiple mappings target the same EU field, the STRONGEST obligation
//    wins per column (SHALL > SHOULD > MAY; then populate > populate-if-known >
//    able-to-populate). EHDS Description is a comma-separated list of the EHDS
//    source element paths (<EHDSResource>.<field>) for all contributing source mappings.
//  - "Description" defaults to a copy of "EHDS Description" but a user override is
//    preserved across regenerations (only refreshed when empty or still equal to
//    the previous EHDS Description).
//  - Obligation codes are from the FHIR obligation CodeSystem
//    (http://hl7.org/fhir/CodeSystem/obligation).
//
// It also prints a gaps report (and writes eu-imaging-obligations-gaps.csv):
//  - MS fields with no obligation in any column
//  - mandatory (1..1) fields that already carry a producer obligation which is
//    not SHALL:populate (rule C: fix wrong obligations only; un-obligated 1..1
//    fields are left alone)

const R5_DIR = path.join(__dirname, '..', 'igs', 'imaging-r5', 'output');
const R4_DIR = path.join(__dirname, '..', 'igs', 'imaging-r4', 'output');
const TSV_FILE = path.join(__dirname, 'xtehr-model-mapping.tsv');
const OUT_CSV = path.join(__dirname, 'eu-imaging-obligations.csv');
const GAPS_CSV = path.join(__dirname, 'eu-imaging-obligations-gaps.csv');
const MISMATCH_CSV = path.join(__dirname, 'eu-imaging-obligations-mismatches.csv');

const EU_URL_MARKER = 'hl7.eu/fhir/imaging';

// TSV 0-based column indices (post obligation-column injection).
const TSV = {
    srcResource: 1, srcField: 2, srcDesc: 4,
    ehdsProducer: 8, ehdsConsumer: 9,
    r5Resource: 10, r5Field: 11, r5Producer: 18, r5Consumer: 19,
    r4Resource: 21, r4Field: 22, r4Producer: 29, r4Consumer: 30,
};

const QUALIFIER_RANK = { MAY: 1, SHOULD: 2, SHALL: 3 };
const FUNCTIONAL_RANK = { 'able-to-populate': 1, 'populate-if-known': 2, 'populate': 3 };

// Parse a cell of comma-separated "QUALIFIER:functional" codes into functional -> strongest qualifier rank.
function parseObligation(v) {
    const m = {};
    (v || '').split(',').map(s => s.trim()).filter(Boolean).forEach(c => {
        const [qual, func] = c.split(':');
        if (func) m[func] = Math.max(m[func] || 0, QUALIFIER_RANK[qual] || 0);
    });
    return m;
}

// Compare an IG obligation cell against the EHDS obligation cell for the same role.
// Returns { missing: [funcs], reduced: [funcs] } where the IG drops or weakens an EHDS obligation.
function compareToEhds(ehdsCell, igCell) {
    const e = parseObligation(ehdsCell), g = parseObligation(igCell);
    const missing = [], reduced = [];
    Object.keys(e).forEach(func => {
        if (!(func in g)) missing.push(func);
        else if (g[func] < e[func]) reduced.push(func);
    });
    return { missing, reduced };
}

// Return the stronger of two obligation codes ("QUALIFIER:functional"), or a merge
// per functional code when they differ in function (keep both, strongest qualifier each).
function strongestObligation(a, b) {
    if (!a) return b || '';
    if (!b) return a || '';
    if (a === b) return a;
    // Merge by functional code, keeping the strongest qualifier for each function.
    const byFunc = {};
    for (const code of [a, b]) {
        code.split(',').map(s => s.trim()).filter(Boolean).forEach(c => {
            const [qual, func] = c.split(':');
            const key = func || '';
            if (!byFunc[key] || (QUALIFIER_RANK[qual] || 0) > (QUALIFIER_RANK[byFunc[key].qual] || 0)) {
                byFunc[key] = { qual, func: key };
            }
        });
    }
    // Order functions by functional rank desc for stable output.
    const parts = Object.values(byFunc)
        .sort((x, y) => (FUNCTIONAL_RANK[y.func] || 0) - (FUNCTIONAL_RANK[x.func] || 0))
        .map(o => o.func ? `${o.qual}:${o.func}` : o.qual);
    return parts.join(', ');
}

// Strip the base-type prefix and convert slice ":name" to "[name]".
function normalizeField(id, baseType) {
    let field = id === baseType ? '' : (id.startsWith(baseType + '.') ? id.slice(baseType.length + 1) : id);
    return field.replace(/:([^.\[]+)/g, '[$1]');
}

function readEuProfiles(dir) {
    const profiles = {};
    if (!fs.existsSync(dir)) {
        console.warn(`Snapshot directory not found: ${dir}`);
        return profiles;
    }
    fs.readdirSync(dir)
        .filter(f => f.startsWith('StructureDefinition-') && f.endsWith('.json'))
        .forEach(f => {
            let d;
            try { d = JSON.parse(fs.readFileSync(path.join(dir, f), 'utf8')); } catch { return; }
            if (d.resourceType !== 'StructureDefinition' || d.derivation !== 'constraint') return;
            if (!(d.url || '').includes(EU_URL_MARKER)) return;
            // Exclude the derived obligation profiles themselves (they carry the obligations,
            // they are not part of the field inventory).
            if (/Obligation/.test(d.name || '')) return;
            const baseType = d.type;
            const fields = {}; // field -> { card, ms } (from snapshot; ms OR-ed with differential)
            (d.snapshot && d.snapshot.element ? d.snapshot.element : []).forEach(e => {
                const field = normalizeField(e.id, baseType);
                if (!field) return;
                const card = `${e.min == null ? '' : e.min}..${e.max == null ? '' : e.max}`;
                fields[field] = { card: card === '..' ? '' : card, ms: !!e.mustSupport };
            });
            const diff = new Set(); // fields explicitly present in the differential
            (d.differential && d.differential.element ? d.differential.element : []).forEach(e => {
                const field = normalizeField(e.id, baseType);
                if (!field) return;
                diff.add(field);
                if (!fields[field]) {
                    const card = `${e.min == null ? '' : e.min}..${e.max == null ? '' : e.max}`;
                    fields[field] = { card: card === '..' ? '' : card, ms: false };
                }
                if (e.mustSupport) fields[field].ms = true;
            });
            profiles[d.name] = { baseType, fields, diff };
        });
    return profiles;
}

// Inventory = union of (differential fields) and (TSV-obligated fields) per EU
// profile; cardinality/MS taken from the profile snapshot (R5 preferred, R4 fallback).
function buildInventory(r5, r4, overlay) {
    const inv = {};
    const overlayByProfile = {};
    Object.keys(overlay).forEach(key => {
        const [profile, field] = key.split('\t');
        (overlayByProfile[profile] = overlayByProfile[profile] || new Set()).add(field);
    });
    const allProfiles = new Set([...Object.keys(r5), ...Object.keys(r4)]);
    allProfiles.forEach(profile => {
        const p5 = r5[profile], p4 = r4[profile];
        const fields = new Set();
        if (p5) p5.diff.forEach(f => fields.add(f));
        if (p4) p4.diff.forEach(f => fields.add(f));
        if (overlayByProfile[profile]) overlayByProfile[profile].forEach(f => fields.add(f));
        fields.forEach(field => {
            const m5 = p5 && p5.fields[field];
            const m4 = p4 && p4.fields[field];
            inv[`${profile}\t${field}`] = {
                profile, field,
                cardR5: m5 ? m5.card : '',
                cardR4: m4 ? m4.card : '',
                ms: !!((m5 && m5.ms) || (m4 && m4.ms)),
            };
        });
    });
    // Overlay-referenced profiles that are not IG main profiles (rare edge case).
    Object.keys(overlayByProfile).forEach(profile => {
        if (allProfiles.has(profile)) return;
        overlayByProfile[profile].forEach(field => {
            inv[`${profile}\t${field}`] = { profile, field, cardR5: '', cardR4: '', ms: false };
        });
    });
    return inv;
}

function buildObligationOverlay() {
    const overlay = {}; // key `${profile}.${field}` -> obligation cells + sources
    if (!fs.existsSync(TSV_FILE)) {
        console.error(`TSV not found: ${TSV_FILE}`);
        process.exit(1);
    }
    const lines = fs.readFileSync(TSV_FILE, 'utf8').split('\n');
    const clean = v => (v || '').replace(/"/g, '').trim();
    lines.slice(1).forEach(line => {
        if (!line.trim()) return;
        const c = line.split('\t');
        const ehdsSrc = `${clean(c[TSV.srcResource])}.${clean(c[TSV.srcField])}`;
        const ehdsDesc = clean(c[TSV.srcDesc]);
        const ehdsProd = clean(c[TSV.ehdsProducer]);
        const ehdsCons = clean(c[TSV.ehdsConsumer]);

        const apply = (profile, field, prodCol, consCol) => {
            if (!profile || !field) return;
            const key = `${profile}\t${field}`;
            if (!overlay[key]) {
                overlay[key] = {
                    ehdsProd: '', ehdsCons: '', r5Prod: '', r5Cons: '', r4Prod: '', r4Cons: '',
                    sources: [],
                };
            }
            const o = overlay[key];
            o.ehdsProd = strongestObligation(o.ehdsProd, ehdsProd);
            o.ehdsCons = strongestObligation(o.ehdsCons, ehdsCons);
            const prod = clean(c[prodCol]);
            const cons = clean(c[consCol]);
            if (prodCol === TSV.r5Producer) { o.r5Prod = strongestObligation(o.r5Prod, prod); o.r5Cons = strongestObligation(o.r5Cons, cons); }
            else { o.r4Prod = strongestObligation(o.r4Prod, prod); o.r4Cons = strongestObligation(o.r4Cons, cons); }
            if (clean(c[TSV.srcResource]).startsWith('EHDS') && clean(c[TSV.srcField])) {
                const srcLabel = ehdsSrc;
                if (!o.sources.some(s => s.src === srcLabel)) {
                    o.sources.push({ src: srcLabel, desc: ehdsDesc, prod: ehdsProd, cons: ehdsCons });
                }
            }
        };
        apply(clean(c[TSV.r5Resource]), clean(c[TSV.r5Field]), TSV.r5Producer, TSV.r5Consumer);
        apply(clean(c[TSV.r4Resource]), clean(c[TSV.r4Field]), TSV.r4Producer, TSV.r4Consumer);
    });
    return overlay;
}

function ehdsDescriptionText(sources) {
    if (!sources || sources.length === 0) return '';
    // Comma-separated list of the EHDS source element paths (<EHDSResource>.<field>)
    // for all contributing source mappings.
    const seen = new Set();
    const list = [];
    sources.forEach(s => {
        if (s.src && !seen.has(s.src)) { seen.add(s.src); list.push(s.src); }
    });
    return list.join(', ');
}

// Read existing CSV to preserve user overrides in the Description column.
function readExistingOverrides() {
    const map = {}; // `${profile}\t${field}` -> { ehdsDesc, description }
    if (!fs.existsSync(OUT_CSV)) return map;
    const rows = parseCsv(fs.readFileSync(OUT_CSV, 'utf8'));
    if (rows.length < 1) return map;
    const header = rows[0];
    const idx = name => header.indexOf(name);
    const iP = idx('Profile'), iF = idx('Field'), iE = idx('EHDS Description'), iD = idx('Description');
    if (iP < 0 || iF < 0) return map;
    rows.slice(1).forEach(r => {
        map[`${r[iP]}\t${r[iF]}`] = { ehdsDesc: iE >= 0 ? r[iE] : '', description: iD >= 0 ? r[iD] : '' };
    });
    return map;
}

// Minimal RFC4180 CSV helpers (comma-delimited, quoted).
function csvCell(v) {
    v = v == null ? '' : String(v);
    return /[",\n]/.test(v) ? `"${v.replace(/"/g, '""')}"` : v;
}
function csvRow(cells) { return cells.map(csvCell).join(','); }
function parseCsv(text) {
    const rows = []; let row = []; let cell = ''; let q = false;
    for (let i = 0; i < text.length; i++) {
        const ch = text[i];
        if (q) {
            if (ch === '"') { if (text[i + 1] === '"') { cell += '"'; i++; } else q = false; }
            else cell += ch;
        } else {
            if (ch === '"') q = true;
            else if (ch === ',') { row.push(cell); cell = ''; }
            else if (ch === '\n') { row.push(cell); rows.push(row); row = []; cell = ''; }
            else if (ch === '\r') { /* skip */ }
            else cell += ch;
        }
    }
    if (cell !== '' || row.length) { row.push(cell); rows.push(row); }
    return rows.filter(r => r.length > 1 || (r.length === 1 && r[0] !== ''));
}

function main() {
    const r5 = readEuProfiles(R5_DIR);
    const r4 = readEuProfiles(R4_DIR);
    const overlay = buildObligationOverlay();
    const inventory = buildInventory(r5, r4, overlay);
    const overrides = readExistingOverrides();

    const HEADER = ['Profile', 'Field', 'Card', 'MS',
        'EHDS Producer', 'EHDS Consumer', 'R5 Producer', 'R5 Consumer', 'R4 Producer', 'R4 Consumer',
        'EHDS Description', 'Description'];

    const rows = [];
    const gaps = [];
    const mismatches = [];
    Object.keys(inventory).sort().forEach(key => {
        const inv = inventory[key];
        const o = overlay[key] || {};
        const card = inv.cardR5 || inv.cardR4 || '';
        const ms = inv.ms ? 'Y' : '';
        const ehdsProd = o.ehdsProd || '';
        const ehdsCons = o.ehdsCons || '';
        const r5Prod = o.r5Prod || '';
        const r5Cons = o.r5Cons || '';
        const r4Prod = o.r4Prod || '';
        const r4Cons = o.r4Cons || '';
        const ehdsDesc = ehdsDescriptionText(o.sources);

        // Preserve user override on Description.
        const prev = overrides[key];
        let description;
        if (prev && prev.description && prev.description !== prev.ehdsDesc) {
            description = prev.description; // user override kept
        } else {
            description = ehdsDesc;
        }

        rows.push([inv.profile, inv.field, card, ms,
            ehdsProd, ehdsCons, r5Prod, r5Cons, r4Prod, r4Cons, ehdsDesc, description]);

        // Convention checks.
        const anyOblig = ehdsProd || ehdsCons || r5Prod || r5Cons || r4Prod || r4Cons;
        if (inv.ms && !anyOblig) {
            gaps.push([inv.profile, inv.field, card, 'MS field without any obligation']);
        }
        if (card === '1..1') {
            // Rule C: only flag a mandatory 1..1 field that already HAS a producer obligation
            // which is not SHALL:populate (a wrong obligation to fix, e.g. status MAY -> SHALL).
            // Un-obligated 1..1 fields are left alone (no SHALL:populate is auto-required).
            const prodObligs = [r5Prod, r4Prod, ehdsProd].filter(Boolean);
            const hasShallPopulate = prodObligs.some(v => /\bSHALL:populate\b/.test(v));
            if (prodObligs.length > 0 && !hasShallPopulate) {
                gaps.push([inv.profile, inv.field, card,
                    `mandatory 1..1 with non-SHALL:populate obligation (has: ${prodObligs.join(' / ')})`]);
            }
        }

        // Consistency check: IG (R5/R4) obligations vs the EHDS-sourced obligation.
        [['Producer', ehdsProd, r5Prod, r4Prod], ['Consumer', ehdsCons, r5Cons, r4Cons]].forEach(([role, ehds, r5, r4]) => {
            if (!ehds) return;
            if (!r5 && !r4) {
                mismatches.push([inv.profile, inv.field, role, ehds, '', 'missing EHDS-sourced obligation (not carried by any IG profile)']);
                return;
            }
            [['R5', r5], ['R4', r4]].forEach(([ver, ig]) => {
                if (!ig) return;
                const { missing, reduced } = compareToEhds(ehds, ig);
                if (missing.length) mismatches.push([inv.profile, inv.field, `${role} ${ver}`, ehds, ig, `missing EHDS obligation for: ${missing.join(', ')}`]);
                if (reduced.length) mismatches.push([inv.profile, inv.field, `${role} ${ver}`, ehds, ig, `override reduces level below EHDS for: ${reduced.join(', ')}`]);
            });
        });
    });

    fs.writeFileSync(OUT_CSV, [csvRow(HEADER), ...rows.map(csvRow)].join('\n') + '\n', 'utf8');
    const gapsHeader = ['Profile', 'Field', 'Card', 'Issue'];
    fs.writeFileSync(GAPS_CSV, [csvRow(gapsHeader), ...gaps.map(csvRow)].join('\n') + '\n', 'utf8');
    const mmHeader = ['Profile', 'Field', 'Role', 'EHDS', 'IG', 'Issue'];
    fs.writeFileSync(MISMATCH_CSV, [csvRow(mmHeader), ...mismatches.map(csvRow)].join('\n') + '\n', 'utf8');

    console.log(`Wrote ${rows.length} rows to ${path.basename(OUT_CSV)}.`);
    console.log(`Gaps: ${gaps.length} (see ${path.basename(GAPS_CSV)}).`);
    console.log(`Mismatches vs EHDS: ${mismatches.length} (see ${path.basename(MISMATCH_CSV)}).`);
    if (process.argv.includes('--check')) {
        const missing = mismatches.filter(m => /missing/.test(m[5])).length;
        const reduced = mismatches.filter(m => /reduces level/.test(m[5])).length;
        console.log(`  - missing EHDS-sourced obligations: ${missing}`);
        console.log(`  - level-reducing overrides:        ${reduced}`);
        process.exitCode = mismatches.length > 0 ? 1 : 0;
    }
}

main();
