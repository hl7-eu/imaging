const fs = require('fs');
const path = require('path');

// Configuration
const CUTOFF_DATE = new Date('2026-03-30');
const JIRA_DIR = path.join(process.cwd(), 'jira');
const DEFAULT_OUTPUT = path.join(JIRA_DIR, 'jira-ticket-sections.md');
const OUTPUT_FILE = process.argv.includes('--output') 
  ? process.argv[process.argv.indexOf('--output') + 1] 
  : DEFAULT_OUTPUT;

const SECTION_FIELDS = [
  'Related Sections',
  'Related Section',
  'Related section',
  'Related sections',
  'Related Artifact',
  'Related Artifacts',
  'Related Artififact'
];

const PAGES_JSON_PATHS = [
  path.join(process.cwd(), 'igs/imaging-r4/output/_data/pages.json'),
  path.join(process.cwd(), 'igs/imaging-r4/temp/pages/_data/pages.json'),
  path.join(process.cwd(), 'igs/imaging-r5/output/_data/pages.json'),
  path.join(process.cwd(), 'igs/imaging-r5/temp/pages/_data/pages.json'),
];

const BALLOT_R4_BASE = 'https://hl7.eu/fhir/imaging/1.0.0-ballot/en/';
const BALLOT_R5_BASE = 'https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/';
const BUILD_R4_BASE = 'https://build.fhir.org/ig/hl7-eu/imaging-r4/en/';
const BUILD_R5_BASE = 'https://build.fhir.org/ig/hl7-eu/imaging-r5/en/';

function loadSectionMap() {
  const SKIP_SUFFIXES = [
    '- Definitions', '- Mappings', '- Testing',
    '- JSON Representation', '- TTL Representation', '- XML Representation',
    '- Examples', 'Change History', 'IP Statements'
  ];
  for (const p of PAGES_JSON_PATHS) {
    if (!fs.existsSync(p)) continue;
    try {
      const pages = JSON.parse(fs.readFileSync(p, 'utf-8'));
      const map = {};
      for (const [, info] of Object.entries(pages)) {
        if (!info || typeof info !== 'object') continue;
        const label = info.label || '';
        const title = info.title || '';
        if (!label || !title) continue;
        if (SKIP_SUFFIXES.some(s => title.includes(s))) continue;
        if (!(label in map)) map[label] = title;
      }
      console.log(`Loaded ${Object.keys(map).length} section labels from ${p}`);
      return map;
    } catch (e) {
      // try next
    }
  }
  return {};
}

const SECTION_MAP = loadSectionMap();

function loadVersionPageMap(version) {
  const candidates = version === 'r4'
    ? [
      path.join(process.cwd(), 'igs/imaging-r4/output/_data/pages.json'),
      path.join(process.cwd(), 'igs/imaging-r4/temp/pages/_data/pages.json')
    ]
    : [
      path.join(process.cwd(), 'igs/imaging-r5/output/_data/pages.json'),
      path.join(process.cwd(), 'igs/imaging-r5/temp/pages/_data/pages.json')
    ];

  for (const p of candidates) {
    if (!fs.existsSync(p)) continue;
    try {
      const pages = JSON.parse(fs.readFileSync(p, 'utf-8'));
      const map = {};
      for (const [page, info] of Object.entries(pages)) {
        if (!info || typeof info !== 'object') continue;
        const label = (info.label || '').trim();
        if (!label) continue;
        if (!(label in map)) map[label] = page;
      }
      return map;
    } catch (e) {
      // try next
    }
  }
  return {};
}

const PAGE_MAP_R4 = loadVersionPageMap('r4');
const PAGE_MAP_R5 = loadVersionPageMap('r5');

function parseSectionNumbers(raw) {
  // Extract all section-number tokens (e.g. "§11.15", "11.15", "10.2")
  return [...raw.matchAll(/§?([0-9]+(?:\.[0-9]+)*)/g)].map(m => m[1]);
}

function resolveSection(raw) {
  const nums = parseSectionNumbers(raw);
  for (const num of nums) {
    if (SECTION_MAP[num]) {
      return `§${num} ${SECTION_MAP[num]}`;
    }
  }
  // No match found — return the raw value as-is
  return raw.trim();
}

function parseDate(dateStr) {
  if (!dateStr) return null;
  const isoDate = new Date(dateStr);
  if (!isNaN(isoDate)) return isoDate;
  const parts = dateStr.split('/');
  if (parts.length === 3) {
    const [month, day, year] = parts.map(p => parseInt(p, 10));
    if (isNaN(month) || isNaN(day) || isNaN(year)) return null;
    const fullYear = year < 100 ? 2000 + year : year;
    return new Date(fullYear, month - 1, day);
  }
  return null;
}

function extractMetadata(content) {
  const metadata = {};
  const lines = content.split('\n');
  let inMetadataSection = false;
  for (const line of lines) {
    if (line.startsWith('## Metadata')) {
      inMetadataSection = true;
      continue;
    }
    if (inMetadataSection && line.startsWith('##')) {
      break;
    }
    if (inMetadataSection && line.trim()) {
      const match = line.match(/^\s*-\s+([^:]+):\s*(.*)$/);
      if (match) {
        const key = match[1].trim();
        const value = match[2].trim();
        metadata[key] = value;
      }
    }
  }
  return metadata;
}

function getSection(metadata) {
  // Try Related Sections fields first — resolve numbers to titles via pages.json
  const sectionFields = ['Related Sections', 'Related Section', 'Related section', 'Related sections'];
  for (const field of sectionFields) {
    if (metadata[field]) {
      return resolveSection(metadata[field]);
    }
  }
  // Fall back to Related Artifact
  const artifactFields = ['Related Artifact', 'Related Artifacts', 'Related Artififact'];
  for (const field of artifactFields) {
    if (metadata[field]) {
      return metadata[field].trim();
    }
  }
  return 'Unknown Section';
}

function readTickets() {
  const tickets = [];
  if (!fs.existsSync(JIRA_DIR)) {
    console.error(`Error: jira directory not found at ${JIRA_DIR}`);
    process.exit(1);
  }
  const searchDirs = [JIRA_DIR];
  for (const subdir of ['open', 'closed']) {
    const dirPath = path.join(JIRA_DIR, subdir);
    if (fs.existsSync(dirPath) && fs.statSync(dirPath).isDirectory()) {
      searchDirs.push(dirPath);
    }
  }

  for (const rootDir of searchDirs) {
    const entries = fs.readdirSync(rootDir, { withFileTypes: true });
    for (const entry of entries) {
      if (!entry.isDirectory() || !entry.name.match(/^FHIR-\d+$/)) {
        continue;
      }
      const ticketDir = path.join(rootDir, entry.name);
      const ticketFile = path.join(ticketDir, `${entry.name}.md`);
      if (!fs.existsSync(ticketFile)) {
        continue;
      }
      try {
        const content = fs.readFileSync(ticketFile, 'utf-8');
        const metadata = extractMetadata(content);
        const ticket = {
          key: metadata['Key'] || entry.name,
          summary: metadata['Summary'] || '(no summary)',
          issueType: metadata['Issue Type'] || 'Unknown',
          status: metadata['Status'] || 'Unknown',
          created: metadata['Created'],
          parsedDate: parseDate(metadata['Created']),
          section: getSection(metadata),
          path: './' + path.relative(JIRA_DIR, ticketFile),
          fullMetadata: metadata
        };
        tickets.push(ticket);
      } catch (err) {
        console.error(`Error reading ${ticketFile}: ${err.message}`);
      }
    }
  }
  return tickets;
}

function filterTickets(tickets) {
  const included = [];
  const excludedByDate = [];
  const excludedForQuality = [];
  for (const ticket of tickets) {
    if (!ticket.parsedDate) {
      excludedForQuality.push(ticket);
      continue;
    }
    if (ticket.parsedDate >= CUTOFF_DATE) {
      included.push(ticket);
    } else {
      excludedByDate.push(ticket);
    }
  }
  return { included, excludedByDate, excludedForQuality };
}

function groupBySection(tickets) {
  const groups = {};
  for (const ticket of tickets) {
    if (!groups[ticket.section]) {
      groups[ticket.section] = [];
    }
    groups[ticket.section].push(ticket);
  }
  return groups;
}

function parseSectionLabel(name) {
  // Extract leading section number from "§11.15 Title" or raw number, for numeric sort
  const m = name.match(/^§?([0-9]+(?:\.[0-9]+)*)/);
  if (m) {
    return m[1].split('.').map(n => parseInt(n, 10));
  }
  return null;
}

function getPageForSection(sectionName, version) {
  const labels = parseSectionLabel(sectionName);
  if (!labels) return null;
  const label = labels.join('.');
  const map = version === 'r4' ? PAGE_MAP_R4 : PAGE_MAP_R5;
  return map[label] || null;
}

function generateSectionLinks(sectionName) {
  const pageR4 = getPageForSection(sectionName, 'r4');
  const pageR5 = getPageForSection(sectionName, 'r5');

  if (!pageR4 && !pageR5) return '';

  const ballotR4 = pageR4 ? `[R4 ballot](${BALLOT_R4_BASE}${pageR4})` : 'R4 ballot: n/a';
  const ballotR5 = pageR5 ? `[R5 ballot](${BALLOT_R5_BASE}${pageR5})` : 'R5 ballot: n/a';
  const buildR4 = pageR4 ? `[R4 build](${BUILD_R4_BASE}${pageR4})` : 'R4 build: n/a';
  const buildR5 = pageR5 ? `[R5 build](${BUILD_R5_BASE}${pageR5})` : 'R5 build: n/a';

  return `${ballotR4} | ${ballotR5} | ${buildR4} | ${buildR5}`;
}

function sortSectionNames(sections) {
  const names = Object.keys(sections);
  names.sort((a, b) => {
    if (a === 'Unknown Section') return 1;
    if (b === 'Unknown Section') return -1;
    const la = parseSectionLabel(a);
    const lb = parseSectionLabel(b);
    if (la && lb) {
      for (let i = 0; i < Math.max(la.length, lb.length); i++) {
        const na = la[i] ?? 0;
        const nb = lb[i] ?? 0;
        if (na !== nb) return na - nb;
      }
      return 0;
    }
    if (la) return -1;
    if (lb) return 1;
    return a.localeCompare(b);
  });
  return names;
}

function sortTicketsInSection(tickets) {
  return tickets.sort((a, b) => {
    if (a.parsedDate && b.parsedDate) {
      const dateCompare = b.parsedDate - a.parsedDate;
      if (dateCompare !== 0) return dateCompare;
    }
    return a.key.localeCompare(b.key);
  });
}

function findCompanionFile(ticket, type) {
  const ticketFileAbs = path.join(JIRA_DIR, ticket.path.replace(/^\.\//, ''));
  const ticketDirAbs = path.dirname(ticketFileAbs);
  const ticketBaseName = path.basename(ticketFileAbs);

  if (!fs.existsSync(ticketDirAbs)) return null;

  const candidates = fs.readdirSync(ticketDirAbs)
    .filter(name => name.toLowerCase().endsWith('.md') && name !== ticketBaseName)
    .map(name => ({
      name,
      lower: name.toLowerCase(),
      rel: './' + path.relative(JIRA_DIR, path.join(ticketDirAbs, name))
    }));

  const patternsByType = {
    proposal: ['proposal', 'proposed', 'resolution'],
    implementation: ['implementation-plan', 'implementation'],
    result: ['result']
  };

  const patterns = patternsByType[type] || [];
  for (const pattern of patterns) {
    const match = candidates.find(c => c.lower.includes(pattern));
    if (match) return match.rel;
  }

  return null;
}

function formatCompanionLink(ticket, type, label) {
  const relPath = findCompanionFile(ticket, type);
  return relPath ? `[${label}](${relPath})` : '';
}

function toPendingState(status) {
  const s = (status || '').toLowerCase();
  if (s.includes('applied') || s.includes('declined') || s.includes('retracted') || s.includes('not persuasive')) {
    return 'Resolved';
  }
  if (s.includes('triaged') || s.includes('new') || s.includes('in progress') || s.includes('on hold') || s.includes('waiting') || s.includes('submitted') || s.includes('duplicate')) {
    return 'Pending';
  }
  return status || 'Pending';
}

function extractRecommendedDispositionFromProposal(ticket) {
  const proposalRel = findCompanionFile(ticket, 'proposal');
  if (!proposalRel) return null;

  const absPath = path.join(JIRA_DIR, proposalRel.replace(/^\.\//, ''));
  if (!fs.existsSync(absPath)) return null;

  try {
    const content = fs.readFileSync(absPath, 'utf-8');
    const m = content.match(/^\*\*Recommended disposition:\*\*\s*([^\n\r]+)/im);
    if (!m) return null;

    const raw = m[1].trim();
    // Prefer concise A/B/C token when present (e.g., "A", "A)", "A - ...").
    const letter = raw.match(/^([ABC])\b/i);
    if (letter) return letter[1].toUpperCase();
    return raw;
  } catch {
    return null;
  }
}

function deriveResultCell(ticket) {
  const explicitResult = formatCompanionLink(ticket, 'result', 'result');
  if (explicitResult) return explicitResult;

  const rec = extractRecommendedDispositionFromProposal(ticket);
  if (!rec) return '';

  return `${toPendingState(ticket.status)} (recommended: ${rec})`;
}

function generateSectionTable(sectionName, tickets) {
  let markdown = `## ${sectionName} (${tickets.length})\n\n`;
  const sectionLinks = generateSectionLinks(sectionName);
  if (sectionLinks) {
    markdown += `${sectionLinks}\n\n`;
  }
  markdown += '| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |\n';
  markdown += '|-----|---------|--------|------------|---------|----------|----------------|--------|\n';
  for (const ticket of tickets) {
    const summary = ticket.summary.replace(/\|/g, '\\|').substring(0, 80);
    const jiraUrl = `https://jira.hl7.org/browse/${ticket.key}`;
    const proposalLink = formatCompanionLink(ticket, 'proposal', 'proposal');
    const implementationLink = formatCompanionLink(ticket, 'implementation', 'implementation');
    const resultCell = deriveResultCell(ticket);
    markdown += `| [${ticket.key}](${jiraUrl}) | ${summary} | ${ticket.status} | ${ticket.issueType} | ${ticket.created} | ${proposalLink} | ${implementationLink} | ${resultCell} |\n`;
  }
  markdown += '\n';
  return markdown;
}

function generateReport(groups, stats) {
  const now = new Date().toISOString().split('T')[0];
  const cutoffStr = CUTOFF_DATE.toISOString().split('T')[0];
  let markdown = '# Jira Ticket Sections Report\n\n';
  markdown += `- Generated: ${now}\n`;
  markdown += `- Source: jira/FHIR-*/FHIR-*.md\n`;
  markdown += `- Cutoff: ${cutoffStr} (inclusive)\n`;
  markdown += `- Section strategy: Related Sections (→ title lookup from pages.json) → Related Artifact fallback\n`;
  markdown += `- Included tickets: ${stats.included}\n`;
  markdown += `- Excluded by date: ${stats.excludedByDate}\n`;
  markdown += `- Excluded for data quality: ${stats.excludedForQuality}\n\n`;
  markdown += '## Sections\n\n';
  const sectionNames = sortSectionNames(groups);
  for (const sectionName of sectionNames) {
    const count = groups[sectionName].length;
    markdown += `- ${sectionName} (${count})\n`;
  }
  markdown += '\n';
  for (const sectionName of sectionNames) {
    const sorted = sortTicketsInSection(groups[sectionName]);
    markdown += generateSectionTable(sectionName, sorted);
  }
  if (stats.excludedForQuality > 0 || stats.excludedByDate > 0) {
    markdown += '## Appendix: Excluded Tickets\n\n';
    if (stats.excludedByDate > 0) {
      markdown += `### Excluded by Date (${stats.excludedByDate})\n`;
      markdown += `Tickets with Created date before ${cutoffStr}.\n\n`;
    }
    if (stats.excludedForQuality > 0) {
      markdown += `### Excluded for Data Quality (${stats.excludedForQuality})\n`;
      markdown += 'Tickets with missing or unparseable Created date.\n\n';
    }
  }
  return markdown;
}

function main() {
  console.log(`Reading tickets from ${JIRA_DIR}...`);
  const allTickets = readTickets();
  console.log(`Found ${allTickets.length} ticket files.`);
  console.log(`Filtering by cutoff date ${CUTOFF_DATE.toISOString().split('T')[0]}...`);
  const { included, excludedByDate, excludedForQuality } = filterTickets(allTickets);
  console.log(`Included: ${included.length}, Excluded by date: ${excludedByDate.length}, Excluded for quality: ${excludedForQuality.length}`);
  console.log('Grouping by section...');
  const groups = groupBySection(included);
  const sectionNames = sortSectionNames(groups);
  console.log(`Found ${sectionNames.length} sections: ${sectionNames.join(', ')}`);
  console.log('Generating markdown report...');
  const report = generateReport(groups, {
    included: included.length,
    excludedByDate: excludedByDate.length,
    excludedForQuality: excludedForQuality.length
  });
  try {
    fs.writeFileSync(OUTPUT_FILE, report, 'utf-8');
    console.log(`✓ Report written to ${OUTPUT_FILE}`);
    console.log(`  Sections: ${sectionNames.length}`);
    console.log(`  Tickets: ${included.length}`);
  } catch (err) {
    console.error(`Error writing ${OUTPUT_FILE}: ${err.message}`);
    process.exit(1);
  }
}

main();
