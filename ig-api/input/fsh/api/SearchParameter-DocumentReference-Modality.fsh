
Instance: SearchParameterDocumentReferenceModality
InstanceOf: SearchParameter
Usage: #definition
* name = "DocumentReferenceModality"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
  * valueCode = #trial-use
* status = #active
* experimental = false 
* description = """Searches for document references with a specific modality."""
* code = #modality
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('https://profiles.ihe.net/RAD/MADO/StructureDefinition/ext-R5-DocumentReference.modality').value"
