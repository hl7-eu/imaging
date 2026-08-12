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
- Fix (FSH, version-guarded): map `participant.actor` → `asserter` (the "asserter/reporter" semantics).
  ```fsh
  //R5 * participant.actor only Reference(PractitionerRoleEu or ... or OrganizationEuCore or CareTeam)
  //R6-start
  * asserter only Reference(PractitionerRoleEu or PractitionerEu or PatientEuCore or RelatedPerson or Device)
  //R6-end
  ```
  Example instance: comment `//R5 * participant[+].actor = Reference(X)`, then `//R6-start` / `* asserter = Reference(X)` / `//R6-end`.
- Caveat: R6 core reference targets are narrower than R5 `participant.actor`.
  `Condition.asserter`: Practitioner, PractitionerRole, Patient, RelatedPerson, Device, Group (no Organization/CareTeam).
  `AllergyIntolerance.asserter`: Patient, RelatedPerson, Practitioner, PractitionerRole.
  Drop targets the new core forbids, or split to `recorder` where semantics fit.
- Verified: 2026-08-12, core pkg hl7.fhir.r6.core#current. Applied to base-r6 (Condition + AllergyIntolerance + example) → SUSHI 0 errors.

### Immunization.protocolApplied.doseNumber / seriesDoses — type changed to CodeableConcept in R6
- Versions: R4 (`positiveInt`|`string`) / R5 (`positiveInt`) → R6 (`CodeableConcept`).
- Delta: In R6 both `protocolApplied.doseNumber` and `protocolApplied.seriesDoses` are `CodeableConcept`.
- Symptom: `Cannot assign string value: 2. Value does not match element type: CodeableConcept`.
- Fix (FSH, version-guarded):
  ```fsh
  //R5 * protocolApplied[0].doseNumber = "2"
  //R5 * protocolApplied[0].seriesDoses = "2"
  //R6-start
  * protocolApplied[0].doseNumber.text = "2"
  * protocolApplied[0].seriesDoses.text = "2"
  //R6-end
  ```
- Caveat: none; `.text` is the least-assumption fix. Use a coding if a value set applies.
- Verified: 2026-08-12, core pkg hl7.fhir.r6.core#current. Applied to base-r6 immunization example → SUSHI 0 errors.

### DiagnosticReport.composition / DiagnosticReport.study — element vs extension across versions
- Versions: R4 vs R5/R6.
- Delta: R5/R6 `DiagnosticReport` has first-class `composition` (Reference) and `study` (Reference)
  elements. R4 has neither; it uses extensions
  (`http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.composition`) and the
  R4 `imagingStudy` element instead of `study`.
- Symptom (building R4 from R5 FSH): `element or path does not exist: composition` / `study`.
- Fix (FSH): guard per version. Since the R5 and R6 shapes are identical, use the combined `{{R56}}`
  guard rather than separate `{{R5}}` and `{{R6}}` blocks:
  - R5/R6 (one block): `{{R56}}* composition only Reference(...)`, `{{R56}}* study only Reference(ImagingStudyEuImaging)`.
  - R4: use `//R4`-guarded `extension[composition]` and `imagingStudy` element instead.
- Caveat: confirm `study` vs `imagingStudy` naming in the target core SD before editing; some derived
  elements (e.g. `derivedFrom[study]`) are profile slices, not core paths.
- Verified: 2026-08-12 from IG `//R4` guards in im-diagnosticreport.fsh; re-verify against core SD when applying.

### Observation.derivedFrom slicing — missing R6 version guard (templated IG)
- Versions: R5 → R6 (templated multi-version IG using `{{R4}}`/`{{R5}}`/`{{R6}}` liquid guards).
- Delta: not a core change — `Observation.derivedFrom` is `0..* Reference` in R5 and R6 alike. The
  profile's `derivedFrom` slicing (`contains study 1..1 and dicomSrInstance 0..*`) was guarded only
  for `{{R4}}` and `{{R5}}`, so R6 got no slice and examples referencing `derivedFrom[study]` failed.
- Symptom: `The element or path you referenced does not exist: derivedFrom[study].*` in examples.
- Fix (templated guard): the R5 and R6 slicing is identical, so prefer a single combined `{{R56}}`
  block over duplicating the `{{R5}}` slicing into a separate `{{R6}}` block; then
  `_preprocessMultiVersion.sh 6.0.0-ballot3`. (For standalone repos, use the
  `//R5 ` + `//R6-start`/`//R6-end` marker form instead.)
- Verified: 2026-08-12, R6 core Observation.derivedFrom = 0..* Reference; imaging-r6 56 → 45 errors.

### ImagingSelection profiles — missing R6 block + `derivedFrom` cardinality 0..* → 0..1
- Versions: R5 → R6 (templated IG).
- Delta 1 (guard): `ImagingSelection` exists natively in R5 and R6, but the profiles
  (`ImagingSelectionEuImaging`, `SrInstanceImagingSelectionEuImaging`) were only guarded `{% if isR5 %}`,
  so they didn't build for R6 → cascading `Parent ... not found` / `No definition for the type` errors
  in every profile that references them.
- Delta 2 (core): `ImagingSelection.derivedFrom` is `0..* Reference(ImagingStudy|DocumentReference)` in
  R5 but `0..1` in R6 — so the R5 slicing (`contains study 1..1`) is illegal in R6 (can't slice a max-1
  element) → `No element found at path derivedFrom[study]`.
- Delta 3 (core): `ImagingSelection.instance.imageRegion3D` was removed in R6 (R5 had it).
- Fix (templated guards): extend the profile blocks to `{% if isR5 or isR6 %}` (combined, not a
  duplicate R6 block). Inside, guard the version-specific lines with prefixes:
  ```fsh
  {{R5}}* derivedFrom 1..*
  {{R5}}  * insert SliceElement( #profile, $this )
  {{R5}}* derivedFrom contains study 1..1
  {{R5}}* derivedFrom[study] only Reference( ImagingStudyEuImaging )
  {{R6}}* derivedFrom 1..1
  {{R6}}* derivedFrom only Reference( ImagingStudyEuImaging )
  ...
  {{R5}}  * imageRegion3D 0..0   // R6 removed this element
  ```
- Verified: 2026-08-12, R6 core ImagingSelection.derivedFrom=0..1, no instance.imageRegion3D; imaging-r6 31 → 24 errors.

### Composition.relatesTo — RelatedArtifact (R5) → BackboneElement with target[x] (R6)
- Versions: R5 → R6.
- Delta: R5 `Composition.relatesTo` is a `RelatedArtifact` datatype (so `.resourceReference`, `.resource`,
  `.type` are RelatedArtifact fields). R6 makes `relatesTo` a `BackboneElement` with `.type` (code) and
  `.target[x]` (choice: uri | Attachment | canonical | Reference | markdown). The `resourceReference`
  field no longer exists; the Reference choice is `targetReference`.
- Symptom: `element or path does not exist: relatesTo[replaced_document].resourceReference[.reference|.identifier...]`.
- Fix (per version — `.type` is shared so keep it `{{R56}}`, split only the reference field):
  ```fsh
  {{R56}}* relatesTo[replaced_document].type = #replaces
  {{R5}}* relatesTo[replaced_document].resourceReference 1..1
  {{R5}}* relatesTo[replaced_document].resourceReference.identifier 1..1
  {{R6}}* relatesTo[replaced_document].targetReference 1..1
  {{R6}}* relatesTo[replaced_document].targetReference.identifier 1..1
  ```
  Apply the same split to example instances (`resourceReference.identifier` → `targetReference.identifier`).
  The slice discriminator path `type` works for both (RelatedArtifact.type and BackboneElement.type).
- Verified: 2026-08-12, R5 core relatesTo=RelatedArtifact, R6 core relatesTo=BackboneElement+target[x]; imaging-r6 12 → 3 errors.

### AdverseEvent.suspectEntity.instance / contributingFactor — choice → CodeableReference in R6
- Versions: R5 → R6.
- Delta: R5 `AdverseEvent.suspectEntity.instance[x]` is `CodeableConcept|Reference` (so `instanceReference`);
  R6 collapses it to a single `instance` of type `CodeableReference`. R5 `contributingFactor` is a
  BackboneElement with `item[x]` (`Reference|CodeableConcept`); R6 makes `contributingFactor` itself a
  `CodeableReference` (0..*) with NO `item` sub-element.
- Symptom: `No element found at path suspectEntity[procedure].instanceReference` /
  `contributingFactor[allergy].itemReference` / `.item`.
- Fix (per version):
  ```fsh
  {{R5}}* suspectEntity[procedure].instanceReference only Reference(ProcedureEuImaging)
  {{R6}}* suspectEntity[procedure].instance only CodeableReference(ProcedureEuImaging)
  ...
  {{R5}}* contributingFactor[allergy]
  {{R5}}  * itemReference only Reference($EuAllergyIntolerance)
  {{R6}}* contributingFactor[allergy] only CodeableReference($EuAllergyIntolerance)
  ```
- Verified: 2026-08-12, R6 core suspectEntity.instance=CodeableReference, contributingFactor=CodeableReference; imaging-r6 3 → 0 errors.

### Device.version → Device.deviceVersion in R6
- Versions: R4/R5 (`version`) → R6 (`deviceVersion`). Applies to profiles AND Mappings.
- Symptom: `No element found at path version for <Mapping/Profile>`.
- Fix: `{{R4}}`/`{{R5}}` lines keep `version`; `{{R6}}` line uses `deviceVersion`.
- Verified: 2026-08-12, R6 core has Device.deviceVersion (no Device.version); imaging-r6 mapping fixed.

---

## Resolved Dependency Notes
### hl7.fhir.eu.extensions has no R6 build — reuse the R5 package
- EU extensions (`information-recipient` = `http://hl7.eu/fhir/StructureDefinition/information-recipient`,
  `composition-diagnosticReportReference` = `http://hl7.eu/fhir/extensions/StructureDefinition/...`) are
  defined only in `hl7.fhir.eu.extensions` (fhirVersion 5.0.0). Extensions are version-tolerant, so add
  `hl7.fhir.eu.extensions: 1.3.0` to the R6 dependency block — SUSHI resolves the extension SDs fine.
- Symptom (before): `unable to locate extension definition for: http://hl7.eu/fhir/...`.
- Verified: 2026-08-12, imaging-r6 24 → 12 errors after adding the dependency.

---

## Known Blockers (not FSH-fixable)
### hl7.fhir.eu.base-r6 package missing
- An R6 IG that inherits EU base profiles (patient/organization/practitioner/practitionerRole-eu-core
  via `http://hl7.eu/fhir/base-r6/...`) cannot resolve them until an R6 EU base package is built/installed.
- Symptom: `InstanceOf http://hl7.eu/fhir/base-r6/StructureDefinition/patient-eu-core not found` /
  `No definition for the type http://hl7.eu/fhir/base-r6/...`.
- Action: build/install the R6 base package (e.g. from `r6-dependencies/base-r6`) — not an FSH edit.
- **Install must include snapshots.** Packaging SUSHI's `fsh-generated/resources` (differential-only)
  changes the symptom to `Structure Definition <url> is missing a snapshot. Snapshot is required for
  import.` A consuming IG's SUSHI needs snapshots, which are produced by the **IG Publisher**, not
  SUSHI. Run a full IG-Publisher (`genonce`) build of base-r6, which installs
  `hl7.fhir.eu.base-r6#dev` (with snapshots) into `~/.fhir/packages`; then depend on it as
  `hl7.fhir.eu.base-r6: dev`. Do not hand-package SUSHI differentials.
- Gotcha: a copied repo (base-r5 → base-r6) keeps the old `ig.ini` `ig =` line; update it to
  `ImplementationGuide-hl7.fhir.eu.base-r6.json` or the publisher aborts parsing the old IG file.
- Verified: 2026-08-12. base-r6 SUSHI 0 errors; IG-Publisher build installed `#dev` with snapshots;
  imaging-r6 dropped 92 → 56 errors once depending on `hl7.fhir.eu.base-r6: dev`.
