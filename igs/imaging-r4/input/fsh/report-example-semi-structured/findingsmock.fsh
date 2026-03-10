Instance: ObservationAnchor
InstanceOf: Observation
Usage: #example
Title: "Observation Anchor"
Description: "Placeholder observation resource to satisfy the requirement of the R5 validator to have a .result reference if .composition is present in the report, even if the report is semi-structured and does not contain any result reference. This is a known issue: https://github.com/HL7/fhir-ig-publisher/issues/1267"
* status = #final
* code = $loinc#59776-5 "Procedure findings Narrative"
* valueString = "."
* performer[+] = Reference(PractitionerRoleSemiStructuredReportAuthor)
* subject = Reference(PatientSemiStructuredReport)
* effectiveDateTime = "2025-05-08T00:00:00Z"