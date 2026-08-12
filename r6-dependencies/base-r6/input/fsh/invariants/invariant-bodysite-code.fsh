Invariant: eu-bodysite-1
Description: "Either a body site code or a reference to a BodyStructure resource SHALL be used, but not both."
Severity: #error
Expression: "(coding.empty() and text.empty()) or extension('http://hl7.org/fhir/StructureDefinition/bodySite').empty()"