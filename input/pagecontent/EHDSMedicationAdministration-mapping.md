<!--
  Generated file. Do not edit.
-->

#### EHDSMedicationAdministration

The following table shows the mapping from EHDSMedicationAdministration logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSMedicationAdministration.header |  |  |
| EHDSMedicationAdministration.[header.subject](#ehdspatient) | EuMedicationAdministration.subject |  |
| EHDSMedicationAdministration.header.identifier | EuMedicationAdministration.identifier |  |
| EHDSMedicationAdministration.header.authorship | EuMedicationAdministration.performer |  |
| EHDSMedicationAdministration.header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuMedicationAdministration.performer.actor |  |
| EHDSMedicationAdministration.header.authorship.datetime | EuMedicationAdministration.occurenceDateTime ; EuMedicationAdministration.occurencePeriod |  |
| EHDSMedicationAdministration.header.lastUpdate | EuMedicationAdministration.meta.lastUpdated |  |
| EHDSMedicationAdministration.header.status | EuMedicationAdministration.status |  |
| EHDSMedicationAdministration.header.statusReason[x] | EuMedicationAdministration.statusReason |  |
| EHDSMedicationAdministration.header.language | EuMedicationAdministration.language |  |
| EHDSMedicationAdministration.header.version | EuMedicationAdministration.meta.lastUpdated |  |
| EHDSMedicationAdministration.[presentedForm](#ehdsattachment) | EuMedicationAdministration.text | No element to map this, will require an extension |
| EHDSMedicationAdministration.[medication](StructureDefinition-EHDSMedication.html) | EuMedicationAdministration.medication |  |
| EHDSMedicationAdministration.occurrence[x] | EuMedicationAdministration.occurenceDateTime ; EuMedicationAdministration.occurencePeriod |  |
| EHDSMedicationAdministration.reason[x] ([EHDSCondition](#ehdscondition), [EHDSObservation](#ehdsobservation)) | EuMedicationAdministration.reason |  |
| EHDSMedicationAdministration.note | EuMedicationAdministration.note |  |
| EHDSMedicationAdministration.[dosage](StructureDefinition-EHDSDosage.html) | EuMedicationAdministration.dosage |  |

