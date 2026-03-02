<!--
  Generated file. Do not edit.
-->

#### EHDSImagingStudy

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

The following table shows the mapping from EHDSImagingStudy logical model elements to FHIR profiles.

<div class="table-wrap">
  <strong>Mapping Context</strong>
  <ul>
    <li>
      <strong>Source logical model:</strong>
      <a href="https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingStudy.html" target="_blank">EHDSImagingStudy</a>
    </li>
  </ul>
</div>





<div class="table-wrap">
  <table summary="EHDSImagingStudy → FHIR Profiles (R5)">
    <caption>EHDSImagingStudy → FHIR Profiles (R5)</caption>
    <thead>
      <tr>
        <th colspan="2" class="src-head">EHDSImagingStudy (Logical Model)</th>
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
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries).</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>identifier[studyInstanceUid]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>Author(s) responsible for the provided information. The exact role of the responsible author varies across use cases and is specific to individual models.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.performer[performer]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>Author(s) responsible for the provided information. The exact role of the responsible author varies across use cases and is specific to individual models.</td>
        <td></td>
        <td>ImagingStudyEuImaging</td>
        <td>series.performer[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[x]</td>
        <td>Author(s) responsible for the provided information. The exact role of the responsible author varies across use cases and is specific to individual models.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.performer[device]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>Date and optionally time of authoring/issuing</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>started</td>
        <td>No core element to map the issuing of the Study. An extension might be needed to be defined as part of the Imaging-manifest IG</td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>Status of the resource or document</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
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
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>modality</td>
        <td>All of the distinct values for series&apos; modalities</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>bodySite</td>
        <td>All of the distinct values for series&apos; examined body parts.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>encounter</td>
        <td>Reference to the encounter with which this imaging study is associated</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>encounter</td>
        <td></td>
      </tr>
      <tr>
        <td>started</td>
        <td>Date and time the study started.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>started</td>
        <td></td>
      </tr>
      <tr>
        <td>basedOn</td>
        <td>References to the diagnostic requests that resulted in this imaging study being performed.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>basedOn</td>
        <td></td>
      </tr>
      <tr>
        <td>numberOfSeries</td>
        <td>Number of series in the study. This value given may be larger than the number of series elements this Resource contains due to resource availability, security, or other factors. This element should be present if any series elements are present.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>numberOfSeries</td>
        <td></td>
      </tr>
      <tr>
        <td>numberOfInstances</td>
        <td>Number of service-object pair (SOP) instances in the study. This value given may be larger than the number of instance elements this resource contains due to resource availability, security, or other factors. This element should be present if any instance elements are present.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>numberOfInstances</td>
        <td></td>
      </tr>
      <tr>
        <td>description</td>
        <td>The imaging manager description of the study. Institution-generated description or classification of the study (component) performed.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>description</td>
        <td></td>
      </tr>
      <tr>
        <td>studyCustodian</td>
        <td>Organisation name, address, contact information.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.performer[custodian]</td>
        <td></td>
      </tr>
      <tr>
        <td>studyEndpoint</td>
        <td>Study endpoint describing the technical details of a location that can be connected to for the delivery/retrieval of information. Sufficient information is required to ensure that a connection can be made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services, or national service.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>endpoint</td>
        <td></td>
      </tr>
      <tr>
        <td>series</td>
        <td>Series. Each study has one or more series of instances, but they may be absent when no series information needs to be conveyed</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series</td>
        <td></td>
      </tr>
      <tr>
        <td>series.seriesUid</td>
        <td>DICOM Series Instance UID for the series</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.uid</td>
        <td></td>
      </tr>
      <tr>
        <td>series.number</td>
        <td>Numeric identifier of this series</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.number</td>
        <td></td>
      </tr>
      <tr>
        <td>series.seriesModality</td>
        <td>Acquisition modality - the modality used for this series</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>series.description</td>
        <td>A short human readable summary of the series</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.description</td>
        <td></td>
      </tr>
      <tr>
        <td>series.numberOfInstances</td>
        <td>Number of series related instances</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.numberOfInstances</td>
        <td></td>
      </tr>
      <tr>
        <td>series.seriesEndpoint</td>
        <td>Series endpoint describing the technical details of a location that can be connected to for the delivery/retrieval of information. Sufficient information is required to ensure that a connection can be made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services, or national service.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.endpoint</td>
        <td></td>
      </tr>
      <tr>
        <td>series.bodySite</td>
        <td>Body part (with laterality) examined</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>series.specimen</td>
        <td>Specimen imaged</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.specimen</td>
        <td></td>
      </tr>
      <tr>
        <td>series.started</td>
        <td>When the series started</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.started</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries</td>
        <td>Each series has one or more instances, but they may be absent when no instance information needs to be conveyed</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.instance</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.instanceTitle</td>
        <td>Instance title that is the description of the instance.</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.instance.extension[instance-description]</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.instanceUid</td>
        <td>DICOM SOP Instance UID</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.instance.uid</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.sopClass</td>
        <td>SOP class - DICOM class type</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.instance.sopClass</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.instanceNumber</td>
        <td>The number of this instance in the series</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.instance.number</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.numberOfFrames</td>
        <td>The number of frames in a multiframe instance</td>
        <td>equivalent</td>
        <td>ImagingStudyEuImaging</td>
        <td>series.instance.extension[number-of-frames]</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage</td>
        <td>List of key image flags with a reason why this image is selected as a key image, and reference to the Key Image Note that flags the image as significant within the Imaging Study Manifest</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.flag</td>
        <td>Reason for flagging the image as significant</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.reason</td>
        <td>Textual reason for flagging the image as significant</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.seriesUID</td>
        <td>Series instance UID for the series that contains the instances flagged as significant</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.instanceUID</td>
        <td>SOP Instance UID for the instances flagged as significant by the Key Image Note object (DICOM KOS) that flags this image</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
