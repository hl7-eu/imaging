const fs = require('fs');
const path = require('path');

// Inserts two columns into xtehr-model-mapping.tsv, between "Xt-EHR source"
// (0-based index 7) and "R5 Mapped Resource" (index 8):
//   - "Xt-EHR Producer Obligation"
//   - "Xt-EHR Consumer Obligation"
// Each data row is populated with the XtEHR obligations defined for that
// element (Resource.Field) in the published *Obligations profiles, grouped by
// actor. The script is idempotent: if the columns already exist it does nothing.

const OBLIGATIONS_DIR = path.join(__dirname, 'XtEHR-models', 'obligations');
const TSV_FILE = path.join(__dirname, 'xtehr-model-mapping.tsv');
const INSERT_AT = 8; // 0-based position of "R5 Mapped Resource"
const PRODUCER_HEADER = 'Xt-EHR Producer Obligation';
const CONSUMER_HEADER = 'Xt-EHR Consumer Obligation';

// Build a map `${baseType}.${elementPath}` -> { producer:[codes], consumer:[codes] }
// from the *Obligations profiles.
function buildObligationMap(dir) {
    const map = {};
    if (!fs.existsSync(dir)) {
        console.warn(`Obligations directory not found: ${dir}`);
        return map;
    }
    fs.readdirSync(dir)
        .filter(f => f.endsWith('.json'))
        .forEach(f => {
            let def;
            try {
                def = JSON.parse(fs.readFileSync(path.join(dir, f), 'utf8'));
            } catch (err) {
                console.error(`Error parsing ${f}:`, err.message);
                return;
            }
            const elements = def.differential && def.differential.element
                ? def.differential.element : [];
            elements.forEach(el => {
                const producer = new Set();
                const consumer = new Set();
                (el.extension || []).forEach(ext => {
                    if (!ext.url || !ext.url.includes('obligation')) return;
                    let code = null;
                    const actors = [];
                    (ext.extension || []).forEach(sub => {
                        if (sub.url === 'code') code = sub.valueCode;
                        if (sub.url === 'actor') actors.push((sub.valueCanonical || '').split('/').pop());
                    });
                    if (!code) return;
                    actors.forEach(a => {
                        if (a === 'actor-producer') producer.add(code);
                        else if (a === 'actor-consumer') consumer.add(code);
                    });
                });
                if (producer.size || consumer.size) {
                    const key = el.path; // e.g. EHDSImagingStudy.header.subject
                    if (!map[key]) map[key] = { producer: new Set(), consumer: new Set() };
                    producer.forEach(c => map[key].producer.add(c));
                    consumer.forEach(c => map[key].consumer.add(c));
                }
            });
        });
    Object.keys(map).forEach(k => {
        map[k] = {
            producer: [...map[k].producer].sort().join(', '),
            consumer: [...map[k].consumer].sort().join(', '),
        };
    });
    return map;
}

function main() {
    if (!fs.existsSync(TSV_FILE)) {
        console.error(`TSV file not found: ${TSV_FILE}`);
        process.exit(1);
    }
    const raw = fs.readFileSync(TSV_FILE, 'utf8');
    const lines = raw.split('\n');

    // Idempotency: bail out if the producer column already exists at INSERT_AT.
    const headerCells = (lines[0] || '').split('\t');
    if (headerCells[INSERT_AT] && headerCells[INSERT_AT].replace(/"/g, '').trim() === PRODUCER_HEADER) {
        console.log('Obligation columns already present; nothing to do.');
        return;
    }

    const obligationMap = buildObligationMap(OBLIGATIONS_DIR);

    let injected = 0;
    let populated = 0;
    const out = lines.map((line, i) => {
        if (line === '') return line; // preserve blank/trailing lines
        const cells = line.split('\t');
        while (cells.length < INSERT_AT) cells.push('');
        let producerVal = '';
        let consumerVal = '';
        if (i === 0) {
            producerVal = PRODUCER_HEADER;
            consumerVal = CONSUMER_HEADER;
        } else {
            const resource = (cells[1] || '').replace(/"/g, '').trim();
            const field = (cells[2] || '').replace(/"/g, '').trim();
            if (resource.startsWith('EHDS') && field) {
                const ob = obligationMap[`${resource}.${field}`];
                if (ob) {
                    producerVal = ob.producer;
                    consumerVal = ob.consumer;
                    if (producerVal || consumerVal) populated++;
                }
            }
        }
        cells.splice(INSERT_AT, 0, producerVal, consumerVal);
        injected++;
        return cells.join('\t');
    });

    fs.writeFileSync(TSV_FILE, out.join('\n'), 'utf8');
    console.log(`Inserted obligation columns into ${injected} rows; populated ${populated} data rows.`);
}

main();
