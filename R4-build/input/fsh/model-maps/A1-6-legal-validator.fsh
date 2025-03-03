Instance: A-1-6-LegalAuthenticatorMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.6 Legal Authenticator"
* name = "A.1.6"
* title = "A.1.6 Legal Authenticator"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.6 Legal Authenticator section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-legal-authenticator"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-legal-authenticator"
  
  * insert ElementMapping( #authenticatorIdentifier, "A.1.6.1 Legal Authenticator identifier", #practitioner.identifier, "", #equivalent )
  * insert ElementMapping( #authenticatorName, "A.1.6.2 Legal Authenticator name", #practitioner.name, "", #equivalent )
  * insert ElementMapping( #authenticatorOrganization, "A.1.6.3 Legal Authenticator organization", #organization.name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  
  * insert ElementMapping( #authenticatorIdentifier, "A.1.6.1 Legal Authenticator identifier", #identifier, "", #equivalent )
  * insert ElementMapping( #authenticatorName, "A.1.6.2 Legal Authenticator name", #name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization"
  
  * insert ElementMapping( #authenticatorOrganization, "A.1.6.3 Legal Authenticator organization", #name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"
  
  * insert ElementMapping( #authenticatingDateTime, "A.1.6 Authentication date and time", #issued, "", #source-is-narrower-than-target )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * insert ElementMapping( #authenticator, "A.1.6 Legal Authenticator", #attester[legal-authenticator], "", #equivalent )
  * insert ElementMapping( #authenticatingDateTime, "A.1.6 Authentication date and time", #attester[legal-authenticator].time, "", #equivalent )