<!--
  Generated file. Do not edit.
-->

---
title: EHDSMedicationAdministration Mapping
---

### EHDSMedicationAdministration

The following table shows the mapping from EHDSMedicationAdministration logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [dosage](#ehdsdosage) | EuMedicationAdministration.dosage |  |
| header |  |  |
| header.authorship | EuMedicationAdministration.performer |  |
| [header.authorship.author[x]](#ehdsdevice) | EuMedicationAdministration.performer.actor |  |
| header.authorship.datetime | EuMedicationAdministration.occurenceDateTime ; EuMedicationAdministration.occurencePeriod |  |
| header.identifier | EuMedicationAdministration.identifier |  |
| header.language | EuMedicationAdministration.language |  |
| header.lastUpdate | EuMedicationAdministration.meta.lastUpdated |  |
| header.status | EuMedicationAdministration.status |  |
| header.statusReason[x] | EuMedicationAdministration.statusReason |  |
| [header.subject](#ehdspatient) | EuMedicationAdministration.subject |  |
| header.version | EuMedicationAdministration.meta.lastUpdated |  |
| [medication](#ehdsmedication) | EuMedicationAdministration.medication |  |
| note | EuMedicationAdministration.note |  |
| occurrence[x] | EuMedicationAdministration.occurenceDateTime ; EuMedicationAdministration.occurencePeriod |  |
| [presentedForm](#ehdsattachment) | EuMedicationAdministration.text | No element to map this, will require an extension |
| [reason[x]](#ehdsobservation) | EuMedicationAdministration.reason |  |

