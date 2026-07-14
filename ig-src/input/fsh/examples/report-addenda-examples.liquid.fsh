// Examples illustrating imaging report succession management:
//   - Addendum   (content added)   -> DiagnosticReport.status = appended, Composition.relatesTo = appends
//   - Replacement (content changed) -> DiagnosticReport.status = corrected, Composition.relatesTo = replaces
// They reuse shared resources from the structured report example set.

RuleSet: AddendaImagingReportCompositionShared
* subject = Reference(PatientStructuredReport)
* language = #en-GB
* type = http://www.ama-assn.org/go/cpt#93351 "STRESS TTE COMPLETE"
* category[imaging] = http://hl7.eu/fhir/{% if isR5 %}eu-{% endif %}health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* category[imaging-report] = $loinc#85430-7
* author[organization] = Reference(OrganizationStructuredReport)
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">Imaging report succession example.</div>"
* section[imagingstudy].title = "Imaging Study"
* section[imagingstudy].code = $loinc#18726-0 "Radiology studies (set)"
* section[imagingstudy].entry[+] = Reference(ImagingStudyStructuredReport)
* section[order].title = "Order"
* section[order].code = $loinc#55115-0 "Requested imaging studies information Document"
* section[order].text.status = #generated
* section[order].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">Accession Number: 87654321</div>"
* section[order].entry[+].type = #ServiceRequest
* section[order].entry[=].identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* section[order].entry[=].identifier.system = "http://example.org/myhosptital/accessionsystem"
* section[order].entry[=].identifier.value = "87654321"
* section[history].title = "History"
* section[history].code = $loinc#11329-0 "History general Narrative - Reported"
* section[history].emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"
* section[history].text.status = #generated
* section[history].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">Unavailable</div>"
* section[procedure].title = "Procedure"
* section[procedure].code = $loinc#55111-9 "Current imaging procedure descriptions Document"
* section[procedure].emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"
* section[procedure].text.status = #generated
* section[procedure].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">Unavailable</div>"
* section[report].title = "Report"
* section[report].code = $loinc#LP173421-1 "Report"
* section[report].entry[narrative-report] = Reference(NarrativeFindingsAll)

RuleSet: AddendaImagingReportDRShared
* subject = Reference(PatientStructuredReport)
* code = http://www.ama-assn.org/go/cpt#93351 "STRESS TTE COMPLETE"
* category[imaging] = http://hl7.eu/fhir/{% if isR5 %}eu-{% endif %}health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* category[imaging-report] = $loinc#85430-7
* result[+] = Reference(NarrativeFindingsAll)

// ---------------- Addendum (content added) ----------------
Instance: CompositionImagingAddendum
InstanceOf: CompositionEuImaging
Title: "Composition: imaging report addendum"
Description: "Addendum composition that appends content to a still-active prior report (Composition.relatesTo = appends)."
Usage: #example
* insert AddendaImagingReportCompositionShared
* identifier.system = "http://example.org/myhosptital/reportidentifiers"
* identifier.value = "report-0001"
* date = "2025-09-10T10:00:00.000Z"
{{R4}}* status = #amended
{{R5}}* status = #appended
{{R4}}* extension[version].valueString = "2"
{{R5}}* version = "2"
* extension[diagnosticreport-reference].valueReference = Reference(DiagnosticReportImagingAddendum)
* title = "Addendum to transthoracic echocardiogram"
{{R4}}* relatesTo[appended_document].code = #appends
{{R4}}* relatesTo[appended_document].targetIdentifier.system = "http://example.org/myhosptital/bundleidentifiers"
{{R4}}* relatesTo[appended_document].targetIdentifier.value = "bundle-report-original"
{{R5}}* relatesTo[appended_document].type = #appends
{{R5}}* relatesTo[appended_document].resourceReference.identifier.system = "http://example.org/myhosptital/bundleidentifiers"
{{R5}}* relatesTo[appended_document].resourceReference.identifier.value = "bundle-report-original"

Instance: DiagnosticReportImagingAddendum
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: imaging report addendum"
Description: "Addendum report; content was added, so DiagnosticReport.status = appended (aligned with Composition.relatesTo = appends)."
Usage: #example
* insert AddendaImagingReportDRShared
* identifier.system = "http://example.org/myhosptital/reportidentifiers"
* identifier.value = "report-0001"
* status = #appended
{{R4}}* extension[composition].valueReference = Reference(CompositionImagingAddendum)
{{R5}}* composition = Reference(CompositionImagingAddendum)

// ---------------- Replacement (content changed) ----------------
Instance: CompositionImagingReplacement
InstanceOf: CompositionEuImaging
Title: "Composition: imaging report replacement"
Description: "Replacement composition that supersedes a prior report (Composition.relatesTo = replaces)."
Usage: #example
* insert AddendaImagingReportCompositionShared
* identifier.system = "http://example.org/myhosptital/reportidentifiers"
* identifier.value = "report-0002"
* date = "2025-09-11T10:00:00.000Z"
{{R4}}* status = #amended
{{R5}}* status = #corrected
{{R4}}* extension[version].valueString = "2"
{{R5}}* version = "2"
* extension[diagnosticreport-reference].valueReference = Reference(DiagnosticReportImagingReplacement)
* title = "Corrected transthoracic echocardiogram"
{{R4}}* relatesTo[replaced_document].code = #replaces
{{R4}}* relatesTo[replaced_document].targetIdentifier.system = "http://example.org/myhosptital/bundleidentifiers"
{{R4}}* relatesTo[replaced_document].targetIdentifier.value = "bundle-report-superseded"
{{R5}}* relatesTo[replaced_document].type = #replaces
{{R5}}* relatesTo[replaced_document].resourceReference.identifier.system = "http://example.org/myhosptital/bundleidentifiers"
{{R5}}* relatesTo[replaced_document].resourceReference.identifier.value = "bundle-report-superseded"

Instance: DiagnosticReportImagingReplacement
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: imaging report replacement"
Description: "Replacement report; content was changed, so DiagnosticReport.status = corrected (aligned with Composition.relatesTo = replaces)."
Usage: #example
* insert AddendaImagingReportDRShared
* identifier.system = "http://example.org/myhosptital/reportidentifiers"
* identifier.value = "report-0002"
* status = #corrected
{{R4}}* extension[composition].valueReference = Reference(CompositionImagingReplacement)
{{R5}}* composition = Reference(CompositionImagingReplacement)
