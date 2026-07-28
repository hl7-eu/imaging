Instance: ImagingReportReplacementExample
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: Replacement example"
Description: "Minimal example of an amended Imaging Report whose Composition replaces a prior document. This is not a FHIR document Bundle."
Usage: #example
* identifier
  * system = "https://example.org/imaging-report-identifiers"
  * value = "report-replacement-example"
* status = #amended
* code = $loinc#18748-4 "Diagnostic imaging study"
* category[imaging-report] = $loinc#85430-7
* category[imaging] = http://hl7.eu/fhir/{% if isR5 %}eu-{% endif %}health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* subject = Reference(PatientStructuredReport)
* performer[organization] = Reference(OrganizationStructuredReport)
{{R4}}* imagingStudy = Reference(ImagingStudyStructuredReport)
{{R5}}* study = Reference(ImagingStudyStructuredReport)
{{R4}}* extension[composition].valueReference = Reference(ImagingReportReplacementComposition)
{{R5}}* composition = Reference(ImagingReportReplacementComposition)
{{R5}}* result = Reference(ObservationNarrative)

Instance: ImagingReportReplacementComposition
InstanceOf: CompositionEuImaging
Title: "Composition: Replacement example"
Description: "Composition for the replacement Imaging Report example."
Usage: #example
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Replacement imaging report.</p></div>"
* identifier
  * system = "https://example.org/imaging-report-identifiers"
  * value = "report-replacement-example"
* status = #final
* type = $loinc#18748-4 "Diagnostic imaging study"
* category[imaging-report] = $loinc#85430-7
* category[imaging] = http://hl7.eu/fhir/{% if isR5 %}eu-{% endif %}health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* subject = Reference(PatientStructuredReport)
* date = "2026-07-27T10:00:00Z"
* author[organization] = Reference(OrganizationStructuredReport)
* title = "Replacement imaging report"
{{R4}}* relatesTo[replaced_document].targetIdentifier
{{R4}}  * system = "https://example.org/imaging-document-identifiers"
{{R4}}  * value = "prior-document"
{{R5}}* relatesTo[replaced_document].resourceReference.identifier
{{R5}}  * system = "https://example.org/imaging-document-identifiers"
{{R5}}  * value = "prior-document"
* section[imagingstudy]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Imaging study information</div>"
  * entry[imagingstudy] = Reference(ImagingStudyStructuredReport)
* section[order]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Order information</div>"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
* section[history]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">History information</div>"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
* section[procedure]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Procedure information</div>"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
{{R5}}* section[findings]
{{R5}}  * text.status = #generated
{{R5}}  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Technical placeholder required by R5 validation.</div>"
{{R5}}  * entry[finding] = Reference(ObservationNarrative)

Instance: ImagingReportRetractionExample
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: Retraction example"
Description: "Minimal example of a retracted Imaging Report whose entered-in-error Composition replaces a prior document. This is not a FHIR document Bundle."
Usage: #example
* identifier
  * system = "https://example.org/imaging-report-identifiers"
  * value = "report-retraction-example"
* status = #entered-in-error
* code = $loinc#18748-4 "Diagnostic imaging study"
* category[imaging-report] = $loinc#85430-7
* category[imaging] = http://hl7.eu/fhir/{% if isR5 %}eu-{% endif %}health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* subject = Reference(PatientStructuredReport)
* performer[organization] = Reference(OrganizationStructuredReport)
{{R4}}* imagingStudy = Reference(ImagingStudyStructuredReport)
{{R5}}* study = Reference(ImagingStudyStructuredReport)
{{R4}}* extension[composition].valueReference = Reference(ImagingReportRetractionComposition)
{{R5}}* composition = Reference(ImagingReportRetractionComposition)
{{R5}}* result = Reference(ObservationNarrative)

Instance: ImagingReportRetractionComposition
InstanceOf: CompositionEuImaging
Title: "Composition: Retraction example"
Description: "Entered-in-error Composition for the retraction Imaging Report example."
Usage: #example
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The previous imaging report was issued in error and has been withdrawn.</p></div>"
* identifier
  * system = "https://example.org/imaging-report-identifiers"
  * value = "report-retraction-example"
* status = #entered-in-error
* type = $loinc#18748-4 "Diagnostic imaging study"
* category[imaging-report] = $loinc#85430-7
* category[imaging] = http://hl7.eu/fhir/{% if isR5 %}eu-{% endif %}health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* subject = Reference(PatientStructuredReport)
* date = "2026-07-27T11:00:00Z"
* author[organization] = Reference(OrganizationStructuredReport)
* title = "Retracted imaging report"
{{R4}}* relatesTo[replaced_document].targetIdentifier
{{R4}}  * system = "https://example.org/imaging-document-identifiers"
{{R4}}  * value = "prior-document"
{{R5}}* relatesTo[replaced_document].resourceReference.identifier
{{R5}}  * system = "https://example.org/imaging-document-identifiers"
{{R5}}  * value = "prior-document"
* section[imagingstudy]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">The previous imaging report was issued in error and has been withdrawn.</div>"
  * entry[imagingstudy] = Reference(ImagingStudyStructuredReport)
* section[order]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No report content is provided.</div>"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
* section[history]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No report content is provided.</div>"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
* section[procedure]
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No report content is provided.</div>"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
{{R5}}* section[findings]
{{R5}}  * text.status = #generated
{{R5}}  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No report content is provided; this entry is a technical placeholder required by R5 validation.</div>"
{{R5}}  * entry[finding] = Reference(ObservationNarrative)
