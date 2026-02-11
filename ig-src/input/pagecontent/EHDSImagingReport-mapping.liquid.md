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
      <a href="https://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSImagingReport" target="_blank">EHDSImagingReport</a>
    </li>
  </ul>
</div>

{% if isR4 %}

<div class="table-wrap">
  <table summary="EHDSImagingReport → FHIR Profiles (R4)">
    <caption>EHDSImagingReport → FHIR Profiles (R4)</caption>
    <thead>
      <tr>
        <th colspan="2" class="src-head">EHDSImagingReport (Logical Model)</th>
        <th class="relhead">Relationship</th>
        <th colspan="3" class="tgt-head">Target FHIR Resource</th>
      </tr>
      <tr>
        <th class="src-sub">Element</th>
        <th class="src-sub">Description</th>
        <th class="relsub">Relation</th>
        <th class="tgt-sub">Resource</th>
        <th class="tgt-sub">Element</th>
        <th class="tgt-sub">Notes</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>header</td>
        <td>Basic metadata for this information</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>Patient/subject information</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>Patient/subject information</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries).</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>author[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>author[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>performer[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>resultsInterpreter[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>Date and optionally time of authoring/issuing</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>date</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td></td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>issued</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>Status of the report</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>Status of the report</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.source</td>
        <td>Source of information (e.g. patient, patient&apos;s proxy). Used in case the patient has authored the information or the author has submitted patient-stated information.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>Language in which the resource is written. Language is expressed by the IETF language tag.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>Language in which the resource is written. Language is expressed by the IETF language tag.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentType</td>
        <td>Type of document (e.g. 18748-4 Diagnostic imaging study)</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentType</td>
        <td>Type of document (e.g. 18748-4 Diagnostic imaging study)</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentTitle</td>
        <td>Human readable document title that can be displayed in search results, etc. This can be documentType&apos;s display name, or it can be assembled from multiple elements. Examples: &apos;Laboratory Result Report&apos;, &apos;Patient Summary of Jane Green 10.12.2024&apos;</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>title</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>Time of service that is being documented</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>event.period</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>Time of service that is being documented</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>effectivePeriod</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>Business version of the document. The exact algorithm for versioning is decided by the producer/custodian</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[version]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>Business version of the document. The exact algorithm for versioning is decided by the producer/custodian</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[artifactVersion]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation</td>
        <td>Document attestation details</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[x]</td>
        <td>Attester who validated the document</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[x]</td>
        <td>Attester who validated the document</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.datetime</td>
        <td>Date and time of the approval of the document by Attester</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication</td>
        <td>Document legal authentication details</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[legalAuthenticator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[x]</td>
        <td>The person or organisation taking responsibility for the medical content of the document (typically the person who signs it)</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[x]</td>
        <td>The person or organisation taking responsibility for the medical content of the document (typically the person who signs it)</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.datetime</td>
        <td>Date and time when the document was authorised</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[legalAuthenticator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>ProcedureEuImaging</td>
        <td>code</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.serviceSpecialty</td>
        <td>Additional details about where the content was created (e.g. clinical specialty)</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.custodian</td>
        <td>Organisation that is in charge of maintaining the document/report.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>custodian</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>presentedForm</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>text</td>
        <td>For all the resources that don&apos;t have a .presentedForm element, the .text is the default element to map this requirement.</td>
      </tr>
      <tr>
        <td>header.accessionNumber</td>
        <td>Accession number - an identifier, managed by the RIS at the local level, which usually uniquely identifies an imaging procedure request, and links it to imaging study(ies) and related imaging report(s).</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>identifier[accessionNumber]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.accessionNumber</td>
        <td>Accession number - an identifier, managed by the RIS at the local level, which usually uniquely identifies an imaging procedure request, and links it to imaging study(ies) and related imaging report(s).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[basedOn]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>body</td>
        <td>Imaging report structured body</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.orderInformation</td>
        <td>Order Information (Imaging Result Report could respond to multiple orders).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[order]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>Identifier(s) of the imaging service order.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension:basedOn</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>Identifier(s) of the imaging service order.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>basedOn[ServiceRequestOrderEuImagingaccession]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderDateAndTime</td>
        <td>Date and time of the order placement.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>authoredOn</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderPlacer[x]</td>
        <td>The person/organisation authorised to place the order. Order placer could be either a health professional, health professional organisation or the patient himself.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>requester</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>extension[reason].extension[concept].valueCodeableConcept</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.clinicalQuestion</td>
        <td>Specification of clinical question (goal of the investigation) to be answered by the imaging investigation.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>extension[reason].extension[concept].valueCodeableConcept</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation</td>
        <td>This information includes diagnosis, clinical findings and other observations. This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the metal implants present in patient&apos;s body.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.observation</td>
        <td>Clinical findings and other observations (e.g., height and weights of the patient).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.condition</td>
        <td>Conditions that may influence the service or result interpretation.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.priorMedicationAdministration</td>
        <td>Medication administered before ordering the service specifically for this procedure.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.device</td>
        <td>List of implants or devices that affect the course of the examination or its interpretation (e.g. metal implants).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.pregnancyStatus</td>
        <td>Pregnancy status when the imaging examination was performed (e.g., pregnant, not pregnant, unknown).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.sexForClinicalUse</td>
        <td>Sex parameter for clinical use - provides guidance on how a recipient should apply settings or reference ranges that are derived from observable information such as an organ inventory, recent hormone lab tests, genetic testing, menstrual status, obstetric history, etc. This property is intended for use in clinical decision making, and indicates that treatment or diagnostic tests should consider best practices associated with the relevant reference population.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.specimen</td>
        <td>Specimen information. Note: A specimen (not attached to a body) can be used for diagnostic, forensic and medical research purposes.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.specimen</td>
        <td></td>
      </tr>
      <tr>
        <td>body.serviceRequest</td>
        <td>Specification of requested service(s).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[basedOn]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.serviceRequest</td>
        <td>Specification of requested service(s).</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>Information on total exposure to ionising radiation. This information is required by regulations in several EU countries.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>Information on total exposure to ionising radiation. This information is required by regulations in several EU countries.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[procedure].extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.examinationReport</td>
        <td>Examination report content.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.modality</td>
        <td>Imaging modality (or modalities) used during imaging investigation (DICOM CID029).</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.bodySite</td>
        <td>All body parts investigated</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>Imaging procedure performed during imaging study.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[procedure].entry[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>Imaging procedure performed during imaging study.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.medicationAdministration</td>
        <td>Information about medications administered (contrast, sedation, stress agents, etc) during the procedure.</td>
        <td></td>
        <td>EuMedicationAdministration</td>
        <td>partOf</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.adverseReaction</td>
        <td>Adverse reactions manifested during imaging investigation.</td>
        <td></td>
        <td>AdverseEventEuImaging</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[x]</td>
        <td>Imaging report result data (report could consist of multiple observations)</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[findings]entry[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[x]</td>
        <td>Imaging report result data (report could consist of multiple observations)</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[x]</td>
        <td>Imaging report result data (report could consist of multiple observations)</td>
        <td></td>
        <td>ObservationFindingEuImaging</td>
        <td>text</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion</td>
        <td>A concise and clinically contextualised summary including interpretation/impression of the diagnostic report.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>Narrative description of the clinical conclusion (impression).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>Narrative description of the clinical conclusion (impression).</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[impression].entry[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[impression].entry[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>.extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>Recommendation section for additional imaging tests or other actions</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>Recommendation section for additional imaging tests or other actions</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.description</td>
        <td>Narrative description of the recommended activities including additional test, medication etc.</td>
        <td></td>
        <td>EuCarePlan</td>
        <td>description</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.carePlan</td>
        <td>A complex and structured information about recommended goals, activities and objectives in the form of one or more formal care plan.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[recommendation].entry[suggestion]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>Documentation (reference) of a prior Imaging Report to which the current images were compared.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[comparison].entry[comparedstudy]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>Documentation (reference) of a prior Imaging Report to which the current images were compared.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[comparison]</td>
        <td></td>
      </tr>
      <tr>
        <td>dicomStudyMetadata</td>
        <td>Metadata of the DICOM study. A study comprises a set of series, each of which includes a set of Service-Object Pair Instances (SOP Instances - images or other data) acquired or produced in a common context. A series is of only one modality (e.g. X-ray, CT, MR, ultrasound), but a study may have multiple series of different modalities.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>Report attachments</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>media</td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>Report attachments</td>
        <td></td>
        <td>ObservationFindingEuImaging</td>
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
        <th colspan="2" class="src-head">EHDSImagingReport (Logical Model)</th>
        <th class="relhead">Relationship</th>
        <th colspan="3" class="tgt-head">Target FHIR Resource</th>
      </tr>
      <tr>
        <th class="src-sub">Element</th>
        <th class="src-sub">Description</th>
        <th class="relsub">Relation</th>
        <th class="tgt-sub">Resource</th>
        <th class="tgt-sub">Element</th>
        <th class="tgt-sub">Notes</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>header</td>
        <td>Basic metadata for this information</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>Patient/subject information</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.subject</td>
        <td>Patient/subject information</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries).</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>identifier</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>author[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>author[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>performer[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>The author of the report.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>resultsInterpreter[author]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>Date and optionally time of authoring/issuing</td>
        <td>source-is-broader-than-target</td>
        <td>CompositionEuImaging</td>
        <td>date</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td></td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>issued</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>Status of the report</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>Status of the report</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.source</td>
        <td>Source of information (e.g. patient, patient&apos;s proxy). Used in case the patient has authored the information or the author has submitted patient-stated information.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>Language in which the resource is written. Language is expressed by the IETF language tag.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>Language in which the resource is written. Language is expressed by the IETF language tag.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentType</td>
        <td>Type of document (e.g. 18748-4 Diagnostic imaging study)</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentType</td>
        <td>Type of document (e.g. 18748-4 Diagnostic imaging study)</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.documentTitle</td>
        <td>Human readable document title that can be displayed in search results, etc. This can be documentType&apos;s display name, or it can be assembled from multiple elements. Examples: &apos;Laboratory Result Report&apos;, &apos;Patient Summary of Jane Green 10.12.2024&apos;</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>title</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>Time of service that is being documented</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>event.period</td>
        <td></td>
      </tr>
      <tr>
        <td>header.period</td>
        <td>Time of service that is being documented</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>effectivePeriod</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>Business version of the document. The exact algorithm for versioning is decided by the producer/custodian</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>version</td>
        <td></td>
      </tr>
      <tr>
        <td>header.version</td>
        <td>Business version of the document. The exact algorithm for versioning is decided by the producer/custodian</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[artifactVersion]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation</td>
        <td>Document attestation details</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[x]</td>
        <td>Attester who validated the document</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.attester[x]</td>
        <td>Attester who validated the document</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.attestation.datetime</td>
        <td>Date and time of the approval of the document by Attester</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[resultValidator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication</td>
        <td>Document legal authentication details</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[legalAuthenticator]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[x]</td>
        <td>The person or organisation taking responsibility for the medical content of the document (typically the person who signs it)</td>
        <td></td>
        <td></td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.legalAuthenticator[x]</td>
        <td>The person or organisation taking responsibility for the medical content of the document (typically the person who signs it)</td>
        <td></td>
        <td></td>
        <td>attester[legalAuthenticator].party</td>
        <td></td>
      </tr>
      <tr>
        <td>header.legalAuthentication.datetime</td>
        <td>Date and time when the document was authorised</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>attester[legalAuthenticator].time</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>ProcedureEuImaging</td>
        <td>code</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.eventType</td>
        <td>Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>modality</td>
        <td></td>
      </tr>
      <tr>
        <td>header.serviceSpecialty</td>
        <td>Additional details about where the content was created (e.g. clinical specialty)</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>category[diagnostic-service]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.custodian</td>
        <td>Organisation that is in charge of maintaining the document/report.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>custodian</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>presentedForm</td>
        <td></td>
      </tr>
      <tr>
        <td>presentedForm</td>
        <td>A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>text</td>
        <td>For all the resources that don&apos;t have a .presentedForm element, the .text is the default element to map this requirement.</td>
      </tr>
      <tr>
        <td>header.accessionNumber</td>
        <td>Accession number - an identifier, managed by the RIS at the local level, which usually uniquely identifies an imaging procedure request, and links it to imaging study(ies) and related imaging report(s).</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>identifier[accessionNumber]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.accessionNumber</td>
        <td>Accession number - an identifier, managed by the RIS at the local level, which usually uniquely identifies an imaging procedure request, and links it to imaging study(ies) and related imaging report(s).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[basedOn]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.intendedRecipient[x]</td>
        <td>Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[informationRecipient]</td>
        <td></td>
      </tr>
      <tr>
        <td>body</td>
        <td>Imaging report structured body</td>
        <td></td>
        <td></td>
        <td></td>
        <td>N/A</td>
      </tr>
      <tr>
        <td>body.orderInformation</td>
        <td>Order Information (Imaging Result Report could respond to multiple orders).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[order]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>Identifier(s) of the imaging service order.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension:basedOn</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderId</td>
        <td>Identifier(s) of the imaging service order.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>basedOn[ServiceRequestOrderEuImagingaccession]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderDateAndTime</td>
        <td>Date and time of the order placement.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>authoredOn</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderPlacer[x]</td>
        <td>The person/organisation authorised to place the order. Order placer could be either a health professional, health professional organisation or the patient himself.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>requester</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>reason.concept</td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.orderReason[x]</td>
        <td>An explanation or justification for why this service is being requested.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.orderInformation.clinicalQuestion</td>
        <td>Specification of clinical question (goal of the investigation) to be answered by the imaging investigation.</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td>reason.concept</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation</td>
        <td>This information includes diagnosis, clinical findings and other observations. This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the metal implants present in patient&apos;s body.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.observation</td>
        <td>Clinical findings and other observations (e.g., height and weights of the patient).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.condition</td>
        <td>Conditions that may influence the service or result interpretation.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.priorMedicationAdministration</td>
        <td>Medication administered before ordering the service specifically for this procedure.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.device</td>
        <td>List of implants or devices that affect the course of the examination or its interpretation (e.g. metal implants).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.pregnancyStatus</td>
        <td>Pregnancy status when the imaging examination was performed (e.g., pregnant, not pregnant, unknown).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[history].entry</td>
        <td></td>
      </tr>
      <tr>
        <td>body.supportingInformation.sexForClinicalUse</td>
        <td>Sex parameter for clinical use - provides guidance on how a recipient should apply settings or reference ranges that are derived from observable information such as an organ inventory, recent hormone lab tests, genetic testing, menstrual status, obstetric history, etc. This property is intended for use in clinical decision making, and indicates that treatment or diagnostic tests should consider best practices associated with the relevant reference population.</td>
        <td></td>
        <td>EuPatient</td>
        <td>extension[sex-for-clinical-use]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.specimen</td>
        <td>Specimen information. Note: A specimen (not attached to a body) can be used for diagnostic, forensic and medical research purposes.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.specimen</td>
        <td></td>
      </tr>
      <tr>
        <td>body.serviceRequest</td>
        <td>Specification of requested service(s).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>extension[basedOn]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.serviceRequest</td>
        <td>Specification of requested service(s).</td>
        <td></td>
        <td>ServiceRequestOrderEuImaging</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>Information on total exposure to ionising radiation. This information is required by regulations in several EU countries.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.exposureInformation</td>
        <td>Information on total exposure to ionising radiation. This information is required by regulations in several EU countries.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[procedure].extension[radiationDose]</td>
        <td>Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365</td>
      </tr>
      <tr>
        <td>body.examinationReport</td>
        <td>Examination report content.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.modality</td>
        <td>Imaging modality (or modalities) used during imaging investigation (DICOM CID029).</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.bodySite</td>
        <td>All body parts investigated</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>Imaging procedure performed during imaging study.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[procedure].entry[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.imagingProcedures</td>
        <td>Imaging procedure performed during imaging study.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[procedure]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.medicationAdministration</td>
        <td>Information about medications administered (contrast, sedation, stress agents, etc) during the procedure.</td>
        <td></td>
        <td>EuMedicationAdministration</td>
        <td>partOf</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.adverseReaction</td>
        <td>Adverse reactions manifested during imaging investigation.</td>
        <td></td>
        <td>AdverseEventEuImaging</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[x]</td>
        <td>Imaging report result data (report could consist of multiple observations)</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[findings]entry[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[x]</td>
        <td>Imaging report result data (report could consist of multiple observations)</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.results[x]</td>
        <td>Imaging report result data (report could consist of multiple observations)</td>
        <td></td>
        <td>ObservationFindingEuImaging</td>
        <td>text</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion</td>
        <td>A concise and clinically contextualised summary including interpretation/impression of the diagnostic report.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>Narrative description of the clinical conclusion (impression).</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.impression</td>
        <td>Narrative description of the clinical conclusion (impression).</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[impression].entry[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[impression].entry[finding]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.examinationReport.conclusion.conditionOrFinding[x]</td>
        <td>Condition or finding from imaging investigation.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>.extension[impression]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>Recommendation section for additional imaging tests or other actions</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation</td>
        <td>Recommendation section for additional imaging tests or other actions</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[recommendation]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.description</td>
        <td>Narrative description of the recommended activities including additional test, medication etc.</td>
        <td></td>
        <td>EuCarePlan</td>
        <td>description</td>
        <td></td>
      </tr>
      <tr>
        <td>body.recommendation.carePlan</td>
        <td>A complex and structured information about recommended goals, activities and objectives in the form of one or more formal care plan.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[recommendation].entry[suggestion]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>Documentation (reference) of a prior Imaging Report to which the current images were compared.</td>
        <td></td>
        <td>CompositionEuImaging</td>
        <td>section[comparison].entry[comparedstudy]</td>
        <td></td>
      </tr>
      <tr>
        <td>body.comparisonStudy</td>
        <td>Documentation (reference) of a prior Imaging Report to which the current images were compared.</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>extension[comparison]</td>
        <td></td>
      </tr>
      <tr>
        <td>dicomStudyMetadata</td>
        <td>Metadata of the DICOM study. A study comprises a set of series, each of which includes a set of Service-Object Pair Instances (SOP Instances - images or other data) acquired or produced in a common context. A series is of only one modality (e.g. X-ray, CT, MR, ultrasound), but a study may have multiple series of different modalities.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>Report attachments</td>
        <td></td>
        <td>DiagnosticReportEuImaging</td>
        <td>media</td>
        <td></td>
      </tr>
      <tr>
        <td>attachments</td>
        <td>Report attachments</td>
        <td></td>
        <td>ObservationFindingEuImaging</td>
        <td>derivedFrom</td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

{% endif %}

