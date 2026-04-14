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
        <th colspan="1" class="src-head">EHDSImagingStudy (Logical Model)</th>
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
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>subject</td>
        <td></td>
      </tr>
      <tr>
        <td>header.identifier</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>identifier[studyInstanceUid]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSHealthProfessional">EHDSHealthProfessional</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.performer[performer]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSOrganisation">EHDSOrganisation</a>]</td>
        <td></td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.performer[organization]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.author[<a href="http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSDevice">EHDSDevice</a>]</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.performer[device]</td>
        <td></td>
      </tr>
      <tr>
        <td>header.date</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>started</td>
        <td>No core element to map the issuing of the Study. An extension might be needed to be defined as part of the Imaging-manifest IG</td>
      </tr>
      <tr>
        <td>header.status</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>status</td>
        <td></td>
      </tr>
      <tr>
        <td>header.source</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>header.language</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>language</td>
        <td></td>
      </tr>
      <tr>
        <td>modality</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>bodySite</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>encounter</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>encounter</td>
        <td></td>
      </tr>
      <tr>
        <td>started</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>started</td>
        <td></td>
      </tr>
      <tr>
        <td>basedOn</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>basedOn</td>
        <td></td>
      </tr>
      <tr>
        <td>numberOfSeries</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>numberOfSeries</td>
        <td></td>
      </tr>
      <tr>
        <td>numberOfInstances</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>numberOfInstances</td>
        <td></td>
      </tr>
      <tr>
        <td>description</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>description</td>
        <td></td>
      </tr>
      <tr>
        <td>studyCustodian</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.performer[custodian]</td>
        <td></td>
      </tr>
      <tr>
        <td>studyEndpoint</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>endpoint</td>
        <td></td>
      </tr>
      <tr>
        <td>series</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series</td>
        <td></td>
      </tr>
      <tr>
        <td>series.seriesUid</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.uid</td>
        <td></td>
      </tr>
      <tr>
        <td>series.number</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.number</td>
        <td></td>
      </tr>
      <tr>
        <td>series.seriesModality</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.modality</td>
        <td></td>
      </tr>
      <tr>
        <td>series.description</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.description</td>
        <td></td>
      </tr>
      <tr>
        <td>series.numberOfInstances</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.numberOfInstances</td>
        <td></td>
      </tr>
      <tr>
        <td>series.seriesEndpoint</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.endpoint</td>
        <td></td>
      </tr>
      <tr>
        <td>series.bodySite</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.bodySite</td>
        <td></td>
      </tr>
      <tr>
        <td>series.specimen</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.specimen</td>
        <td></td>
      </tr>
      <tr>
        <td>series.started</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.started</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.instance</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.instanceTitle</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.instance.extension[instance-description]</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.instanceUid</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.instance.uid</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.sopClass</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.instance.sopClass</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.instanceNumber</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.instance.number</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.numberOfFrames</td>
        <td>equivalent</td>
        <td><a href="./StructureDefinition-ImagingStudyEuImaging.html">ImagingStudyEuImaging</a></td>
        <td>series.instance.extension[number-of-frames]</td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.flag</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.reason</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.seriesUID</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>series.instancesInTheSeries.keyImage.instanceUID</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
