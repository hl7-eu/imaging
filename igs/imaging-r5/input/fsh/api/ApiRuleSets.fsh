RuleSet: MhdSearchParameters
// Imaging specific search parameters
* rest[=].resource[=].searchParam[+].name = "bodysite"
//R4* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceBodySite )
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-bodysite"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Anatomical region of the related imaging study"

* rest[=].resource[=].searchParam[+].name = "modality"
//R4* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceModality )
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-modality"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Modality of the related imaging study"
