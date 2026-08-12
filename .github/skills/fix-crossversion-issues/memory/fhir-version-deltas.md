# FHIR Cross-Version Deltas — Verified Fix Catalog

Verified element/type changes across FHIR R4/R5/R6 and their FSH fix patterns. See
[README.md](./README.md) for the update protocol and entry template. Always re-verify against the
core `StructureDefinition` before applying.

---

### Condition.participant / AllergyIntolerance.participant — backbone removed in R6
- Versions: R5 → R6 (R4 also lacks `participant`).
- Delta: R5 added a `participant` backbone (`participant.actor`, `participant.function`). R6 removed it
  and uses `recorder` (0..1 Reference) and `asserter` (0..1 Reference), like R4.
- Symptom: `No element found at path participant.actor ...` / `The element or path you referenced does not exist: participant.actor`.
- Fix (FSH): map `participant.actor` → `asserter` (the "asserter/reporter" semantics).
  - Before: `* participant.actor only Reference(PractitionerRoleEu or ... or OrganizationEuCore or CareTeam)`
  - After:  `* asserter only Reference(PractitionerRoleEu or PractitionerEu or PatientEuCore or RelatedPerson or Device)`
  - Example instance: `* participant[+].actor = Reference(X)` → `* asserter = Reference(X)`
- Caveat: R6 core reference targets are narrower than R5 `participant.actor`.
  `Condition.asserter`: Practitioner, PractitionerRole, Patient, RelatedPerson, Device, Group (no Organization/CareTeam).
  `AllergyIntolerance.asserter`: Patient, RelatedPerson, Practitioner, PractitionerRole.
  Drop targets the new core forbids, or split to `recorder` where semantics fit.
- Verified: 2026-08-12, core pkg hl7.fhir.r6.core#current.

### Immunization.protocolApplied.doseNumber / seriesDoses — type changed to CodeableConcept in R6
- Versions: R4 (`positiveInt`|`string`) / R5 (`positiveInt`) → R6 (`CodeableConcept`).
- Delta: In R6 both `protocolApplied.doseNumber` and `protocolApplied.seriesDoses` are `CodeableConcept`.
- Symptom: `Cannot assign string value: 2. Value does not match element type: CodeableConcept`.
- Fix (FSH):
  - Before: `* protocolApplied[0].doseNumber = "2"`
  - After:  `* protocolApplied[0].doseNumber.text = "2"` (or assign a proper coding)
  - Same for `seriesDoses`.
- Caveat: none; `.text` is the least-assumption fix. Use a coding if a value set applies.
- Verified: 2026-08-12, core pkg hl7.fhir.r6.core#current.

### DiagnosticReport.composition / DiagnosticReport.study — element vs extension across versions
- Versions: R4 vs R5/R6.
- Delta: R5/R6 `DiagnosticReport` has first-class `composition` (Reference) and `study` (Reference)
  elements. R4 has neither; it uses extensions
  (`http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.composition`) and the
  R4 `imagingStudy` element instead of `study`.
- Symptom (building R4 from R5 FSH): `element or path does not exist: composition` / `study`.
- Fix (FSH): guard per version (mirror existing `//R4` pattern):
  - R5/R6: `* composition only Reference(...)`, `* study only Reference(ImagingStudyEuImaging)`.
  - R4: use `extension[composition]` and `imagingStudy` element instead.
- Caveat: confirm `study` vs `imagingStudy` naming in the target core SD before editing; some derived
  elements (e.g. `derivedFrom[study]`) are profile slices, not core paths.
- Verified: 2026-08-12 from IG `//R4` guards in im-diagnosticreport.fsh; re-verify against core SD when applying.

---

## Known Blockers (not FSH-fixable)
### hl7.fhir.eu.base-r6 package missing
- An R6 IG that inherits EU base profiles (patient/organization/practitioner/practitionerRole-eu-core
  via `http://hl7.eu/fhir/base-r6/...`) cannot resolve them until an R6 EU base package is built/installed.
- Symptom: `InstanceOf http://hl7.eu/fhir/base-r6/StructureDefinition/patient-eu-core not found` /
  `No definition for the type http://hl7.eu/fhir/base-r6/...`.
- Action: build/install the R6 base package (e.g. from `r6-dependencies/base-r6`) — not an FSH edit.
- Verified: 2026-08-12, `~/.fhir/packages` had no `hl7.fhir.eu.base-r6`.
