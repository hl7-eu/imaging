
{{R4}}Instance: SearchParameterDocumentReferenceBodySite
{{R4}}InstanceOf: SearchParameter
{{R4}}Usage: #definition
{{R4}}* name = "DocumentReferenceBodySite"
{{R4}}* extension[+]
{{R4}}  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
{{R4}}  * valueCode = #trial-use
{{R4}}* status = #active
{{R4}}* experimental = false 
{{R4}}* description = """Searches for document references with a specific body site."""
{{R4}}* code = #bodysite
{{R4}}* base[+] = #DocumentReference
{{R4}}* type = #token
{{R4}}* expression = "DocumentReference.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.bodySite').extension('concept').value"
// TODO test this
