Instance: A-1-2-PatientContactInformationMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.2 Patient/subject related contact information"
* name = "A.1.2"
* title = "A.1.2 Patient/subject related contact information mapping"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.2 Patient/subject related contact information section and the FHIR profiles."

* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-patient-contact"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-patient-contact"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-patient"
  
  * insert ElementMapping( #address, "A.1.2.1 Address", #address, "", #equivalent )
  * insert ElementMapping( #telecom, "A.1.2.2 Telecom", #telecom, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #contact, "A.1.2 Patient/subject related contact information", #subject, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #contact, "A.1.2 Patient/subject related contact information", #subject, "", #equivalent )

