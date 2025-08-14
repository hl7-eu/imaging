////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Manifest_ImImagingStudyManifest
Parent: ImImagingStudyManifest
Id: Manifest-ImImagingStudyManifest
Title: "ImImagingStudyManifest: obligations"
Description: "Manifest obligations for ImImagingStudyManifest"
* entry[imagingstudy]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.dicomStudyMetadata"
