Instance: UnstructuredReportExample
InstanceOf: ImUnstructuredDocumentReference
Title: "DocumentReference: Unstructured Report"
Description: "MHD DocumentReference for unstructured report."
Usage: #example
* contained[+] = PatientUnstructuredReport
* contained[+] = OrganizationUnstructuredReport
* identifier[entry-uuid]
  * system = "urn:ietf:rfc:3986"
  * use = #official
  * value = "http://unstructured-report.example.com"
* status = #current
//R4* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#CT
* modality = http://dicom.nema.org/resources/ontology/DCM#CT
* category[class-code] = $xds-class-code#REPORTS "Reports"
* type = $loinc#18748-4 "Diagnostic imaging study"
* subject = Reference(PatientUnstructuredReport)
* custodian = Reference(OrganizationUnstructuredReport)
* content[+]
  * attachment[0]
    * contentType = #application/pdf
    * url = "./Binary/unstructured-pdf"
    * language = #de
    * creation = "2024-01-01T00:00:00Z"
  
Instance: PatientUnstructuredReport
InstanceOf: $EuPatient 
Title: "Patient: unstructured report"
Description: "Patient used in the unstructured report"
Usage: #example
* name
  * use = #official
  * text = "Jane Doe"
  * family = "Doe"
  * given = "Jane"
* birthDate = "1976-04-29"

Instance: OrganizationUnstructuredReport
InstanceOf: $EuOrganization 
Title: "Organization: unstructured report"
Description: "Organization used in the unstructured report"
Usage: #example
* name = "Rediologie Zentrum Bremen"
* contact
  * telecom[+]
    * system = #phone
    * value = "0421 / 84 13 13 04"   
  * telecom[+]
    * system = #fax
    * value = "0421 / 84 13 13 84"   
  * telecom[+]
    * system = #url
    * value = "radiologiezentrum-bremen.de"   
  * address[+]
    * type = #physical
    * text = "Schwachhauser Heerstr. 54, 28209 Bremen"
    * line[+] = "Schwachhauser Heerstr. 54"
      * extension[$street-name-url].valueString = "Schwachhauser Heerstr."
      * extension[$house-number-url].valueString = "54"
    * postalCode = "28209"
    * city = "Bremen"

Instance: BinaryUnstructuredReport
InstanceOf: Binary
Title: "Binary: Unstructured report pdf"
Description: "Binary resource holding the unstructured report pdf."
Usage: #example
* id = "unstructured-pdf"
* contentType = #application/pdf
* data = "ig-loader-9df9cc92-0f09-4dbb-8d5d-e74bd9eaac3a.pdf"
