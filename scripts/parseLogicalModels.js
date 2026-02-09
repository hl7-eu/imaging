const fs = require('fs');
const path = require('path');

function updateAssociation( structure, structures, classes, associations ) {
    let subClasses = new Set();
    let srcClass = structure.definition.name;
    let elements = structure.definition.snapshot && structure.definition.snapshot.element
            ? structure.definition.snapshot.element : [];
    elements.forEach(element => {
        let extField = element.id.substr(structure.definition.name.length+1);
        let types = element.type? element.type : [];
        if ( types.length === 0 ) { types.push({code: ''}) }
        let binding = element.binding
            ? `${element.binding.description} (${element.binding.strength})`
            : '';
        
        types.forEach(type => {
            const definition = `${element.definition.replace(new RegExp(";","g"),',').replace(new RegExp('\t','g'),' ')}`;
            const regex = new RegExp('Laboratory|HospitalDischarge|PatientSummary');
            const targetCode = type.code.replace('https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/','');
            const targets = new Set();
            targets.add( targetCode );
            if ( type.targetProfile && type.targetProfile.length > 0 ){
                type.targetProfile.forEach( targetProfile => targets.add(
                    targetProfile.replace('https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/','') 
                ));
            }
            targets
                .forEach( target => {
                    if ( target.startsWith('EHDS') ){
                        subClasses.add(target);
                        let association = `${srcClass} --> ${target}`;
                        // let association = `${srcClass} --> ${target}: ${element.path}`;
                        associations.add(association);
                    }
                });
        });
    });
    subClasses.forEach( subClass => {
        if ( !classes.has(subClass) ) {
            classes.add(subClass);
            let subStructure = structures.find( structure => structure.definition.name === subClass );
            if ( subStructure ) {
                updateAssociation( subStructure, structures, classes, associations );
            }
        }        
    });
}

// Function to read all structure definitions
function readStructureDefinitions(directory) {
    try {
        const files = fs.readdirSync(directory);
        const structures = [];
        files.forEach(file => {
            const filePath = path.join(directory, file);
            const stat = fs.statSync(filePath);

            if (stat.isDirectory()) {
                // Recursively read subdirectories
                structures.push(...readStructureDefinitions(filePath));
            } else if (file.endsWith('.json')) {
                // Read and parse JSON files
                const content = fs.readFileSync(filePath, 'utf8');
                try {
                    const json = JSON.parse(content);
                    structures.push({ file: filePath, definition: json });
                } catch (err) {
                    console.error(`Error parsing JSON in file: ${filePath}`, err);
                }
            }
        });

        return structures;
    } catch (err) {
        console.error(`Error reading directory: ${directory}`, err);
        return [];
    }
}

// Main execution
function main( ) {
    // Directory containing XtEHR-models   
    const modelsDir = path.join(__dirname, process.argv[2]?process.argv[2]:'XtEHR-models');
    const tgtFile = path.join(__dirname, process.argv[3]?process.argv[3]:'xtehr-model.csv');

    console.log( `Reading XtEHR-models from ${modelsDir} and writing to ${tgtFile}` );
    
    if (!fs.existsSync(modelsDir)) {
        console.error(`Directory not found: ${modelsDir}`);
        return;
    }

    // sheet bases
    let writable = fs.createWriteStream('xtehr-model.csv');
    const structures = readStructureDefinitions(modelsDir);
    console.log(`Writing ${structures.length} structure definitions to ${tgtFile}`);
    structures.forEach((structure, index) => {
        let extResource = structure.definition.name;
        console.log( extResource)
        let elements = structure.definition.snapshot && structure.definition.snapshot.element
            ? structure.definition.snapshot.element : [];
        elements.forEach(element => {
            let extField = element.id.substr(structure.definition.name.length+1);
            let types = element.type? element.type : [];
            if ( types.length === 0 ) { types.push({code: ''}) }
            let binding = element.binding
                ? `${element.binding.description} (${element.binding.strength})`
                : '';
            types.forEach(type => {
                // console.log(`${extResource}; ${extField}; ${element.min}..${element.max}; ${element.definition.replace(";",",")}; ${type.code.replace('https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/','')}; ${element.short.replace(";",",")} `);
                const definition = `${element.definition.replace(new RegExp(";","g"),',').replace(new RegExp('\t','g'),' ')}`;
                writable.write(`${extResource}; ${extField}; ${element.min}..${element.max}; ${definition}; ${type.code.replace('https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/','')}; ${binding}  ; ${element.short.replace(";",",")} `);
                writable.write('\n');
            });
        });
    });
    writable.write('\n');
    writable.end();
    console.log( 'DONE' )

    // diagram
    let classes = new Set();
    let associations = new Set();
    let imagingReportStructure = structures.find( structure => structure.definition.name === 'EHDSImagingReport' );
    updateAssociation( imagingReportStructure, structures, classes, associations );
    
    // mermaid diagram
    //{  
    //    let writable = fs.createWriteStream('../input/includes/xtEHR-model.md');
    //    writable.write('```mermaid\n');
    //    writable.write('classDiagram\n');
    //    writable.write('direction LR\n');
        // classes.forEach( cls => { writable.write(`class ${cls} \n`); });
    //    associations.forEach( assoc => { writable.write(`${assoc} \n`); });
    //    classes.forEach( cls => { 
            // writable.write(`link ${cls} "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-${cls}.html"\n`);
    //    });
        
    //    writable.write('```\n');
    //}
    // plantuml
    // {
    //     let writable = fs.createWriteStream('../input/includes/xtEHR-model.plantuml');
    //     writable.write('classDiagram\n');
    //     writable.write('@startuml\n');
    //     // classes.forEach( cls => { writable.write(`class ${cls} \n`); });
    //     associations.forEach( assoc => { writable.write(`${assoc} \n`); });
    //     writable.write('@enduml\n');
    
    // }
}

main();