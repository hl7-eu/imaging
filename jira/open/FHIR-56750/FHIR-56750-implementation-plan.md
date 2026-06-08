# Implementation Plan for FHIR-56750

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56750 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File |
| Resolution/Disposition | Recommended disposition: Accept As Requested |
| Summary | Phrasing is circular ("if supported, must support"); rewrite to specify what triggers the SHALL |

## Resolution Interpretation

The proposed resolution calls for rewriting each circular conformance sentence so the triggering condition is explicit. The key instruction is to replace generic phrasing such as "If supported, clients SHALL support..." with a concrete trigger phrase that identifies the specific scenario, feature, or resource use case that activates the requirement.

## Scope and Impact

### Affected Artifacts
- EEHRxF Imaging Report Resource Access Provider CapabilityStatement — authoring text needs the trigger phrase rewritten for server-facing resource capability notes.
- EEHRxF Imaging Report Resource Consumer CapabilityStatement — authoring text needs the trigger phrase rewritten for client-facing resource capability notes.
- R4 rendered CapabilityStatement outputs — regeneration must reflect the rewritten wording.
- R5 rendered CapabilityStatement outputs — regeneration must reflect the rewritten wording.

### Candidate Files
- [ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh](../../../ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh) — rewrite the circular resource-capability prose.
- [ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh](../../../ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh) — rewrite the matching client-side prose.
- [igs/imaging-r4/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh](../../../igs/imaging-r4/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh) — keep the checked-in R4 source copy aligned.
- [igs/imaging-r4/input/fsh/api/CapabilityStatementResourceConsumer.fsh](../../../igs/imaging-r4/input/fsh/api/CapabilityStatementResourceConsumer.fsh) — keep the checked-in R4 source copy aligned.
- [igs/imaging-r5/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh](../../../igs/imaging-r5/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh) — keep the checked-in R5 source copy aligned.
- [igs/imaging-r5/input/fsh/api/CapabilityStatementResourceConsumer.fsh](../../../igs/imaging-r5/input/fsh/api/CapabilityStatementResourceConsumer.fsh) — keep the checked-in R5 source copy aligned.
- [igs/imaging-r4/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md](../../../igs/imaging-r4/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md) — verify the rendered R4 narrative shows the rewritten text.
- [igs/imaging-r4/output/en/CapabilityStatement-EeehrxfImagingReportResourceConsumer.md](../../../igs/imaging-r4/output/en/CapabilityStatement-EeehrxfImagingReportResourceConsumer.md) — verify the rendered R4 narrative shows the rewritten text.
- [igs/imaging-r5/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md](../../../igs/imaging-r5/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md) — verify the rendered R5 narrative shows the rewritten text.
- [igs/imaging-r5/output/en/CapabilityStatement-EeehrxfImagingReportResourceConsumer.md](../../../igs/imaging-r5/output/en/CapabilityStatement-EeehrxfImagingReportResourceConsumer.md) — verify the rendered R5 narrative shows the rewritten text.

### Impact Notes
- R4 impact: Editorial/narrative only; no profile, cardinality, or canonical changes.
- R5 impact: Editorial/narrative only; no profile, cardinality, or canonical changes.
- Breaking change risk: Low, because the change only clarifies prose and does not alter the underlying capability declarations or resource model.

## Implementation Tasks

1. **Rewrite provider-side resource prose**
   - File: [ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh](../../../ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh)
   - Action: Replace each circular "If supported, servers SHALL support..." sentence with trigger-based wording that explicitly names the advertised resource or scenario.
   - Acceptance: The provider-side capability statement prose no longer uses the circular pattern and the SHALL trigger is explicit.

2. **Rewrite consumer-side resource prose**
   - File: [ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh](../../../ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh)
   - Action: Replace each circular "If supported, clients SHALL support..." sentence with trigger-based wording that explicitly names the advertised resource or scenario.
   - Acceptance: The consumer-side capability statement prose no longer uses the circular pattern and the SHALL trigger is explicit.

3. **Keep versioned checked-in sources aligned**
   - File: [igs/imaging-r4/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh](../../../igs/imaging-r4/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh)
   - Action: Mirror the same provider wording update in the R4 copy.
   - Acceptance: The R4 copy matches the authored source intent and no stale wording remains.

4. **Keep versioned checked-in consumer source aligned**
   - File: [igs/imaging-r4/input/fsh/api/CapabilityStatementResourceConsumer.fsh](../../../igs/imaging-r4/input/fsh/api/CapabilityStatementResourceConsumer.fsh)
   - Action: Mirror the same consumer wording update in the R4 copy.
   - Acceptance: The R4 copy matches the authored source intent and no stale wording remains.

5. **Regenerate and verify R4 outputs**
   - File: [igs/imaging-r4/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md](../../../igs/imaging-r4/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md)
   - Action: Re-run the IG generation flow and confirm the rendered R4 narrative reflects the rewritten provider text.
   - Acceptance: The rendered R4 provider page shows the explicit trigger wording, and the consumer page does as well.

6. **Regenerate and verify R5 outputs**
   - File: [igs/imaging-r5/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md](../../../igs/imaging-r5/output/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.md)
   - Action: Re-run the IG generation flow and confirm the rendered R5 narrative reflects the rewritten provider text.
   - Acceptance: The rendered R5 provider page shows the explicit trigger wording, and the consumer page does as well.

## Validation Plan

- [x] Source files updated in the correct authoring location
- [ ] Preprocess/build completed for both versions
- [ ] Rendered outputs reflect the intended change
- [ ] No unresolved placeholders or broken links introduced
- [ ] Ticket intent is fully covered by implemented edits

Recommended validation commands:
- `./_preprocessMultiVersion.sh`
- `./_preProcessAndCheckAll.sh` if a full verification pass is needed
- `./_genonce.sh` if a faster editorial validation pass is sufficient

## Open Questions

- None