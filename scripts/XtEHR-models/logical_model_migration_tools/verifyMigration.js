const fs = require('fs');

// Read CSV file
const csvContent = fs.readFileSync('xtehr-model.csv', 'utf-8');
const csvLines = csvContent.trim().split('\n');
const csvData = csvLines.map(line => {
  const parts = line.split(';').map(p => p.trim());
  return { resource: parts[0], field: parts[1], key: `${parts[0]}|||${parts[1]}` };
});

// Read TSV file
const tsvContent = fs.readFileSync('xtehr-model-mapping-migrated.tsv', 'utf-8');
const tsvLines = tsvContent.trim().split('\n').slice(1); // Skip header
const tsvData = tsvLines.map(line => {
  const parts = line.split('\t');
  return { resource: parts[1], field: parts[2], key: `${parts[1]}|||${parts[2]}` };
});

console.log(`CSV entries: ${csvData.length}`);
console.log(`TSV entries: ${tsvData.length}`);
console.log(`Difference: ${csvData.length - tsvData.length}`);
console.log('');

// Create lookup maps
const csvKeys = new Set(csvData.map(d => d.key));
const tsvKeys = new Set(tsvData.map(d => d.key));

// Find entries in CSV but not in TSV
const missingInTsv = csvData.filter(d => !tsvKeys.has(d.key));
if (missingInTsv.length > 0) {
  console.log(`\nEntries in CSV but MISSING in TSV (${missingInTsv.length}):`);
  missingInTsv.forEach(d => {
    console.log(`  - ${d.resource} | ${d.field}`);
  });
}

// Find entries in TSV but not in CSV
const missingInCsv = tsvData.filter(d => !csvKeys.has(d.key));
if (missingInCsv.length > 0) {
  console.log(`\nEntries in TSV but MISSING in CSV (${missingInCsv.length}):`);
  missingInCsv.forEach(d => {
    console.log(`  - ${d.resource} | ${d.field}`);
  });
}

if (missingInTsv.length === 0 && missingInCsv.length === 0) {
  console.log('\n✓ All entries match perfectly!');
}
