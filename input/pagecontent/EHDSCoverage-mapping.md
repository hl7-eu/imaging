<!--
  Generated file. Do not edit.
-->

#### EHDSCoverage

The following table shows the mapping from EHDSCoverage logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| identifier | EuCoverage.identifier |  |
| type | EuCoverage.type |  |
| [patient](#ehdspatient) | EuCoverage.beneficiary |  |
| payor | EuCoverage.kind ; EuCoverage.paymentBy.party |  |
| payor.payorEntity[x] ([EHDSOrganisation](#ehdsorganisation), [EHDSPatient](#ehdspatient)) | EuCoverage.insurer |  |
| payor.subscriberId | EuCoverage.subscriberId |  |

