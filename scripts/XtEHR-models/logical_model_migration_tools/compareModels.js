const fs = require('fs');
const path = require('path');

// Parse CSV file into structured data
function parseCSV(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const rows = content.split('\n')
        .filter(row => row.trim().length > 0)
        .map(row => row.split(';').map(cell => cell.trim()));
    return rows;
}

// Group rows by resource name
function groupByResource(rows) {
    const resources = new Map();
    
    rows.forEach(row => {
        const resourceName = row[0];
        if (!resources.has(resourceName)) {
            resources.set(resourceName, []);
        }
        resources.get(resourceName).push({
            resource: row[0],
            field: row[1],
            cardinality: row[2],
            definition: row[3],
            type: row[4],
            binding: row[5],
            short: row[6]
        });
    });
    
    return resources;
}

// Compare two resources
function compareResources(oldResource, newResource, resourceName) {
    console.log(`\n${'='.repeat(80)}`);
    console.log(`COMPARING: ${resourceName}`);
    console.log('='.repeat(80));
    
    if (!oldResource && !newResource) {
        console.log('ERROR: Both versions missing!');
        return;
    }
    
    if (!oldResource) {
        console.log('⭐ NEW RESOURCE (did not exist in 0.2.0)');
        console.log(`   Total fields: ${newResource.length}`);
        return;
    }
    
    if (!newResource) {
        console.log('❌ REMOVED RESOURCE (existed in 0.2.0 but not in 0.3.0)');
        console.log(`   Had ${oldResource.length} fields`);
        return;
    }
    
    // Create maps for easier comparison
    const oldFields = new Map();
    const newFields = new Map();
    
    oldResource.forEach(item => {
        const key = item.field || '(root)';
        oldFields.set(key, item);
    });
    
    newResource.forEach(item => {
        const key = item.field || '(root)';
        newFields.set(key, item);
    });
    
    // Find added fields
    const added = [];
    newFields.forEach((value, key) => {
        if (!oldFields.has(key)) {
            added.push(key);
        }
    });
    
    // Find removed fields
    const removed = [];
    oldFields.forEach((value, key) => {
        if (!newFields.has(key)) {
            removed.push(key);
        }
    });
    
    // Find modified fields
    const modified = [];
    newFields.forEach((newValue, key) => {
        if (oldFields.has(key)) {
            const oldValue = oldFields.get(key);
            if (JSON.stringify(oldValue) !== JSON.stringify(newValue)) {
                modified.push({
                    field: key,
                    old: oldValue,
                    new: newValue
                });
            }
        }
    });
    
    // Print summary
    console.log(`\n📊 SUMMARY:`);
    console.log(`   Total fields in 0.2.0: ${oldFields.size}`);
    console.log(`   Total fields in 0.3.0: ${newFields.size}`);
    console.log(`   Added: ${added.length}`);
    console.log(`   Removed: ${removed.length}`);
    console.log(`   Modified: ${modified.length}`);
    
    // Print details
    if (added.length > 0) {
        console.log(`\n✅ ADDED FIELDS (${added.length}):`);
        added.forEach(field => {
            const item = newFields.get(field);
            console.log(`   + ${field || '(root)'}`);
            console.log(`     Type: ${item.type}`);
            console.log(`     Cardinality: ${item.cardinality}`);
            console.log(`     Definition: ${item.definition.substring(0, 100)}${item.definition.length > 100 ? '...' : ''}`);
        });
    }
    
    if (removed.length > 0) {
        console.log(`\n❌ REMOVED FIELDS (${removed.length}):`);
        removed.forEach(field => {
            const item = oldFields.get(field);
            console.log(`   - ${field || '(root)'}`);
            console.log(`     Type: ${item.type}`);
            console.log(`     Cardinality: ${item.cardinality}`);
        });
    }
    
    if (modified.length > 0) {
        console.log(`\n🔄 MODIFIED FIELDS (${modified.length}):`);
        modified.forEach(mod => {
            console.log(`   ~ ${mod.field || '(root)'}`);
            
            if (mod.old.cardinality !== mod.new.cardinality) {
                console.log(`     Cardinality: ${mod.old.cardinality} → ${mod.new.cardinality}`);
            }
            if (mod.old.type !== mod.new.type) {
                console.log(`     Type: ${mod.old.type} → ${mod.new.type}`);
            }
            if (mod.old.definition !== mod.new.definition) {
                console.log(`     Definition changed:`);
                console.log(`       OLD: ${mod.old.definition.substring(0, 80)}...`);
                console.log(`       NEW: ${mod.new.definition.substring(0, 80)}...`);
            }
            if (mod.old.binding !== mod.new.binding) {
                console.log(`     Binding: ${mod.old.binding} → ${mod.new.binding}`);
            }
        });
    }
}

// Main function
function main() {
    const oldFile = path.join(__dirname, 'xtehr-model.0.2.0.csv');
    const newFile = path.join(__dirname, 'xtehr-model.csv');
    
    console.log('Reading CSV files...');
    console.log(`  Old: ${oldFile}`);
    console.log(`  New: ${newFile}`);
    
    const oldRows = parseCSV(oldFile);
    const newRows = parseCSV(newFile);
    
    const oldResources = groupByResource(oldRows);
    const newResources = groupByResource(newRows);
    
    // Get resources to compare from command line or default to the two specified
    const resourcesToCompare = process.argv.length > 2 
        ? process.argv.slice(2)
        : ['EHDSImagingReport', 'EHDSImagingStudy'];
    
    console.log(`\nComparing resources: ${resourcesToCompare.join(', ')}\n`);
    
    resourcesToCompare.forEach(resourceName => {
        compareResources(
            oldResources.get(resourceName),
            newResources.get(resourceName),
            resourceName
        );
    });
    
    console.log(`\n${'='.repeat(80)}\n`);
    console.log('✅ Comparison complete!\n');
}

// Execute
if (require.main === module) {
    main();
}
