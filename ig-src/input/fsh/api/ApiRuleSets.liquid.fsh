RuleSet: MhdSearchParameters
// Imaging specific search parameters
{{R }}* rest[=].resource[=].searchParam[+].name = "bodysite"
{{R4}}* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceBodySite )
{{R5}}* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-bodysite"
{{R }}* rest[=].resource[=].searchParam[=].type = #token
{{R }}* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
{{R }}* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
{{R }}* rest[=].resource[=].searchParam[=].documentation = "Anatomical region of the related imaging study"

{{R }}* rest[=].resource[=].searchParam[+].name = "modality"
{{R4}}* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceModality )
{{R5}}* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-modality"
{{R }}* rest[=].resource[=].searchParam[=].type = #token
{{R }}* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
{{R }}* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
{{R }}* rest[=].resource[=].searchParam[=].documentation = "Modality of the related imaging study"