<!--
  Generated file. Do not edit.
-->

#### EHDSCoverage

The following table shows the mapping from EHDSCoverage logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSCoverage.identifier | EuCoverage.identifier |  |
| EHDSCoverage.type | EuCoverage.type |  |
| EHDSCoverage.[patient](#ehdspatient) | EuCoverage.beneficiary |  |
| EHDSCoverage.payor | EuCoverage.kind ; EuCoverage.paymentBy.party |  |
| EHDSCoverage.payor.payorEntity[x] ([EHDSOrganisation](#ehdsorganisation), [EHDSPatient](#ehdspatient)) | EuCoverage.insurer |  |
| EHDSCoverage.payor.subscriberId | EuCoverage.subscriberId |  |

