Instance: ObservationAnchor
InstanceOf: Observation
Usage: #example
Title: "ObservationMock"
Description: "Placeholder observation resource to satisfy the requirement of the R5 validator to have a .result reference if .composition is present in the report, even if the report is semi-structured and does not contain any result reference. This is a known issue: "
* status = #final
* code = $loinc#59776-5 "Procedure findings Narrative"
* valueString = "."
* performer[+] = Reference(PractitionerRoleSemiStructuredReportAuthor)
* subject = Reference(PatientSemiStructuredReport)
* effectiveDateTime = "2025-05-08T00:00:00Z"