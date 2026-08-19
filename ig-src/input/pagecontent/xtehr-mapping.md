<!--
  Generated file. Do not edit.
-->

{% include variable-definitions.md %}

> **STU note:** These mapping tables are based on version 1.0.0 of the Xt-EHR logical model. They will be reviewed and updated, where needed, when the revised EHDS implementing-act requirements (including relevant Art. 15 details) are published and finalized.


The following tables describe the way the [Xt-EHR logical model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-XtEHR.html) has been mapped onto the FHIR profiles defined in this specification.

For orientation, the upstream Xt-EHR logical models for medical imaging are described in the {{ XtEhrImaging }}.

<div class="model-map-block">
  <div class="callout-wrapper">
    <div class="callout-box">
      <strong>XtEHR Release Reference:</strong>
      This mapping is based on the Xt-EHR logical models
      <a href="https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSImagingReport.html" target="_blank">release 1.0.0</a>.
      These models are expected to continue evolving and, as part of the EU comitology process,
      it is likely that changes will be made; such changes are to be published in the implementing
      acts related to
      <a href="https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_15" target="_blank">article 15</a>
      of the EHDS Regulation. When updated models are published, the changes will be progressively
      incorporated into this Implementation Guide to maintain alignment with the EHDS Implementing Acts.
    </div>
  </div>
</div>

### Key element cardinalities

The table below summarises the cardinalities of the main top-level elements of the [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSImagingReport.html) logical model, to help readers orient without navigating to the formal profile pages.

| Element | Cardinality | Description |
|---------|-------------|-------------|
| `header` | 1..1 | Imaging report header |
| `header.legalAuthentication` | 0..* | Document legal authentication details |
| `header.attestation` | 0..* | Document attestation details |
| `body` | 0..1 | Imaging report structured body |
| `body.orderInformation` | 0..* | Order information |
| `body.comparisonStudy` | 0..* | Prior imaging report reference |
| `body.examinationReport` | 1..1 | Examination report content |
| `dicomStudyMetadata` | 0..* | DICOM study metadata |
| `presentedForm` | 0..* | Narrative / rendered form |
| `attachments` | 0..* | Report attachments |

### Core models of the Imaging Report IG

{% include EHDSImagingReport-mapping.md %}

{% include EHDSImagingStudy-mapping.md %}

### Other logical models that are used by this IG

The following logical models describe data that is used in the context of this IG, but the mapping will be defined by another higher level IG, because they are common to many domains:

* [EHDSAddress](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSAddress.html), [EHDSOrganisation](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSOrganisation.html), [EHDSPatient](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSPatient.html), [EHDSServiceRequest](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSServiceRequest.html), [EHDSTelecom](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSTelecom.html)

The mapping of these common models to FHIR is defined in the HL7 Europe Base / core guide, following the same approach used by other EHDS specifications (e.g. the Patient Summary and Hospital Discharge Report guides).

### Models not included in this IG

The following logical models describe data that is not used in the context of this Imaging Report IG:

* [EHDSAdministeredDosage](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSAdministeredDosage.html), [EHDSAdvanceDirective](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSAdvanceDirective.html), [EHDSAlert](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSAlert.html), [EHDSAllergyIntolerance](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSAllergyIntolerance.html), [EHDSAttachment](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSAttachment.html), [EHDSBodyStructure](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSBodyStructure.html), [EHDSCarePlan](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSCarePlan.html), [EHDSCondition](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSCondition.html), [EHDSCurrentPregnancy](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSCurrentPregnancy.html), [EHDSDataSet](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSDataSet.html), [EHDSDevice](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSDevice.html), [EHDSDeviceUse](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSDeviceUse.html), [EHDSDischargeReport](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSDischargeReport.html), [EHDSDocument](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSDocument.html), [EHDSDosage](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSDosage.html), [EHDSEncounter](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSEncounter.html), [EHDSEndpoint](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSEndpoint.html), [EHDSHealthProfessional](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSHealthProfessional.html), [EHDSHumanName](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSHumanName.html), [EHDSImmunisation](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSImmunisation.html), [EHDSLaboratoryObservation](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSLaboratoryObservation.html), [EHDSLaboratoryReport](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSLaboratoryReport.html), [EHDSLocation](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSLocation.html), [EHDSMedication](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSMedication.html), [EHDSMedicationAdministration](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSMedicationAdministration.html), [EHDSMedicationDispense](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSMedicationDispense.html), [EHDSMedicationPrescription](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSMedicationPrescription.html), [EHDSMedicationUse](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSMedicationUse.html), [EHDSObservation](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSObservation.html), [EHDSPatientSummary](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSPatientSummary.html), [EHDSPregnancyHistory](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSPregnancyHistory.html), [EHDSProcedure](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSProcedure.html), [EHDSRelatedPerson](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSRelatedPerson.html), [EHDSSpecimen](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSSpecimen.html), [EHDSTravelHistory](https://www.xt-ehr.eu/fhir/models/1.0.0/StructureDefinition-EHDSTravelHistory.html)

