
// Transaction bundle
Instance: MHDTransactionBundleKneeMriExample
InstanceOf: Bundle
Title: "Example MHD Knee Mri Transaction Bundle"
Description: "Example MHD Knee Mri Transaction Bundle"
Usage: #example
* type = #transaction
* timestamp = 1993-11-29T12:36:56+00:00
* entry[+]
  * fullUrl = "DocumentReference/1"
  * resource = DocumentReference-knee-mri-example
  * request[+]
    * method = #PUT
    * url = "DocumentReference/1"
* entry[+]
  * fullUrl = "Bundle/1"
  * resource = ImagingReport-knee-mri-example
  * request[+]
    * method = #PUT
    * url = "ImagingReport/1"
// DocumentReference

Instance: DocumentReference-knee-mri-example
InstanceOf: ImReportDocumentReference
Title: "MHD DocumentReference for knee MRI Imaging Report example"
* identifier[entry-uuid]
  * system = "urn:ietf:rfc:3986"
  * use = #official
  * value = "MRIKneeReportexample"
* status = #current
* modality = https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_33.html#US
* category[imaging] = $loinc#18748-4 "Diagnostic imaging study"
* type = Hl7EuDocumentTypes#imaging-manifest-v0-0-1
* subject = Reference(Patient-knee-mri-example)
* bodySite = $sct#6757004 "Right knee"
* author = Reference(Practitioner-knee-mri-example)
* custodian = Reference(Organization-knee-mri-example)
* content[+]
  * attachment[0]
    * contentType = #application/pdf
    * url = "Bundle/1"
    * language = #en
    * creation = "2024-01-01T00:00:00Z"
  * profile[hl7eu-imaging-report].valueCanonical = "http://hl7.eu/fhir/imaging-r5/StructureDefinition/ImReport"
// * attachment[0]
//   * contentType = #application/pdf
//   * url = "https://drive.google.com/file/d/1LhscANABX6_TKrZBfq9cDq2Sqzg2MBI_/view?usp=drive_link"
//   * title = "MRI LEFT KNEE"