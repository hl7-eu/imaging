
Instance: SearchParameterDocumentReferenceBodySite
InstanceOf: SearchParameter
Usage: #definition
* name = "SearchParameter: BodySite"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
  * valueCode = #trial_use
* status = #draft
* experimental = false 
* description = """Searches for document references with a specific bodysite."""
* code = #bodysite
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('$CrossVersion-R5-DocumentReference.bodysite-for-R4').extension['concept'].value"
// TODO test this
