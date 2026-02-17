
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Consumer_ImagingStudyEuImaging
Parent: ImagingStudyEuImaging
Id: Consumer-ImagingStudyEuImaging
Title: "ImagingStudyEuImaging: obligations"
Description: "Consumer obligations for ImagingStudyEuImaging"
* series.modality
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.eventType, EHDSImagingReport.body.examinationReport.modality, EHDSImagingStudy.modality, EHDSImagingStudy.series.seriesModality"
* series.bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.bodySite, EHDSImagingStudy.bodySite, EHDSImagingStudy.series.bodySite"
