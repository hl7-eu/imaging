Instance: A-1-4-InformationRecipientMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.4 Information Recipient"
* name = "A.1.4"
* title = "A.1.4 Information Recipient"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.4 Information Recipient section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-information-recipient"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-information-recipient"
  
  * insert ElementMapping( #recipientIdentifier, "A.1.4.1 Recipient identifier", ##practitioner.identifier, "", #equivalent )
  * insert ElementMapping( #providerName, "A.1.4.2 Recipient name", #practitioner.name, "", #equivalent )
  * insert ElementMapping( #providerOrganization, "A.1.4.3 Recipient organization", #organization.name, "", #equivalent )
  * insert ElementMapping( #providerAddress, "A.1.4.4 Recipient address", #practitioner.address, "", #equivalent )
  * insert ElementMapping( #providerCountry, "A.1.4.5 Recipient Country", #practitioner.address, "", #equivalent )
  * insert ElementMapping( #providerTelecom, "A.1.4.6 Recipient Telecom", #practitioner.telecom, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-information-recipient"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  
  * insert ElementMapping( #recipientIdentifier, "A.1.4.1 Recipient identifier", #identifier, "", #equivalent )
  * insert ElementMapping( #providerName, "A.1.4.2 Recipient name", #name, "", #equivalent )
  * insert ElementMapping( #providerAddress, "A.1.4.4 Recipient address", #address, "", #equivalent )
  * insert ElementMapping( #providerCountry, "A.1.4.5 Recipient Country", #address, "", #equivalent )
  * insert ElementMapping( #providerTelecom, "A.1.4.6 Recipient Telecom", #practitioner.telecom, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-information-recipient"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization"
  
  * insert ElementMapping( #providerOrganization, "A.1.4.3 Recipient organization", #organization.name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * insert ElementMapping( #informationRecipient, "A.1.4 Information Recipient", #extension[informationRecipient], "Follow choices in HL7 EU laboratory.", #equivalent )
