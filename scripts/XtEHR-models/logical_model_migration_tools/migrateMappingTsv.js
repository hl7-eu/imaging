const fs = require('fs');
const path = require('path');

// Parse CSV/TSV file
function parseDelimitedFile(filePath, delimiter) {
    const content = fs.readFileSync(filePath, 'utf8');
    const rows = content.split('\n')
        .filter(row => row.trim().length > 0)
        .map(row => row.split(delimiter).map(cell => cell.trim()));
    return rows;
}

// Create a unique key for matching rows
function makeKey(resource, field) {
    // Use both resource and field to create a unique identifier
    return `${resource}|||${field}`;
}

// Main migration function
function migrateMappingTsv() {
    const newCsvPath = path.join(__dirname, 'xtehr-model.csv');
    const oldTsvPath = path.join(__dirname, 'xtehr-model-mapping.tsv');
    const outputTsvPath = path.join(__dirname, 'xtehr-model-mapping-migrated.tsv');
    
    console.log('Reading files...');
    console.log(`  New CSV: ${newCsvPath}`);
    console.log(`  Old TSV: ${oldTsvPath}`);
    
    // Read the new CSV (0.3.0)
    const newCsvRows = parseDelimitedFile(newCsvPath, ';');
    console.log(`  Loaded ${newCsvRows.length} rows from new CSV`);
    
    // Read the old TSV (0.2.0 with mappings)
    const oldTsvRows = parseDelimitedFile(oldTsvPath, '\t');
    console.log(`  Loaded ${oldTsvRows.length} rows from old TSV`);
    
    // Extract header from old TSV (first row)
    const oldTsvHeader = oldTsvRows[0];
    console.log(`  Old TSV has ${oldTsvHeader.length} columns`);
    
    // Build a lookup map from old TSV
    // Key: resource|||field -> array of entire rows (to support one-to-many mappings)
    const oldTsvMap = new Map();
    
    for (let i = 1; i < oldTsvRows.length; i++) {
        const row = oldTsvRows[i];
        const resource = row[1] || ''; // ExtEHR resource
        const field = row[2] || '';    // ExtEHR field
        const key = makeKey(resource, field);
        
        // Store rows as array to support one-to-many mappings
        if (!oldTsvMap.has(key)) {
            oldTsvMap.set(key, []);
        }
        oldTsvMap.get(key).push(row);
    }
    
    const totalMappings = Array.from(oldTsvMap.values()).reduce((sum, arr) => sum + arr.length, 0);
    console.log(`\nBuilt lookup map with ${oldTsvMap.size} unique elements`);
    console.log(`Total mapping rows: ${totalMappings}`);
    
    // Statistics
    let newElements = 0;
    let migratedElements = 0;
    let modifiedElements = 0;
    
    // Create new TSV rows
    const newTsvRows = [];
    
    // Add header (same as old TSV header)
    newTsvRows.push(oldTsvHeader);
    
    // Process each row from new CSV
    console.log('\nProcessing new CSV rows...');
    
    let rowNumber = 1; // Track row number across all output rows
    
    newCsvRows.forEach((csvRow, index) => {
        const resource = csvRow[0] || '';
        const field = csvRow[1] || '';
        const cardinality = csvRow[2] || '';
        const definition = csvRow[3] || '';
        const type = csvRow[4] || '';
        const binding = csvRow[5] || '';
        const short = csvRow[6] || '';
        
        const key = makeKey(resource, field);
        
        // Look up if this row existed in old TSV (may have multiple mappings)
        const oldRows = oldTsvMap.get(key);
        
        if (oldRows) {
            // Row exists - may have multiple mappings, create one output row for each
            oldRows.forEach((oldRow, mappingIndex) => {
                // Create the base TSV row from CSV data
                const newTsvRow = [
                    rowNumber.toString(), // Row number (No)
                    resource,               // ExtEHR resource
                    field,                  // ExtEHR field
                    cardinality,            // ExtEHR #
                    definition,             // ExtEHR description
                    type,                   // ExtEHR type
                    binding,                // Ext binding
                    short                   // ExtEHR source
                ];
                
                // Check if the data has changed
                const oldCardinality = oldRow[3] || '';
                const oldDefinition = oldRow[4] || '';
                const oldType = oldRow[5] || '';
                const oldBinding = oldRow[6] || '';
                const oldShort = oldRow[7] || '';
                
                const dataChanged = 
                    cardinality !== oldCardinality ||
                    definition !== oldDefinition ||
                    type !== oldType ||
                    binding !== oldBinding ||
                    short !== oldShort;
                
                if (dataChanged) {
                    modifiedElements++;
                } else {
                    migratedElements++;
                }
                
                // Copy all mapping columns from old TSV (starting at index 8)
                for (let i = 8; i < oldTsvHeader.length; i++) {
                    newTsvRow.push(oldRow[i] || '');
                }
                
                newTsvRows.push(newTsvRow);
                rowNumber++;
            });
        } else {
            // New row - add empty mapping columns
            newElements++;
            
            // Create the base TSV row from CSV data
            const newTsvRow = [
                rowNumber.toString(), // Row number (No)
                resource,               // ExtEHR resource
                field,                  // ExtEHR field
                cardinality,            // ExtEHR #
                definition,             // ExtEHR description
                type,                   // ExtEHR type
                binding,                // Ext binding
                short                   // ExtEHR source
            ];
            
            // Add empty columns for all mapping fields
            for (let i = 8; i < oldTsvHeader.length; i++) {
                newTsvRow.push('');
            }
            
            newTsvRows.push(newTsvRow);
            rowNumber++;
        }
    });
    
    // Write the new TSV file
    console.log(`\nWriting migrated TSV to: ${outputTsvPath}`);
    const outputContent = newTsvRows.map(row => row.join('\t')).join('\n');
    fs.writeFileSync(outputTsvPath, outputContent, 'utf8');
    
    // Collect new elements with details
    const newElementsList = [];
    newTsvRows.forEach((row, index) => {
        if (index === 0) return; // Skip header
        
        const resource = row[1];
        const field = row[2];
        const cardinality = row[3];
        const type = row[5];
        const key = makeKey(resource, field);
        
        if (!oldTsvMap.has(key)) {
            newElementsList.push({
                resource,
                field,
                cardinality,
                type,
                fullPath: field ? `${resource}.${field}` : resource
            });
        }
    });
    
    // Collect removed elements with details
    const removedElementsList = [];
    oldTsvMap.forEach((rows, key) => {
        // rows is now an array - just use the first row for element info
        const row = rows[0];
        const resource = row[1];
        const field = row[2];
        const cardinality = row[3];
        const type = row[5];
        const newKey = makeKey(resource, field);
        
        // Check if this key exists in new CSV
        let found = false;
        for (const csvRow of newCsvRows) {
            const csvKey = makeKey(csvRow[0] || '', csvRow[1] || '');
            if (csvKey === newKey) {
                found = true;
                break;
            }
        }
        
        if (!found) {
            removedElementsList.push({
                resource,
                field,
                cardinality,
                type,
                fullPath: field ? `${resource}.${field}` : resource
            });
        }
    });
    
    // Write detailed log file
    const logPath = path.join(__dirname, 'migration-log.txt');
    const logLines = [];
    
    logLines.push('='.repeat(80));
    logLines.push('XtEHR MODEL MIGRATION LOG');
    logLines.push('Migration from version 0.2.0 to 0.3.0');
    logLines.push('Generated: ' + new Date().toISOString());
    logLines.push('='.repeat(80));
    logLines.push('');
    
    logLines.push('SUMMARY');
    logLines.push('-'.repeat(80));
    logLines.push(`Total rows in new CSV:        ${newCsvRows.length}`);
    logLines.push(`Total rows in old TSV:        ${oldTsvRows.length - 1} (excluding header)`);
    logLines.push(`Total rows in migrated TSV:   ${newTsvRows.length - 1} (excluding header)`);
    logLines.push('');
    logLines.push(`Migrated (unchanged):         ${migratedElements}`);
    logLines.push(`Migrated (data modified):     ${modifiedElements}`);
    logLines.push(`New elements:                 ${newElements}`);
    logLines.push(`Removed elements:             ${removedElementsList.length}`);
    logLines.push('');
    logLines.push('='.repeat(80));
    logLines.push('');
    
    // Added elements
    logLines.push(`NEW ELEMENTS (${newElementsList.length})`);
    logLines.push('-'.repeat(80));
    logLines.push('');
    
    // Group by resource
    const newByResource = new Map();
    newElementsList.forEach(elem => {
        if (!newByResource.has(elem.resource)) {
            newByResource.set(elem.resource, []);
        }
        newByResource.get(elem.resource).push(elem);
    });
    
    // Sort resources alphabetically
    const sortedNewResources = Array.from(newByResource.keys()).sort();
    
    sortedNewResources.forEach(resource => {
        const elements = newByResource.get(resource);
        logLines.push(`${resource} (${elements.length} new elements)`);
        elements.forEach(elem => {
            const fieldDisplay = elem.field || '(root)';
            logLines.push(`  - ${fieldDisplay.padEnd(60)} [${elem.cardinality}] ${elem.type}`);
        });
        logLines.push('');
    });
    
    logLines.push('='.repeat(80));
    logLines.push('');
    
    // Removed elements
    logLines.push(`REMOVED ELEMENTS (${removedElementsList.length})`);
    logLines.push('-'.repeat(80));
    logLines.push('');
    
    // Group by resource
    const removedByResource = new Map();
    removedElementsList.forEach(elem => {
        if (!removedByResource.has(elem.resource)) {
            removedByResource.set(elem.resource, []);
        }
        removedByResource.get(elem.resource).push(elem);
    });
    
    // Sort resources alphabetically
    const sortedRemovedResources = Array.from(removedByResource.keys()).sort();
    
    sortedRemovedResources.forEach(resource => {
        const elements = removedByResource.get(resource);
        logLines.push(`${resource} (${elements.length} removed elements)`);
        elements.forEach(elem => {
            const fieldDisplay = elem.field || '(root)';
            logLines.push(`  - ${fieldDisplay.padEnd(60)} [${elem.cardinality}] ${elem.type}`);
        });
        logLines.push('');
    });
    
    logLines.push('='.repeat(80));
    logLines.push('END OF LOG');
    logLines.push('='.repeat(80));
    
    fs.writeFileSync(logPath, logLines.join('\n'), 'utf8');
    console.log(`\nDetailed log written to: ${logPath}`);
    
    // Report statistics
    console.log('\n' + '='.repeat(80));
    console.log('MIGRATION SUMMARY');
    console.log('='.repeat(80));
    console.log(`Total rows in new CSV:        ${newCsvRows.length}`);
    console.log(`Total rows in old TSV:        ${oldTsvRows.length - 1} (excluding header)`);
    console.log(`Total rows in migrated TSV:   ${newTsvRows.length - 1} (excluding header)`);
    console.log('');
    console.log(`✅ Migrated (unchanged):      ${migratedElements}`);
    console.log(`🔄 Migrated (data modified):  ${modifiedElements}`);
    console.log(`⭐ New elements:              ${newElements}`);
    console.log(`❌ Removed elements:          ${oldTsvRows.length - 1 - migratedElements - modifiedElements}`);
    console.log('');
    console.log('✅ Migration complete!');
    console.log(`\nOutput file: ${outputTsvPath}`);
    console.log(`Log file:    ${logPath}`);
    console.log('='.repeat(80));
    
    // Show some examples of new elements (already have detailed list)
    if (newElements > 0 && newElementsList.length > 0) {
        console.log('\nSample of NEW elements (first 10):');
        let count = 0;
        newElementsList.slice(0, 10).forEach(elem => {
            console.log(`  - ${elem.fullPath}`);
        });
    }
    
    // Show some examples of removed elements (already have detailed list)
    if (removedElementsList.length > 0) {
        console.log(`\nSample of REMOVED elements (first 10 of ${removedElementsList.length}):`);
        removedElementsList.slice(0, 10).forEach(elem => {
            console.log(`  - ${elem.fullPath}`);
        });
    }
}

// Execute
if (require.main === module) {
    try {
        migrateMappingTsv();
    } catch (error) {
        console.error('Error during migration:', error);
        process.exit(1);
    }
}
