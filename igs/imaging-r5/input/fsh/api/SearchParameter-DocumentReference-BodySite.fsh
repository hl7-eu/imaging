
//R4Instance: SearchParameterDocumentReferenceBodySite
//R4InstanceOf: SearchParameter
//R4Usage: #definition
//R4* name = "SearchParameter: BodySite"
//R4* extension[+]
//R4  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
//R4  * valueCode = #trial_use
//R4* status = #draft
//R4* experimental = false 
//R4* description = """Searches for document references with a specific bodysite."""
//R4* code = #bodysite
//R4* base[+] = #DocumentReference
//R4* type = #token
//R4* expression = "DocumentReference.extension('$CrossVersion-R5-DocumentReference.bodysite-for-R4').extension['concept'].value"
// TODO test this
