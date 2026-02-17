const fs = require('fs');
const path = require('path');

const obligationsDirs = {
    r5: '../ig-src/input/fsh/obligations',
    r4: '../ig-src/input/fsh/obligations'
};
const mappingTablesDir   = '../ig-src/input/pagecontent/';	
const xtehrDir           = '../input/resources';	
const conceptMapIntroDir = '../input/intro-notes';

// Indices for relevant columns
const indices = {
    srcResource: 1,
    srcField: 2,
    srcDescription: 4,
    srcType: 5,
    srcReq:7,
    tgtResource: 8,
    tgtElement: 9,
    tgtEquivalence: 10,
    tgtRationale: 11,
    tgtRefType: 12,
    includeAsWell: 13,
    tgtModeling: 14,
    obligationProducerR5: 16,
    obligationConsumerR5: 17,
    section: 18,
    tgtResourceR4: 19,
    tgtElementR4: 20,
    tgtEquivalenceR4: 21,
    tgtModelingR4: 25,
    obligationProducerR4: 27,
    obligationConsumerR4: 28,
    sectionR4: 29,
};

const XtEHRBaseUrl = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/";

// Configuration: Define which models are considered "core" for this IG
const CORE_MODELS = [
    'EHDSImagingReport',
    'EHDSImagingStudy'
    // Add other core models here as needed
];

function extractAndCopyResources(parsedData, srcResources ) {
    // Extract unique source resources
    

    // Copy XtEHR resources
    const srcModel = new Set(
    parsedData
        .filter(row => row[indices.srcResource]?.startsWith('EHDS'))
        .filter(row => row[indices.tgtResource]?.length > 0)
        .map(row => row[indices.srcResource])
    );
    srcModel.forEach(srcResource => {
    console.log(`XtEHR-models/StructureDefinition-${srcResource}.json -> ${xtehrDir}/StructureDefinition-${srcResource}.json`);
    fs.copyFile(
        `XtEHR-models/StructureDefinition-${srcResource}.json`,
        `${xtehrDir}/StructureDefinition-${srcResource}.json`,
        (err) => {}
    );
    });
}
// function generateCodeSystem(parsedData, srcResources) {
//     srcResources.forEach(srcResource => {

//         const codesystemfile = `${conceptMapDir}/XtEhrCodeSystem.fsh`;
//         console.log(codesystemfile);
//         const writable = fs.createWriteStream(codesystemfile);
//         writable.write(`////////////////////////////////////////////////////\n`);
//         writable.write(`// Generated file. Do not edit.\n`);
//         writable.write(`////////////////////////////////////////////////////\n`);
//         writable.write(`\n`);
//         writable.write(`Instance: XtEhrCodeSystem\n`);
//         writable.write(`InstanceOf: CodeSystem\n`);
//         writable.write(`Title: "XtEhrCodeSystem"\n`);
//         writable.write(`Description: """CodeSystem with all XtEHR fields"""\n`);
//         writable.write(`* ^experimental = true\n`);
//         writable.write(`* ^status = #draft\n`);
//         writable.write(`* ^caseSensitive = true\n`);
//         writable.write(`* ^hierarchyMeaning = #is-a\n`);

//         parsedData.forEach(row => {
//             const codes = new Set();
//             if ( row[indices.srcResource] && row[indices.srcResource].startsWith('EHDS') && row[indices.srcField].length > 0 ) {
//                 const code = `${row[indices.srcResource]}.${row[indices.srcField].trim()}`;
//                 const display = row[indices.srcDescription].trim();
//                 const description = `${display}`;
//                 codes.add( `* #${code} "${display}"  "${description}"\n`); 
//             }
//             codes.forEach(code => {
//                 writable.write(code);
//             });
//         });

//         writable.write(`\n`);
//         writable.write(`////////////////////////////////////////////////////\n`);
//         writable.end();
//     });
//     srcResources.forEach(srcResource => {
//             const conceptMapPath = `${conceptMapDir}/ValueSet_${srcResource}.fsh`;
//             console.log(conceptMapPath);
//             const writable = fs.createWriteStream(conceptMapPath);

//             writable.write(`////////////////////////////////////////////////////\n`);
//             writable.write(`// Generated file. Do not edit.\n`);
//             writable.write(`////////////////////////////////////////////////////\n`);
//             writable.write(`\n`);
//             writable.write(`ValueSet: ${srcResource}Vs\n`);
//             writable.write(`Title: "VS for ${srcResource}"\n`);
//             writable.write(`Description: "VS for ${srcResource}"\n`);
//             writable.write(`\n`);
//             writable.write(`* ^experimental = true\n`);
//             writable.write(`* ^status = #draft\n`);

//             codes = new Set();
//             parsedData.forEach(row => {
//                 if ( row[indices.srcResource] === srcResource && row[indices.srcField].length > 0 ) {
//                     const code = `${row[indices.srcResource]}.${row[indices.srcField].trim()}`;
//                     const display = row[indices.srcDescription].trim();
//                     const description = `${display}`;
//                     codes.add( `* XtEhrCodeSystem#${code} \n`);
//                 }
//             });
//             codes.forEach(code => {
//                 writable.write(code);
//             });                
//             writable.write(`\n`);
//             writable.write(`////////////////////////////////////////////////////\n`);
//             writable.end();
//     });

// }

// Helper function to escape XML special characters
function escapeXml(unsafe) {
    if (!unsafe) return '';
    return unsafe.toString()
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&apos;');
}

// Helper function to map equivalence codes to display text
function getEquivalenceDisplay(code) {
    const map = {
        "EQ": "equivalent",
        "SB": "source-is-broader-than-target",
        "TB": "source-is-narrower-than-target",
        "RT": "related-to",
        "": ""
    };
    return map[code] || code || "";
}

// Generate XML mapping table for a single resource
function generateXmlMappingTable(parsedData, srcResource, isR4) {
    const rows = parsedData
        .filter(row => row[indices.srcResource] === srcResource)
        .filter(row => row[indices.srcField] && row[indices.srcField].length > 0);
    
    const fileExt = isR4 ? '.r4.xml' : '.r5.xml';
    const mappingTablePath = `${mappingTablesDir}/map-${srcResource.toLowerCase()}${fileExt}`;
    console.log(mappingTablePath);
    
    const writable = fs.createWriteStream(mappingTablePath);
    
    // Write XML header
    writable.write(`<?xml version="1.0" encoding="UTF-8"?>\n`);
    writable.write(`<div xmlns="http://www.w3.org/1999/xhtml">\n`);
    writable.write(`  <head>\n`);
    writable.write(`    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />\n`);
    writable.write(`    <title>${escapeXml(srcResource)} → FHIR Profiles</title>\n`);
    writable.write(`  </head>\n`);
    writable.write(`  <body>\n`);
    
    // Callout boxes
    writable.write(`    <div class="model-map-block">\n`);
    writable.write(`      <div class="callout-wrapper">\n`);
    writable.write(`        <div class="callout-box">\n`);
    writable.write(`          <strong>Ongoing alignment:</strong>\n`);
    writable.write(`              The Xt-EHR logical models are under active revision and continuous refinement.\n`);
    writable.write(`              Updates from Xt-EHR will be progressively incorporated into this Implementation\n`);
    writable.write(`              Guide to maintain alignment with the evolving EHDS specifications.\n`);
    writable.write(`        </div>\n`);
    writable.write(`      </div>\n`);
    writable.write(`    </div>\n`);
    
    writable.write(`    <h3>${escapeXml(srcResource)} → FHIR Profiles</h3>\n`);
    writable.write(`    <a> </a>\n`);
    writable.write(`    <p></p>\n`);
    writable.write(`    <p>\n`);
    writable.write(`  This page explains how conceptual elements from the EHDS logical model are expressed\n`);
    writable.write(`  in the corresponding FHIR profiles used by this Implementation Guide.\n`);
    writable.write(`    </p>\n`);
    writable.write(`    <p></p>\n`);
    
    // Mapping context
    writable.write(`    <div class="table-wrap">\n`);
    writable.write(`      <strong>Mapping Context</strong>\n`);
    writable.write(`      <ul>\n`);
    writable.write(`        <li>\n`);
    writable.write(`          <strong>Source logical model:</strong>\n`);
    writable.write(`          <a href="https://www.xt-ehr.eu/fhir/models/StructureDefinition/${escapeXml(srcResource)}" target="_blank">\n`);
    writable.write(`        ${escapeXml(srcResource)}\n`);
    writable.write(`          </a>\n`);
    writable.write(`        </li>\n`);
    writable.write(`        <li>\n`);
    writable.write(`          <strong>Target FHIR version:</strong> ${isR4 ? 'R4' : 'R5'}\n`);
    writable.write(`        </li>\n`);
    writable.write(`      </ul>\n`);
    writable.write(`    </div>\n`);
    writable.write(`    <p></p>\n`);
    
    // Table
    writable.write(`    <div class="table-wrap">\n`);
    writable.write(`      <table summary="${escapeXml(srcResource)} → FHIR Profiles">\n`);
    writable.write(`        <caption>${escapeXml(srcResource)} → FHIR Profiles</caption>\n`);
    writable.write(`        <thead>\n`);
    
    // Header row 1
    writable.write(`          <tr>\n`);
    writable.write(`            <th colspan="2" class="src-head">${escapeXml(srcResource)} (Logical Model)</th>\n`);
    writable.write(`            <th class="relhead">Relationship</th>\n`);
    writable.write(`            <th colspan="4" class="tgt-head">Target FHIR Resource</th>\n`);
    writable.write(`          </tr>\n`);
    
    // Header row 2
    writable.write(`          <tr>\n`);
    writable.write(`            <th class="src-sub">Element</th>\n`);
    writable.write(`            <th class="src-sub">Description</th>\n`);
    writable.write(`            <th class="relsub">Relation</th>\n`);
    writable.write(`            <th class="tgt-sub">Resource</th>\n`);
    writable.write(`            <th class="tgt-sub">Element</th>\n`);
    writable.write(`            <th class="tgt-sub">Notes</th>\n`);
    writable.write(`          </tr>\n`);
    writable.write(`        </thead>\n`);
    writable.write(`        <tbody>\n`);
    
    // Data rows
    rows.forEach(row => {
        const srcField = escapeXml(row[indices.srcField].trim());
        const srcDescription = escapeXml(row[indices.srcDescription] ? row[indices.srcDescription].trim() : '');
        const equivalence = isR4 
            ? getEquivalenceDisplay(row[indices.tgtEquivalenceR4] ? row[indices.tgtEquivalenceR4].trim() : '')
            : getEquivalenceDisplay(row[indices.tgtEquivalence] ? row[indices.tgtEquivalence].trim() : '');
        const tgtResource = isR4 
            ? escapeXml(row[indices.tgtResourceR4] ? row[indices.tgtResourceR4].trim() : '')
            : escapeXml(row[indices.tgtResource] ? row[indices.tgtResource].trim() : '');
        const tgtElement = isR4 
            ? escapeXml(row[indices.tgtElementR4] ? row[indices.tgtElementR4].trim() : '')
            : escapeXml(row[indices.tgtElement] ? row[indices.tgtElement].trim() : '');
        const notes = escapeXml(row[indices.tgtModeling] ? row[indices.tgtModeling].trim() : '');
        
        writable.write(`          <tr>\n`);
        writable.write(`            <td>${srcField}</td>\n`);
        writable.write(`            <td>${srcDescription}</td>\n`);
        writable.write(`            <td>${equivalence}</td>\n`);
        writable.write(`            <td>${tgtResource}</td><td>${tgtElement}</td>\n`);
        writable.write(`            <td>${notes}</td>\n`);
        writable.write(`          </tr>\n`);
    });
    
    writable.write(`        </tbody>\n`);
    writable.write(`      </table>\n`);
    writable.write(`    </div>\n`);
    
    // Footer
    writable.write(`    <p style="margin-top:2rem;color:#555;">\n`);
    writable.write(`      Return to overview: <a href="xtehr-mapping.html">EHDS Logical Models → FHIR Profiles</a>\n`);
    writable.write(`    </p>\n`);
    writable.write(`  </body>\n`);
    writable.write(`</div>\n`);
    
    writable.end();
    
    return `map-${srcResource.toLowerCase()}${fileExt}`;
}

// Generate styled HTML table within markdown for a single resource
function generateStyledMarkdownTable(parsedData, srcResource) {
    const rows = parsedData
        .filter(row => row[indices.srcResource] === srcResource)
        .filter(row => row[indices.srcField] && row[indices.srcField].length > 0);
    
    const mappingTablePath = `${mappingTablesDir}/${srcResource}-mapping.liquid.md`;
    console.log(mappingTablePath);
    
    const writable = fs.createWriteStream(mappingTablePath);
    
    // Write markdown header
    writable.write(`<!--\n`);
    writable.write(`  Generated file. Do not edit.\n`);
    writable.write(`-->\n\n`);
    
    writable.write(`#### ${srcResource}\n\n`);
    
    // Callout boxes
    writable.write(`<div class="model-map-block">\n`);
    writable.write(`  <div class="callout-wrapper">\n`);
    writable.write(`    <div class="callout-box">\n`);
    writable.write(`      <strong>Ongoing alignment:</strong>\n`);
    writable.write(`      The Xt-EHR logical models are under active revision and continuous refinement.\n`);
    writable.write(`      Updates from Xt-EHR will be progressively incorporated into this Implementation\n`);
    writable.write(`      Guide to maintain alignment with the evolving EHDS specifications.\n`);
    writable.write(`    </div>\n`);
    writable.write(`  </div>\n`);
    writable.write(`</div>\n\n`);
    
    writable.write(`The following table shows the mapping from ${srcResource} logical model elements to FHIR profiles.\n\n`);
    
    // Mapping context
    writable.write(`<div class="table-wrap">\n`);
    writable.write(`  <strong>Mapping Context</strong>\n`);
    writable.write(`  <ul>\n`);
    writable.write(`    <li>\n`);
    writable.write(`      <strong>Source logical model:</strong>\n`);
    writable.write(`      <a href="https://www.xt-ehr.eu/fhir/models/StructureDefinition/${escapeXml(srcResource)}" target="_blank">${escapeXml(srcResource)}</a>\n`);
    writable.write(`    </li>\n`);
    writable.write(`  </ul>\n`);
    writable.write(`</div>\n\n`);
    
    // R4 Table
    writable.write(`{% if isR4 %}\n\n`);
    writable.write(`<div class="table-wrap">\n`);
    writable.write(`  <table summary="${escapeXml(srcResource)} → FHIR Profiles (R4)">\n`);
    writable.write(`    <caption>${escapeXml(srcResource)} → FHIR Profiles (R4)</caption>\n`);
    writable.write(`    <thead>\n`);
    writable.write(`      <tr>\n`);
    writable.write(`        <th colspan="2" class="src-head">${escapeXml(srcResource)} (Logical Model)</th>\n`);
    writable.write(`        <th class="relhead">Relationship</th>\n`);
    writable.write(`        <th colspan="3" class="tgt-head">Target FHIR Resource</th>\n`);
    writable.write(`      </tr>\n`);
    writable.write(`      <tr>\n`);
    writable.write(`        <th class="src-sub">Element</th>\n`);
    writable.write(`        <th class="src-sub">Description</th>\n`);
    writable.write(`        <th class="relsub">Relation</th>\n`);
    writable.write(`        <th class="tgt-sub">Resource</th>\n`);
    writable.write(`        <th class="tgt-sub">Element</th>\n`);
    writable.write(`        <th class="tgt-sub">Notes</th>\n`);
    writable.write(`      </tr>\n`);
    writable.write(`    </thead>\n`);
    writable.write(`    <tbody>\n`);
    
    // R4 Data rows
    rows.forEach(row => {
        const srcField = escapeXml(row[indices.srcField].trim());
        const srcDescription = escapeXml(row[indices.srcDescription] ? row[indices.srcDescription].trim() : '');
        const equivalence = getEquivalenceDisplay(row[indices.tgtEquivalenceR4] ? row[indices.tgtEquivalenceR4].trim() : '');
        const tgtResource = escapeXml(row[indices.tgtResourceR4] ? row[indices.tgtResourceR4].trim() : '');
        const tgtElement = escapeXml(row[indices.tgtElementR4] ? row[indices.tgtElementR4].trim() : '');
        const notes = escapeXml(row[indices.tgtModeling] ? row[indices.tgtModeling].trim() : '');
        
        writable.write(`      <tr>\n`);
        writable.write(`        <td>${srcField}</td>\n`);
        writable.write(`        <td>${srcDescription}</td>\n`);
        writable.write(`        <td>${equivalence}</td>\n`);
        writable.write(`        <td>${tgtResource}</td>\n`);
        writable.write(`        <td>${tgtElement}</td>\n`);
        writable.write(`        <td>${notes}</td>\n`);
        writable.write(`      </tr>\n`);
    });
    
    writable.write(`    </tbody>\n`);
    writable.write(`  </table>\n`);
    writable.write(`</div>\n\n`);
    writable.write(`{% endif %}\n\n`);
    
    // R5 Table
    writable.write(`{% if isR5 %}\n\n`);
    writable.write(`<div class="table-wrap">\n`);
    writable.write(`  <table summary="${escapeXml(srcResource)} → FHIR Profiles (R5)">\n`);
    writable.write(`    <caption>${escapeXml(srcResource)} → FHIR Profiles (R5)</caption>\n`);
    writable.write(`    <thead>\n`);
    writable.write(`      <tr>\n`);
    writable.write(`        <th colspan="2" class="src-head">${escapeXml(srcResource)} (Logical Model)</th>\n`);
    writable.write(`        <th class="relhead">Relationship</th>\n`);
    writable.write(`        <th colspan="3" class="tgt-head">Target FHIR Resource</th>\n`);
    writable.write(`      </tr>\n`);
    writable.write(`      <tr>\n`);
    writable.write(`        <th class="src-sub">Element</th>\n`);
    writable.write(`        <th class="src-sub">Description</th>\n`);
    writable.write(`        <th class="relsub">Relation</th>\n`);
    writable.write(`        <th class="tgt-sub">Resource</th>\n`);
    writable.write(`        <th class="tgt-sub">Element</th>\n`);
    writable.write(`        <th class="tgt-sub">Notes</th>\n`);
    writable.write(`      </tr>\n`);
    writable.write(`    </thead>\n`);
    writable.write(`    <tbody>\n`);
    
    // R5 Data rows
    rows.forEach(row => {
        const srcField = escapeXml(row[indices.srcField].trim());
        const srcDescription = escapeXml(row[indices.srcDescription] ? row[indices.srcDescription].trim() : '');
        const equivalence = getEquivalenceDisplay(row[indices.tgtEquivalence] ? row[indices.tgtEquivalence].trim() : '');
        const tgtResource = escapeXml(row[indices.tgtResource] ? row[indices.tgtResource].trim() : '');
        const tgtElement = escapeXml(row[indices.tgtElement] ? row[indices.tgtElement].trim() : '');
        const notes = escapeXml(row[indices.tgtModeling] ? row[indices.tgtModeling].trim() : '');
        
        writable.write(`      <tr>\n`);
        writable.write(`        <td>${srcField}</td>\n`);
        writable.write(`        <td>${srcDescription}</td>\n`);
        writable.write(`        <td>${equivalence}</td>\n`);
        writable.write(`        <td>${tgtResource}</td>\n`);
        writable.write(`        <td>${tgtElement}</td>\n`);
        writable.write(`        <td>${notes}</td>\n`);
        writable.write(`      </tr>\n`);
    });
    
    writable.write(`    </tbody>\n`);
    writable.write(`  </table>\n`);
    writable.write(`</div>\n\n`);
    writable.write(`{% endif %}\n\n`);
    
    writable.end();
    
    return `${srcResource}-mapping.md`;
}

function generateMappingTables(parsedData, srcResources) {
    // Store all generated files for the main index
    const generatedFiles = [];
    
    // First, remove any existing mapping files that we don't want to keep
    console.log("Removing old mapping files...");
    fs.readdirSync(mappingTablesDir).forEach(file => {
        const isMappingFile = (file.endsWith('-mapping.md') || file.endsWith('-mapping.liquid.md') || 
                               file.startsWith('map-') && file.endsWith('.xml'));
        if (isMappingFile && file !== 'xtehr-mapping.md') {
            // Only keep files for core models
            const resourceName = file
                .replace('-mapping.liquid.md', '')
                .replace('-mapping.md', '')
                .replace('map-', '')
                .replace('.r4.xml', '')
                .replace('.r5.xml', '')
                .replace('.xml', '');
            
            // Convert to proper case for comparison
            const matchesCore = CORE_MODELS.some(core => 
                core.toLowerCase() === resourceName.toLowerCase()
            );
            
            if (!matchesCore) {
                const filePath = path.join(mappingTablesDir, file);
                fs.unlinkSync(filePath);
                console.log(`Removed ${filePath}`);
            }
        }
    });
    
    // We need to categorize resources into:
    // 1. Core resources (in CORE_MODELS) -> Generate .md files
    // 2. Resources with actor 'R' but not in CORE_MODELS -> List in separate section, no .md files
    // 3. Resources without actor 'R' -> List as "not included"
    const coreResources = [];
    const nonCoreWithR = [];
    const resourcesWithoutR = [];
    
    srcResources.forEach(srcResource => {
        const hasAnyObligation = parsedData
            .filter(row => row[indices.srcResource] === srcResource)
            .some(row => {
                const r5Producer = row[indices.obligationProducerR5] ? row[indices.obligationProducerR5].trim() : '';
                const r5Consumer = row[indices.obligationConsumerR5] ? row[indices.obligationConsumerR5].trim() : '';
                const r4Producer = row[indices.obligationProducerR4] ? row[indices.obligationProducerR4].trim() : '';
                const r4Consumer = row[indices.obligationConsumerR4] ? row[indices.obligationConsumerR4].trim() : '';
                return r5Producer.length > 0 || r5Consumer.length > 0 || r4Producer.length > 0 || r4Consumer.length > 0;
            });
        
        if (CORE_MODELS.includes(srcResource)) {
            coreResources.push(srcResource);
        } else if (hasAnyObligation) {
            nonCoreWithR.push(srcResource);
        } else {
            resourcesWithoutR.push(srcResource);
        }
    });
    
    coreResources.forEach(srcResource => {
        // Create a hash table to store mappings: srcField -> array of target mappings
        const mappingTable = new Map();
        
        // Get all source fields for this resource in their original order
        const srcFieldsWithOrder = [];
        const seenFields = new Set();
        
        parsedData.forEach((row, index) => {
            if (row[indices.srcResource] === srcResource && 
                row[indices.srcField] && 
                row[indices.srcField].length > 0) {
                const srcField = row[indices.srcField].trim();
                if (!seenFields.has(srcField)) {
                    srcFieldsWithOrder.push({ field: srcField, originalIndex: index });
                    seenFields.add(srcField);
                }
            }
        });
        
        // Initialize the mapping table with all source fields
        srcFieldsWithOrder.forEach(({ field }) => {
            mappingTable.set(field, []);
        });
        
        // Populate the mapping table with target mappings and collect source type info
        const sourceTypeMap = new Map(); // srcField -> array of srcTypes
        const modelingMap = new Map(); // srcField -> tgtModeling
        const mappingTableR4 = new Map(); // srcField -> array of R4 target mappings
        
        // Initialize R4 mapping table
        srcFieldsWithOrder.forEach(({ field }) => {
            mappingTableR4.set(field, []);
        });
        
        parsedData
            .filter(row => row[indices.srcResource] === srcResource)
            .filter(row => row[indices.srcField] && row[indices.srcField].length > 0)
            .forEach(row => {
                const srcField = row[indices.srcField].trim();
                const srcType = row[indices.srcType] ? row[indices.srcType].trim() : '';
                const tgtModeling = row[indices.tgtModeling] ? row[indices.tgtModeling].trim() : '';
                
                // Store the source types for hyperlink generation (can be multiple for [x] fields)
                if (srcType.length > 0) {
                    if (!sourceTypeMap.has(srcField)) {
                        sourceTypeMap.set(srcField, []);
                    }
                    const existingTypes = sourceTypeMap.get(srcField);
                    if (!existingTypes.includes(srcType)) {
                        existingTypes.push(srcType);
                    }
                }
                
                // Store the tgtModeling value
                if (tgtModeling.length > 0) {
                    modelingMap.set(srcField, tgtModeling);
                }
                
                // Process target mappings (R5)
                if (row[indices.tgtResource] && row[indices.tgtResource].length > 0 && 
                    row[indices.tgtElement] && row[indices.tgtElement].length > 0) {
                    const tgtResource = row[indices.tgtResource].trim();
                    const tgtElement = row[indices.tgtElement].trim();
                    const targetMapping = `${tgtResource}.${tgtElement}`;
                    
                    if (mappingTable.has(srcField)) {
                        // Avoid duplicates
                        const existingMappings = mappingTable.get(srcField);
                        if (!existingMappings.includes(targetMapping)) {
                            existingMappings.push(targetMapping);
                        }
                    }
                }
                
                // Process R4 target mappings
                if (row[indices.tgtResourceR4] && row[indices.tgtResourceR4].length > 0 && 
                    row[indices.tgtElementR4] && row[indices.tgtElementR4].length > 0) {
                    const tgtResourceR4 = row[indices.tgtResourceR4].trim();
                    const tgtElementR4 = row[indices.tgtElementR4].trim();
                    const targetMappingR4 = `${tgtResourceR4}.${tgtElementR4}`;
                    
                    if (mappingTableR4.has(srcField)) {
                        // Avoid duplicates
                        const existingMappingsR4 = mappingTableR4.get(srcField);
                        if (!existingMappingsR4.includes(targetMappingR4)) {
                            existingMappingsR4.push(targetMappingR4);
                        }
                    }
                }
            });
        
        // Generate the styled markdown file with HTML tables
        const filename = generateStyledMarkdownTable(parsedData, srcResource);
        
        // Store for index generation
        generatedFiles.push({
            filename: `${srcResource}-mapping.md`,
            resource: srcResource
        });
    });
    
    // Generate the main index file
    generateMappingIndex(generatedFiles, nonCoreWithR, resourcesWithoutR);
}

function generateMappingIndex(generatedFiles, nonCoreWithR, resourcesWithoutR) {
    const indexPath = '../ig-src/input/pagecontent/xtehr-mapping.md';
    console.log(`Generating mapping index: ${indexPath}`);
    const writable = fs.createWriteStream(indexPath);
    
    writable.write(`<!--\n`);
    writable.write(`  Generated file. Do not edit.\n`);
    writable.write(`-->\n\n`);
    writable.write('{% include variable-definitions.md %}\n\n');
    writable.write('The following tables describe the way the [Xt-EHR logical model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-XtEHR.html) has been mapped onto the FHIR profiles defined in this specification.\n\n');

    // Sort files alphabetically for consistent output
    const sortedFiles = generatedFiles.sort((a, b) => a.resource.localeCompare(b.resource));
    
    // Core models section - include the .md files
    if (sortedFiles.length > 0) {
        writable.write('### Core models of the Imaging Report IG\n\n');
        // For Markdown files with embedded HTML, use includes
        sortedFiles.forEach(file => {
            writable.write(`{% include ${file.filename} %}\n\n`);
        });
    }
    
    // Section for resources with 'R' but not in CORE_MODELS
    if (nonCoreWithR && nonCoreWithR.length > 0) {
        const sortedNonCoreWithR = [...nonCoreWithR].sort();
        const nonCoreWithRNames = sortedNonCoreWithR.join(', ');
        writable.write(`### Other logical models that are used by this IG\n\n`);
        writable.write(`The following logical models describe data that is used in the context of this IG, but the mapping will be defined by another higher level IG, because they are common to many domains:\n\n`);
        nonCoreWithRNamesWithHyperlinks = sortedNonCoreWithR.map(model => {
            return model.startsWith("EHDS") ? `[${model}](StructureDefinition-${model}.html)` : model;
        });
        writable.write(`* ${nonCoreWithRNamesWithHyperlinks.join(', ')}\n\n`);
    }
    
    // Section for resources without 'R'
    if (resourcesWithoutR && resourcesWithoutR.length > 0) {
        const sortedWithoutR = [...resourcesWithoutR].sort();
        withoutRNamesWithHyperlinks = sortedWithoutR.map( model => {
            return model.startsWith("EHDS") ? `[${model}](StructureDefinition-${model}.html)` : model;
        });
        
        const withoutRNames = withoutRNamesWithHyperlinks.join(', ');
        writable.write(`### Models not included in this IG\n\n`);
        writable.write(`The following logical models describe data that is not used in the context of this Imaging Report IG:\n\n`);
        writable.write(`* ${withoutRNames}\n\n`);
    }
    
    writable.end();
}

// Generate intro files mermaid
// Commented out as it is not used in the current context of generating .md files instead of ConceptMap files.
// function generateIntroFiles(parsedData, srcResources) {
//     srcResources.forEach(srcResource => {
//         const tgtResources = new Set();
//         const srcFields = new Set();

//         parsedData.forEach(row => {
//             if (row[indices.srcResource] === srcResource) {
//                 if (row[indices.tgtResource] && row[indices.tgtResource].length > 0){   
//                     tgtResources
//                         .add(
//                             row[indices.tgtResource]
//                         );
//                 }
//                 if (row[indices.srcField]){
//                     srcFields.add(row[indices.srcField]);
//                 }
//             }
//         });
//         if (tgtResources.size > 0) {
//             const conceptMapIntroPath = `${conceptMapIntroDir}/ConceptMap-${srcResource}Map-intro.md`;
//             console.log(conceptMapIntroPath);
//             const writable = fs.createWriteStream(conceptMapIntroPath);
//             writable.write(`{% include variable-definitions.md %}\n\n`);
//             writable.write(`The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.\n`);
//             writable.write(`\n`);
//             // mermaid
//             writable.write('```mermaid\n');
//             writable.write('classDiagram\n');
//             writable.write('direction LR\n');
//             // XtEHR model
//             writable.write(`class ${srcResource} {\n`);
//             writable.write(`  <<XtEHR dataset>>\n`);
//             srcFields.forEach(field => writable.write(`  ${field}\n`));
//             writable.write(`}\n`);
//             writable.write(`link ${srcResource} "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-${srcResource}.html"\n`);

//             const linkedClasses = new Set();
//             const linkRows = new Set();
//             tgtResources.forEach(tgtResource => {
//                 const tgtFields = new Set(
//                     parsedData
//                         .filter(row => row[indices.srcResource] === srcResource && row[indices.tgtResource] === tgtResource)
//                         .map(row => row[indices.tgtElement].trim())
//                         .filter( field => field.length > 0 )
//                 );
//                 let tgtResourceClassName = tgtResource.substring(tgtResource.lastIndexOf('/') + 1);	

//                 writable.write(`class ${tgtResourceClassName}`);
//                 if (tgtFields.size > 0) {
//                     writable.write(`{\n`);
//                     writable.write(`  <<FHIR>>\n`);
//                     tgtFields.forEach(field => {
//                         let targetField = field.replace(new RegExp('\:','g'),'\\:')        
                        
//                         writable.write(`  ${targetField}\n`)
//                     } )
//                     writable.write(`}\n`);
//                 }
//                 writable.write(`\n`);
//                 // writable.write(`link ${tgtResourceClassName} "./StructureDefinition-${tgtResourceClassName.html}"\n`);
//                 linkRows.add(`${srcResource} --> ${tgtResourceClassName}\n`);

//                 parsedData.forEach(row => {
//                     if (row[indices.srcResource] === srcResource && row[indices.tgtResource] === tgtResource && row[indices.tgtRefType]) {
//                     const refResources = row[indices.tgtRefType].split(',');
//                     const referenceName = row[indices.tgtElement];
//                     refResources
//                         .filter(refResource => refResource !== '-' )
//                         .forEach(refResource => {
//                             const refResourceClassName = refResource.substring(refResource.lastIndexOf('/') + 1);
//                             linkedClasses.add(refResourceClassName);
//                             linkRows.add(`${tgtResourceClassName} --> ${refResourceClassName} : ${referenceName}\n`);
//                     });
//                     }
//                 });
//             });
//             linkedClasses.forEach(linkedClass => {
//                 writable.write(`class ${linkedClass} {\n`);
//                 writable.write(`  <<FHIR>>\n`);
//                 writable.write(`}\n`);
//             });
//             linkRows.forEach(link => writable.write(link));
//             writable.write("```\n");
//             writable.write(`\n`);
//             writable.end();
//         }
//     });
// }

function generateObligationFiles(parsedData) {
    const IG_NAME_SUFFIX = 'EuImaging';
    const RESOURCE_TITLES = {
        CompositionEuImaging: 'Composition: Imaging Report',
        ServiceRequestOrderEuImaging: 'ServiceRequest: Imaging Order',
        ImagingStudyEuImaging: 'ImagingStudy: General',
        DiagnosticReportEuImaging: 'DiagnosticReport: Imaging Report',
        ObservationFindingEuImaging: 'Observation: Imaging Finding',
        EuMedicationAdministration: 'MedicationAdministration'
    };

    function getValue(row, idx) {
        return (idx !== undefined && row[idx] !== undefined && row[idx] !== null)
            ? row[idx].trim()
            : '';
    }

    function ensureOutputDir(relativeDir) {
        const absoluteDir = path.resolve(__dirname, relativeDir);
        fs.mkdirSync(absoluteDir, { recursive: true });
        return absoluteDir;
    }

    function cleanAllObligationFiles(relativeDir) {
        const absoluteDir = ensureOutputDir(relativeDir);
        fs.readdirSync(absoluteDir)
            .filter(file => file.endsWith('.liquid.fsh'))
            .forEach(file => fs.unlinkSync(path.join(absoluteDir, file)));
    }

    function splitObligationCodes(raw) {
        return raw
            .split(/[;,|]/)
            .map(code => code.trim())
            .filter(code => code.length > 0);
    }

    function normalizeResourceNameForIg(resourceName) {
        if (!resourceName || resourceName.length === 0) {
            return '';
        }
        if (resourceName.endsWith(IG_NAME_SUFFIX)) {
            return resourceName;
        }
        if (resourceName.startsWith('Eu') && resourceName.length > 2) {
            return `${resourceName.substring(2)}${IG_NAME_SUFFIX}`;
        }
        return `${resourceName}${IG_NAME_SUFFIX}`;
    }

    function splitResourceName(resourceName) {
        const normalizedName = normalizeResourceNameForIg(resourceName);

        if (normalizedName && normalizedName.endsWith(IG_NAME_SUFFIX)) {
            return {
                base: normalizedName.substring(0, normalizedName.length - IG_NAME_SUFFIX.length),
                suffix: IG_NAME_SUFFIX
            };
        }
        return {
            base: normalizedName,
            suffix: ''
        };
    }

    function buildObligationProfileName(resourceName, actor) {
        const parts = splitResourceName(resourceName);
        if (parts.suffix.length > 0) {
            return `${parts.base}Obligation${actor}${parts.suffix}`;
        }
        return `${resourceName}Obligation${actor}`;
    }

    function toKebabCase(value) {
        return value
            .replace(/([a-z0-9])([A-Z])/g, '$1-$2')
            .replace(/([A-Z]+)([A-Z][a-z])/g, '$1-$2')
            .replace(/_/g, '-')
            .toLowerCase();
    }

    function buildObligationProfileId(profileName) {
        return toKebabCase(profileName);
    }

    function getResourceDisplayTitle(resourceName) {
        return RESOURCE_TITLES[resourceName] || resourceName;
    }

    function formatParent(resourceUrl) {
        if (!resourceUrl || resourceUrl.length === 0) {
            return '';
        }
        if (resourceUrl.startsWith('$')) {
            return resourceUrl;
        }
        return resourceUrl.startsWith('Eu') ? `$${resourceUrl}` : resourceUrl;
    }

    function buildVersionData(resourceName, targetResourceIndex, targetElementIndex, obligationCodeIndex) {
        const rows = parsedData
            .filter((row, index) => index > 0)
            .filter(row => getValue(row, targetResourceIndex) === resourceName)
            .filter(row => getValue(row, targetElementIndex).length > 0)
            .filter(row => getValue(row, obligationCodeIndex).length > 0);

        if (rows.length === 0) {
            return null;
        }

        const obligationMap = new Map();
        rows.forEach(row => {
            const element = getValue(row, targetElementIndex);
            const codes = splitObligationCodes(getValue(row, obligationCodeIndex));
            if (!obligationMap.has(element)) {
                obligationMap.set(element, new Set());
            }
            const set = obligationMap.get(element);
            codes.forEach(code => set.add(code));
        });

        return {
            resourceName,
            parent: formatParent(resourceName),
            obligationMap
        };
    }

    function collectResourceNames(targetResourceIndex, obligationCodeIndex) {
        const names = new Set();
        parsedData
            .filter((row, index) => index > 0)
            .forEach(row => {
                const resource = getValue(row, targetResourceIndex);
                const obligationCode = getValue(row, obligationCodeIndex);
                if (resource.length > 0 && obligationCode.length > 0) {
                    names.add(resource);
                }
            });
        return names;
    }

    function writeResourceObligationFile(resourceName, actor, actorCanonical, outputDir, r5Data, r4Data) {
        if (!r5Data && !r4Data) {
            return;
        }

        const profileName = buildObligationProfileName(resourceName, actor);
        const profileId = buildObligationProfileId(profileName);
        const resourceDisplayTitle = getResourceDisplayTitle(resourceName);

        const obligationPath = path.resolve(__dirname, `${outputDir}/${profileName}.liquid.fsh`);
        console.log(obligationPath);
        const writable = fs.createWriteStream(obligationPath);

        function writeVersionBlock(versionLabel, liquidCondition, data) {
            if (!data) {
                return;
            }

            writable.write(`{% if ${liquidCondition} %}\n`);
            writable.write(`////////////////////////////////////////////////////\n`);
            writable.write(`// Generated file. Do not edit.\n`);
            writable.write(`////////////////////////////////////////////////////\n`);
            writable.write(`Profile: ${profileName}\n`);
            writable.write(`Parent: ${data.parent}\n`);
            writable.write(`Id: ${profileId}\n`);
            writable.write(`Title: "${resourceDisplayTitle}: Obligations ${actor}"\n`);
            writable.write(`Description: "${actor} obligations for ${resourceDisplayTitle}"\n`);

            Array.from(data.obligationMap.keys()).forEach(obligation => {
                const rows = parsedData
                    .filter(row => getValue(row, indices.srcResource).length > 0)
                    .filter(row => {
                        const targetElement = liquidCondition === 'isR5'
                            ? getValue(row, indices.tgtElement)
                            : getValue(row, indices.tgtElementR4);
                        const targetResource = liquidCondition === 'isR5'
                            ? getValue(row, indices.tgtResource)
                            : getValue(row, indices.tgtResourceR4);
                        return targetResource === resourceName && targetElement === obligation;
                    });

                const documentationSet = new Set(
                    rows
                        .map(row => `${getValue(row, indices.srcResource)}.${getValue(row, indices.srcField)}`)
                        .filter(v => v && v !== '.')
                );
                const documentation = documentationSet.size > 0 ? Array.from(documentationSet).join(', ') : '-';

                writable.write(`* ${obligation}\n`);
                Array.from(data.obligationMap.get(obligation)).forEach(code => {
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #${code}\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = ${actorCanonical}\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "${documentation}"\n`);
                });
            });

            writable.write(`{% endif %}\n\n`);
        }

        writeVersionBlock('R5', 'isR5', r5Data);
        writeVersionBlock('R4', 'isR4', r4Data);
        writable.end();
    }

    const outputDir = obligationsDirs.r5;
    cleanAllObligationFiles(outputDir);

    const actorConfigs = [
        {
            actor: 'Producer',
            actorCanonical: 'Canonical(BundleReportEuImagingProducer)',
            r5: {
                targetResourceIndex: indices.tgtResource,
                targetElementIndex: indices.tgtElement,
                obligationCodeIndex: indices.obligationProducerR5
            },
            r4: {
                targetResourceIndex: indices.tgtResourceR4,
                targetElementIndex: indices.tgtElementR4,
                obligationCodeIndex: indices.obligationProducerR4
            }
        },
        {
            actor: 'Consumer',
            actorCanonical: 'Canonical(ImConsumer)',
            r5: {
                targetResourceIndex: indices.tgtResource,
                targetElementIndex: indices.tgtElement,
                obligationCodeIndex: indices.obligationConsumerR5
            },
            r4: {
                targetResourceIndex: indices.tgtResourceR4,
                targetElementIndex: indices.tgtElementR4,
                obligationCodeIndex: indices.obligationConsumerR4
            }
        }
    ];

    actorConfigs.forEach(cfg => {
        const resourceNames = new Set([
            ...collectResourceNames(cfg.r5.targetResourceIndex, cfg.r5.obligationCodeIndex),
            ...collectResourceNames(cfg.r4.targetResourceIndex, cfg.r4.obligationCodeIndex)
        ]);

        resourceNames.forEach(resourceName => {
            const r5Data = buildVersionData(resourceName, cfg.r5.targetResourceIndex, cfg.r5.targetElementIndex, cfg.r5.obligationCodeIndex);
            const r4Data = buildVersionData(resourceName, cfg.r4.targetResourceIndex, cfg.r4.targetElementIndex, cfg.r4.obligationCodeIndex);
            writeResourceObligationFile(resourceName, cfg.actor, cfg.actorCanonical, outputDir, r5Data, r4Data);
        });
    });
}

function generateSectionTablesMarkdown(parsedData) {
    // Create a map to organize data by sections
    const sectionMap = new Map();

    // Filter data to only include rows with section information
    const rowsWithSections = parsedData
        .filter(row => row[indices.section]?.trim().length > 0)
        .filter(row => row[indices.section]?.trim() !== "Section") // Exclude the header row
        .filter(row => row[indices.tgtResource]?.trim().length > 0)
        .filter(row => row[indices.tgtElement]?.trim().length > 0);
        // .filter(row => row[indices.tgtRefType]?.trim().length > 0);

    console.log(`Found ${rowsWithSections.length} rows with section information`);

    // Process each row, now handling multiple sections per row
    rowsWithSections.forEach(row => {
        // Split the section value by comma and process each section
        const sectionValues = row[indices.section].split(',').map(s => s.trim());
        const tgtResource = row[indices.tgtResource].trim();
        const tgtElement = row[indices.tgtElement].trim();
        const srcResource = row[indices.srcResource] ? row[indices.srcResource].trim() : "";
        const srcField = row[indices.srcField] ? row[indices.srcField].trim() : "";
        const tgtRefType = row[indices.tgtRefType] ? row[indices.tgtRefType].trim() : "";
        const tgtModeling = row[indices.tgtModeling] ? row[indices.tgtModeling].trim() : "";

        console.log(`Processing resource: ${tgtResource}, element: ${tgtElement} for sections: ${sectionValues.join(', ')}`);

        // Add this row to each section it belongs to
        sectionValues
            .forEach(section => {
            if (section && section.length > 0) {
                if (!sectionMap.has(section)) {
                    sectionMap.set(section, []);
                }

                // Check if this resource/element pair already exists in this section
                const entries = sectionMap.get(section);
                // const exists = entries.some(entry => 
                    // entry.resource === tgtResource && entry.element === tgtElement
                // );

                // if (!exists) {
                    entries.push({
                        resource: tgtResource,
                        element: tgtElement,
                        srcResource: srcResource,
                        srcField: srcField,
                        tgtRefType: tgtRefType,
                        tgtModeling: tgtModeling
                    });
                // }
            }
        });
    });

    console.log(`Section map has ${sectionMap.size} sections`);

    // Generate the markdown file
    const outputPath = '../ig-src/input/intro-notes/StructureDefinition-CompositionEuImaging-intro.md';
    const writable = fs.createWriteStream(outputPath);

    // Write file header - preserve existing content from the original file
    writable.write('{% include variable-definitions.md %}\n');
    writable.write('For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.\n\n');
    writable.write('The table below suggests the data points that SHOULD be included, and the source of those data. Those data points can be in a first order resource, referenced directly from the Composition (e.g. ImOrder), or they can live in a second,third order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.\n\n');
    writable.write('NOTE: Structural concerns and rationale on the ImComposition profile can be found in the [ImComposition](StructureDefinition-ImComposition.html), which is the parent type of this Report-ImComposition profile.\n\n');

    // Define custom section order
    const sectionOrder = [
        'Imaging Study',
        'Order',
        'History',
        'Procedure',
        'Comparison',
        'Findings',
        'Impression',
        'Recommendation'
    ];

    // Filter out sections that should be excluded (like "Section")
    const sectionsToExclude = ['Section'];

    // Get all sections and exclude those in the exclude list
    const availableSections = Array.from(sectionMap.keys())
        .filter(section => !sectionsToExclude.includes(section));

    // First add sections in the specified order (if they exist)
    const orderedSections = [];
    sectionOrder.forEach(orderedSection => {
        if (sectionMap.has(orderedSection)) {
            orderedSections.push(orderedSection);
        }
    });

    // Then add any remaining sections that weren't in the specified order
    availableSections.forEach(section => {
        if (!orderedSections.includes(section)) {
            orderedSections.push(section);
        }
    });

    console.log(`Ordered sections: ${orderedSections.join(', ')}`);

    // Generate tables for each section
    if (orderedSections.length > 0) {
        writable.write('## Elements to include in sections narratives\n\n');
        orderedSections.forEach(section => {
            writable.write(`### ${section}\n\n`);
            writable.write(`The following table lists the elements that should be included in the narrative of the ${section} section.\n\n`);
            writable.write(`{:.grid}\n`);
            
            const entries = sectionMap.get(section);
            
            // Check if this section has any non-empty comments
            const hasComments = entries.some(entry => entry.tgtModeling && entry.tgtModeling.trim().length > 0);
            
            if (hasComments) {
                writable.write(`| First order resource | Element | Referenced resource | Logical model resource.field | Comments |\n`);
                writable.write('| -------- | ------- | -------------- | --------------------- | -------- |\n');
                let strs = new Set( entries.map(entry => `| ${entry.resource} | ${entry.element} | ${entry.tgtRefType} | ${entry.srcResource}.${entry.srcField} | ${entry.tgtModeling} |\n`));
                strs.forEach( str => { writable.write(str);});
            } else {
                writable.write(`| First order resource | Element | Referenced resource | Logical model resource.field |\n`);
                writable.write('| -------- | ------- | -------------- | --------------------- |\n');
                let strs = new Set( entries.map(entry => `| ${entry.resource} | ${entry.element} | ${entry.tgtRefType} | ${entry.srcResource}.${entry.srcField} |\n`));
                strs.forEach( str => { writable.write(str);});
            }

            writable.write('\n');
        });
    } else {
        console.log('Warning: No sections found to create tables');
    }

    writable.end();
    console.log(`Generated section tables in ${outputPath}`);
}


function main() {
    const filePath = path.join(__dirname, 'xtehr-model-mapping.tsv');

    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading the file:', err);
            return;
        }

        const srcParsedData = data.split('\n').map(row => row.split('\t'));
        const parsedData = [];
        srcParsedData.forEach(
            row => {
                const newRow = [];
                row.forEach(
                    cell => {
                        newRow.push(cell.trim().replace( new RegExp('"','g'), ''));
                    }
                );
                parsedData.push(newRow);
            }
        );

        const srcResources = new Set(
            parsedData.filter(row => row[indices.srcResource]?.startsWith('EHDS')).map(row => row[1])
            );
        
        extractAndCopyResources(parsedData, srcResources);
        
        generateMappingTables(parsedData, srcResources);
        
       // generateIntroFiles(parsedData, srcResources);
                
        generateObligationFiles(parsedData);  
        
        generateSectionTablesMarkdown(parsedData);

        // generateCodeSystem(parsedData, srcResources);
    });
}

// Helper function to map equivalence codes
function getEquivalence(code) {
    switch (code) {
        case "EQ": return "#equivalent";
        case "SB": return "#source-is-broader-than-target";
        case "TB": return "#source-is-narrower-than-target";
        case "RT": return "#related-to";
        default: return "#related-to";
    }
}


// Execute the main function
if (require.main === module) {
    main();
}