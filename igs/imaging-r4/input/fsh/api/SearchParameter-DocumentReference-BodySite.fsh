
Instance: SearchParameterDocumentReferenceBodySite
InstanceOf: SearchParameter
Usage: #definition
* name = "DocumentReferenceBodySite"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
  * valueCode = #trial-use
* status = #active
* experimental = false 
* description = """Searches for document references with a specific body site."""
* code = #bodysite
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.bodySite').extension('concept').value"
