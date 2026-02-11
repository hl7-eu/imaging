
Instance: SearchParameterDocumentReferenceModality
InstanceOf: SearchParameter
Usage: #definition
* name = "SearchParameter: Modality"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
  * valueCode = #trial_use
* status = #draft
* experimental = false 
* description = """Searches for document references with a specific modality."""
* code = #modality
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('$CrossVersion-R5-DocumentReference.modality-for-R4').value.concept"
// TODO test
