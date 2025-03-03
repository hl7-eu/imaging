Instance: A-2-OrderInformationMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.2 Order Information to FHIR profiles"
* name = "A.2"
* title = "A.2 Order Information to FHIR profiles"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.2 Order Information section and the FHIR profiles."
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order"
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-order" 
  * insert ElementMapping( #requester, "A.2 Order Placer", #requester, "", #equivalent )
  * insert ElementMapping( #orderId, "A.2.1 Order ID", #identifier[accession-number], "", #equivalent )
  * insert ElementMapping( #orderId, "A.2.1 Order ID", #identifier[order-id], "", #equivalent )
  * insert ElementMapping( #orderDateTime, "A.2.2 Order date and time", #authoredOn, "", #equivalent )
  * insert ElementMapping( #orderPlacerIdentifier, "A.2.3 Order placer professional identifier", #practitioner.practitioner.identifier, "", #equivalent )
  * insert ElementMapping( #orderPlacerName, "A.2.4 Order placer name", #practitioner.practitioner.name, "", #equivalent )
  * insert ElementMapping( #orderPlacerSpecialty, "A.2.5 Order placer specialty", #practitioner.practitioner.name, "", #equivalent )
  * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #practitioner.practitioner.address, "", #source-is-broader-than-target )
  * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #practitioner.practitioner.telecom, "", #source-is-broader-than-target )
  * insert ElementMapping( #orderPlacerOrganization, "A.2.7 Order placer organization", #practitioner.organization, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-order-placer" 
//   * insert ElementMapping( #orderId, "A.2.1 Order ID", #identifier[accession-number], "", #equivalent )
//   * insert ElementMapping( #orderDateTime, "A.2.2 Order date and time", #authoredOn, "", #equivalent )
  * insert ElementMapping( #orderPlacerIdentifier, "A.2.3 Order placer professional identifier", #practitioner.identifier, "", #equivalent )
  * insert ElementMapping( #orderPlacerName, "A.2.4 Order placer name", #practitioner.name, "", #equivalent )
  * insert ElementMapping( #orderPlacerSpecialty, "A.2.5 Order placer specialty", #specialty, "", #equivalent )
  * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #practitioner.address, "", #source-is-broader-than-target )
  * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #practitioner.telecom, "", #source-is-broader-than-target )
  * insert ElementMapping( #orderPlacerOrganization, "A.2.7 Order placer organization", #organization, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner" 
//   * insert ElementMapping( #orderId, "A.2.1 Order ID", #identifier[accession-number], "", #equivalent )
//   * insert ElementMapping( #orderDateTime, "A.2.2 Order date and time", #authoredOn, "", #equivalent )
  * insert ElementMapping( #orderPlacerIdentifier, "A.2.3 Order placer professional identifier", #identifier, "", #equivalent )
  * insert ElementMapping( #orderPlacerName, "A.2.4 Order placer name", #name, "", #equivalent )
//   * insert ElementMapping( #orderPlacerSpecialty, "A.2.5 Order placer specialty", #specialty, "", #equivalent )
  * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #address, "", #source-is-broader-than-target )
  * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #telecom, "", #source-is-broader-than-target )
//   * insert ElementMapping( #orderPlacerOrganization, "A.2.7 Order placer organization", #organization, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization" 
//   * insert ElementMapping( #orderId, "A.2.1 Order ID", #identifier[accession-number], "", #equivalent )
//   * insert ElementMapping( #orderDateTime, "A.2.2 Order date and time", #authoredOn, "", #equivalent )
//   * insert ElementMapping( #orderPlacerIdentifier, "A.2.3 Order placer professional identifier", #identifier, "", #equivalent )
//   * insert ElementMapping( #orderPlacerName, "A.2.4 Order placer name", #name, "", #equivalent )
//   * insert ElementMapping( #orderPlacerSpecialty, "A.2.5 Order placer specialty", #specialty, "", #equivalent )
//   * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #address, "", #source-is-broader-than-target )
//   * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #telecom, "", #source-is-broader-than-target )
  * insert ElementMapping( #orderPlacerOrganization, "A.2.7 Order placer organization", #name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
//   * insert ElementMapping( #orderId, "A.2.1 Order ID", #identifier[accession-number], "", #equivalent )
//   * insert ElementMapping( #orderDateTime, "A.2.2 Order date and time", #authoredOn, "", #equivalent )
//   * insert ElementMapping( #orderPlacerIdentifier, "A.2.3 Order placer professional identifier", #identifier, "", #equivalent )
//   * insert ElementMapping( #orderPlacerName, "A.2.4 Order placer name", #name, "", #equivalent )
//   * insert ElementMapping( #orderPlacerSpecialty, "A.2.5 Order placer specialty", #specialty, "", #equivalent )
//   * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #address, "", #source-is-broader-than-target )
//   * insert ElementMapping( #orderPlacerContactDetails, "A.2.6 Order placer contact details", #telecom, "", #source-is-broader-than-target )
  * insert ElementMapping( #orderPlacerOrganization, "A.2.7 Order placer organization", #name, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #orderInformation, "A.2 Order Information", #based[ImOrder], "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #orderInformation, "A.2 Order Information", #based[ImOrder], "", #equivalent )

