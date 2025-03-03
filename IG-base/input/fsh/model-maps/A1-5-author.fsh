Instance: A-1-5-InformationAuthorMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.5 Information Author"
* name = "A.1.5"
* title = "A.1.5 Information Author"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.5 Information Author section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-author"
  
  * insert ElementMapping( #authorIdentifier, "A.1.5.1 Author identifier", #practitioner.identifier, "", #equivalent )
  * insert ElementMapping( #providerName, "A.1.5.2 Author name", #practitioner.name, "", #equivalent )
  * insert ElementMapping( #providerOrganization, "A.1.5.3 Author organization", #organization.name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  
  * insert ElementMapping( #authorIdentifier, "A.1.5.1 Author identifier", #identifier, "", #equivalent )
  * insert ElementMapping( #providerName, "A.1.5.2 Author name", #name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization"
  
  * insert ElementMapping( #authorOrganization, "A.1.5.3 Author organization", #organization.name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"
  
  * insert ElementMapping( #authoringDateTime, "A.1.5 Authoring Datetime", #issued, "", #source-is-narrower-than-target )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * insert ElementMapping( #author, "A.1.5 Author", #author[author], "", #equivalent )
  * insert ElementMapping( #author, "A.1.5 Authoring Device", #author[authoring-device], "", #equivalent )
  * insert ElementMapping( #authoringDateTime, "A.1.5 Author", #date, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"

  * insert ElementMapping( #author, "A.1.5 Author", #resultsInterpreter[author], "", #equivalent )
  * insert ElementMapping( #author, "A.1.5 Authoring Device", #resultsInterpreter, "Is not mapped", #not-related-to )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-authoring-device"

  * insert ElementMapping( #authorIdentifier, "A.1.5 Author", #identifier, "", #equivalent )
  * insert ElementMapping( #authorName, "A.1.5 Author", #name, "", #equivalent )