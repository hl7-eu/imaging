<!--
  Generated file. Do not edit.
-->

#### EHDSMedicationAdministration

The following table shows the mapping from EHDSMedicationAdministration logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuMedicationAdministration.subject |  |
| header.identifier | EuMedicationAdministration.identifier |  |
| header.authorship | EuMedicationAdministration.performer |  |
| header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuMedicationAdministration.performer.actor |  |
| header.authorship.datetime | EuMedicationAdministration.occurenceDateTime ; EuMedicationAdministration.occurencePeriod |  |
| header.lastUpdate | EuMedicationAdministration.meta.lastUpdated |  |
| header.status | EuMedicationAdministration.status |  |
| header.statusReason[x] | EuMedicationAdministration.statusReason |  |
| header.language | EuMedicationAdministration.language |  |
| header.version | EuMedicationAdministration.meta.lastUpdated |  |
| [presentedForm](#ehdsattachment) | EuMedicationAdministration.text | No element to map this, will require an extension |
| [medication](StructureDefinition-EHDSMedication.html) | EuMedicationAdministration.medication |  |
| occurrence[x] | EuMedicationAdministration.occurenceDateTime ; EuMedicationAdministration.occurencePeriod |  |
| reason[x] ([EHDSCondition](#ehdscondition), [EHDSObservation](#ehdsobservation)) | EuMedicationAdministration.reason |  |
| note | EuMedicationAdministration.note |  |
| [dosage](StructureDefinition-EHDSDosage.html) | EuMedicationAdministration.dosage |  |

