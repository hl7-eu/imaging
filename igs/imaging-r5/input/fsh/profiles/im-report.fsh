Profile: BundleReportEuImaging
Parent: Bundle
Title: "Bundle: Imaging Report"
Description: "Document Bundle for Imaging Report"
* insert SetFmmAndStatusRule( 1, draft )

* obeys dr-comp-author-org

* identifier 1..1
* type = #document
* total ..0

* entry 2..*
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open
  * link ..0
  * fullUrl 1..1
  * resource 1..
  * search ..0
  * request ..0
  * response ..0
* entry contains 
    CompositionEuImaging 1..1 and
    DiagnosticReportEuImaging 1..1 and
    Patient 1..1 and 
    ImagingStudy 1..* and 
    requested-procedure 0..* and
    performed-procedure 0..* and 
    findings 0..* and
    key-images 0..* and
    practitioner 0..* and
    organization 0..* and
    binary 0..*

* entry[CompositionEuImaging]
  * ^short = "The Composition containing the rendering of the imaging report"
  * resource only CompositionEuImaging
* entry[DiagnosticReportEuImaging]
  * ^short = "The Diagnostic Report containing the imaging report"
  * resource only DiagnosticReportEuImaging
* entry[Patient]
  * ^short = "The patient the report is about"
  * resource only $EuPatient
* entry[ImagingStudy]
  * ^short = "The imaging study/studies associated with this report"
  * resource only ImagingStudyEuImaging
* entry[requested-procedure]
  * ^short = "Requested procedure to be performed"
  * resource only ServiceRequestOrderEuImaging
* entry[performed-procedure]
  * ^short = "Procedures performed as part of the imaging study"
  * resource only ProcedureEuImaging
* entry[findings]
  * ^short = "Findings referred to from report"
  * resource only ObservationFindingEuImaging
* entry[key-images]
  * ^short = "Key Images referred to from report"
  * resource only ImagingSelectionKeyImageEuImaging
* entry[practitioner]
  * ^short = "Practitioner involved in the report"
  * resource only PractitionerEu or $EuPractitionerRole
* entry[organization]
  * ^short = "Organization involved in the report"
  * resource only $EuOrganization
* entry[binary]
  * ^short = "The original rendered report as a binary attachment"
  * resource only Binary


Invariant: dr-comp-author-org
Description: "DiagnosticReport and Composition SHALL have the same author Organization"
Expression: "Bundle.entry.resource.ofType(DiagnosticReport).performer.resolve().ofType(Organization) = Bundle.entry.resource.ofType(Composition).author.resolve().ofType(Organization) or (Bundle.entry.resource.ofType(DiagnosticReport).performer.resolve().ofType(Organization).empty() and Bundle.entry.resource.ofType(Composition).author.resolve().ofType(Organization).empty())"
Severity:    #error


Profile: BundleReportMinimalMetadataEuImaging
Parent: Bundle
Title: "Bundle: Imaging Report Minimal Metadata"
Description: "Collection Bundle with minimal metadata for imaging report exchange"
* insert SetFmmAndStatusRule( 1, draft )

* type = #collection
* total ..0
* link ..0
* entry 1..*
  * insert SliceElement( #profile, resource )
  * link ..0
  * fullUrl 1..1
  * resource 1..
  * search ..0
  * request ..0
  * response ..0
* entry contains
  DiagnosticReportEuImagingMinimalMetadata 1..1 and
    Patient 0..1 and
    ImagingStudy 0..1
* entry[DiagnosticReportEuImagingMinimalMetadata]
  * ^short = "The Diagnostic Report containing the imaging report"
  * resource only DiagnosticReportEuImagingMinimalMetadata
* entry[Patient]
  * ^short = "The patient the report is about"
  * resource only $EuPatient
* entry[ImagingStudy]
  * ^short = "The imaging study associated with this report"
  * resource only ImagingStudyEuImaging