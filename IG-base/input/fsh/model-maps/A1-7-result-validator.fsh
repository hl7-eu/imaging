Instance: A-1-7-LegalAuthenticatorMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.7 Result Validator"
* name = "A.1.7"
* title = "A.1.7 ResultValidator"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.7 Result Validator section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-result-validator"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-result-validator"
  * insert ElementMapping( #validatorIdentifier, "A.1.7.1 Result Validator identifier", #practitioner.identifier, "", #equivalent )
  * insert ElementMapping( #validatorName, "A.1.7.2 Result Validator name", #practitioner.name, "", #equivalent )
  * insert ElementMapping( #validatorOrganization, "A.1.7.3 Result Validator organization", #organization.name, "", #equivalent )


* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-result-validator"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  * insert ElementMapping( #validatorIdentifier, "A.1.7.1 Result Validator identifier", #identifier, "", #equivalent )
  * insert ElementMapping( #validatorName, "A.1.7.2 Result Validator name", #name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-result-validator"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization"
  * insert ElementMapping( #validatorOrganization, "A.1.7.3 Result Validator organization", #name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-result-validator"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"
  * insert ElementMapping( #validatorDateTime, "A.1.7.4 Authentication date and timeDatetime", #issued, "DiagnosticReport.issuer could also have other meanings.", #source-is-narrower-than-target )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"
  * insert ElementMapping( #validator, "A.1.7 Result Validator", #attester[legal-authenticator], "", #equivalent )
  * insert ElementMapping( #validationDateTime, "A.1.7 Authentication date and time", #attester[legal-authenticator].time, "", #equivalent )
