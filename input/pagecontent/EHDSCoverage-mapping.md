<!--
  Generated file. Do not edit.
-->

---
title: EHDSCoverage Mapping
---

### EHDSCoverage

The following table shows the mapping from EHDSCoverage logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| identifier | EuCoverage.identifier |  |
| [patient](#ehdspatient) | EuCoverage.beneficiary |  |
| payor | EuCoverage.kind ; EuCoverage.paymentBy.party |  |
| [payor.payorEntity[x]](#ehdspatient) | EuCoverage.insurer |  |
| payor.subscriberId | EuCoverage.subscriberId |  |
| type | EuCoverage.type |  |

