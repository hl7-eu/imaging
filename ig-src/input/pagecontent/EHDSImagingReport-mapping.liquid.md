<!--
  Generated file. Do not edit.
-->

#### EHDSImagingReport

<div class="model-map-block">
  <div class="callout-wrapper">
    <div class="callout-box">
      <strong>Ongoing alignment:</strong>
      The Xt-EHR logical models are under active revision and continuous refinement.
      Updates from Xt-EHR will be progressively incorporated into this Implementation
      Guide to maintain alignment with the evolving EHDS specifications.
    </div>
  </div>
</div>

The following table shows the mapping from EHDSImagingReport logical model elements to FHIR profiles.

<div class="table-wrap">
  <strong>Mapping Context</strong>
  <ul>
    <li>
      <strong>Source logical model:</strong>
      <a href="https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html" target="_blank">EHDSImagingReport</a>
    </li>
  </ul>
</div>

{% if isR4 %}

<div class="table-wrap">
  <table summary="EHDSImagingReport → FHIR Profiles (R4)">
    <caption>EHDSImagingReport → FHIR Profiles (R4)</caption>
    <thead>
      <tr>
        <th colspan="1" class="src-head">EHDSImagingReport (Logical Model)</th>
        <th class="relhead">Relationship</th>
        <th colspan="3" class="tgt-head">Target FHIR Resource</th>
      </tr>
      <tr>
        <th class="src-sub">Element</th>
        <th class="relsub">Relation</th>
        <th class="tgt-sub">Resource</th>
        <th class="tgt-sub">Element</th>
        <th class="tgt-sub">Notes</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>header</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>author[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>author[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSOrganisation">EHDSOrganisation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>performer[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSDevice">EHDSDevice</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>resultsInterpreter[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>date</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>issued</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.source</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentType</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentTitle</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>title</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>event.period</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>effectivePeriod</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[version]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[artifactVersion]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation</td>
        <td></td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSDevice">EHDSDevice</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.datetime</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication</td>
        <td></td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[legalAuthenticator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSOrganisation">EHDSOrganisation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.datetime</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[legalAuthenticator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-ProcedureEuImaging.html">ProcedureEuImaging</a></td>
        <td>code</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.serviceSpecialty</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.serviceSpecialty</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.custodian</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>custodian</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>presentedForm</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>text</td>
        <td>For all the resources that don&apos;t have a .presentedForm element, the .text is the default element to map this requirement.</td>
      </tr>
      <tr>
        <td>header.accessionNumber</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>identifier[accessionNumber]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient">EHDSPatient</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSRelatedPerson">EHDSRelatedPerson</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSOrganisation">EHDSOrganisation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSDevice">EHDSDevice</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient">EHDSPatient</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>body</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.orderInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[order]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[basedOn]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>basedOn[ServiceRequestOrderEuImagingaccession]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderDateAndTime</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>authoredOn</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderPlacer[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>requester</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[CodeableConcept]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>extension[reason].extension[concept].valueCodeableConcept</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSCondition">EHDSCondition</a>]</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[string]</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.clinicalQuestion</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>extension[reason].extension[concept].valueCodeableConcept</td>
        <td>Order reason and clinical question map to the same element by design choice</td>
      </tr>
      <tr>
        <td>body.supportingInformation</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.supportingInformation.observation</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.condition</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.priorMedicationAdministration</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.device</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.pregnancyStatus</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.sexForClinicalUse</td>
        <td>equivalent</td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.specimen</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.specimen</td>
        <td></td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[procedure].extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ObservationRadiationDoseEuImaging.html">ObservationRadiationDoseEuImaging</a></td>
        <td>value[x]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.examinationReport</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.examinationReport.modality</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.bodySite</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[procedure].entry[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.medicationAdministration</td>
        <td>equivalent</td>
        <td>EuMedicationAdministration</td>
        <td>partOf</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.adverseReaction</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-AdverseEventEuImaging.html">AdverseEventEuImaging</a></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.adverseReaction</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[procedure].entry[adverse-event]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[findings].entry[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[string]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[findings].extension[note]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[string]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[note]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[impression].extension[note]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[note]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSCondition">EHDSCondition</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[impression].entry[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSCondition">EHDSCondition</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[impression].entry[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>.extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.description</td>
        <td>equivalent</td>
        <td>EuCarePlan</td>
        <td>description</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.carePlan</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[recommendation].entry[suggestion]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[comparison].entry[comparedstudy]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[comparison]</td>
        <td></td>
      </tr>
      <tr>
        <td>dicomStudyMetadata</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>media</td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ObservationFindingEuImaging.html">ObservationFindingEuImaging</a></td>
        <td>derivedFrom</td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

{% endif %}

{% if isR5 %}

<div class="table-wrap">
  <table summary="EHDSImagingReport → FHIR Profiles (R5)">
    <caption>EHDSImagingReport → FHIR Profiles (R5)</caption>
    <thead>
      <tr>
        <th colspan="1" class="src-head">EHDSImagingReport (Logical Model)</th>
        <th class="relhead">Relationship</th>
        <th colspan="3" class="tgt-head">Target FHIR Resource</th>
      </tr>
      <tr>
        <th class="src-sub">Element</th>
        <th class="relsub">Relation</th>
        <th class="tgt-sub">Resource</th>
        <th class="tgt-sub">Element</th>
        <th class="tgt-sub">Notes</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>header</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>author[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>resultsInterpreter[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSOrganisation">EHDSOrganisation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>performer[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSDevice">EHDSDevice</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>resultsInterpreter[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>date</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>issued</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.source</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentType</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>category</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentTitle</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>title</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>event.period</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>effectivePeriod</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>version</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[artifactVersion]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation</td>
        <td></td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSDevice">EHDSDevice</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator].party.extension[deviceAttester]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.datetime</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[resultValidator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication</td>
        <td></td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[legalAuthenticator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td></td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSOrganisation">EHDSOrganisation</a>]</td>
        <td>equivalent</td>
        <td></td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.datetime</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>attester[legalAuthenticator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-ProcedureEuImaging.html">ProcedureEuImaging</a></td>
        <td>code</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>source-is-broader-than-target</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.serviceSpecialty</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.serviceSpecialty</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.custodian</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>custodian</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>presentedForm</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>text</td>
        <td>For all the resources that don&apos;t have a .presentedForm element, the .text is the default element to map this requirement.</td>
      </tr>
      <tr>
        <td>header.accessionNumber</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>identifier[accessionNumber]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient">EHDSPatient</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSRelatedPerson">EHDSRelatedPerson</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSOrganisation">EHDSOrganisation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSDevice">EHDSDevice</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient">EHDSPatient</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>body</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.orderInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[order]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>extension[basedOn]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>basedOn[ServiceRequestOrderEuImagingaccession]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderDateAndTime</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>authoredOn</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderPlacer[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>requester</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[CodeableConcept]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>reason.concept</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSCondition">EHDSCondition</a>]</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[string]</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.clinicalQuestion</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-ServiceRequestOrderEuImaging.html">ServiceRequestOrderEuImaging</a></td>
        <td>reason.concept</td>
        <td>Order reason and clinical question map to the same element by design choice</td>
      </tr>
      <tr>
        <td>body.supportingInformation</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.supportingInformation.observation</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.condition</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.priorMedicationAdministration</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.device</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.pregnancyStatus</td>
        <td>source-is-narrower-than-target</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.sexForClinicalUse</td>
        <td>equivalent</td>
        <td>EuPatient</td>
        <td>extension[sex-for-clinical-use]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.specimen</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.specimen</td>
        <td></td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[procedure].extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ObservationRadiationDoseEuImaging.html">ObservationRadiationDoseEuImaging</a></td>
        <td>value[x]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.examinationReport</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.examinationReport.modality</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.bodySite</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[procedure].entry[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.medicationAdministration</td>
        <td>equivalent</td>
        <td>EuMedicationAdministration</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.adverseReaction</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-AdverseEventEuImaging.html">AdverseEventEuImaging</a></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.adverseReaction</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[procedure].entry[adverse-event]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td>TN</td>
        <td><a href="./StructureDefinition-ObservationFindingEuImaging.html">ObservationFindingEuImaging</a></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[string]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[findings].extension[note]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[string]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>note</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[impression].extension[note]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>note</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSCondition">EHDSCondition</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[impression].entry[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSCondition">EHDSCondition</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[impression].entry[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSObservation">EHDSObservation</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.description</td>
        <td>equivalent</td>
        <td>EuCarePlan</td>
        <td>description</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.carePlan</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[recommendation].entry[suggestion]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-CompositionEuImaging.html">CompositionEuImaging</a></td>
        <td>section[comparison].entry[comparedstudy]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>extension[comparison]</td>
        <td></td>
      </tr>
      <tr>
        <td>dicomStudyMetadata</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-DiagnosticReportEuImaging.html">DiagnosticReportEuImaging</a></td>
        <td>media</td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ObservationFindingEuImaging.html">ObservationFindingEuImaging</a></td>
        <td>derivedFrom</td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

{% endif %}

