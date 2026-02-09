<!--
  Generated file. Do not edit.
-->

#### EHDSImagingStudy

The following table shows the mapping from EHDSImagingStudy logical model elements to FHIR profiles.

The source data for the mapping to other FHIR versions of this Implementation Guide can be found in the [Google spreadsheet](https://docs.google.com/spreadsheets/d/1-Eo2eh8iEj5PgzoiWoJdifhlkvXJDXdn5RwaS4-iq-Y/edit?usp=sharing).





| Element | Target | Comments |
| ------- | ------ | -------- |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header |  | N/A |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[header.subject](StructureDefinition-EHDSPatient.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).subject |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.identifier | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).identifier[studyInstanceUid] |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.authorship | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.authorship.author[x] | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series;<br/>[ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series;<br/>[ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.authorship.datetime | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).started | No core element to map the issuing of the Study. An extension might be needed to be defined as part of the Imaging-manifest IG |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.lastUpdate | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).meta |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.status | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).status |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.statusReason[x] | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).extension[status-reason];<br/>[ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).extension[status-reason] |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.language | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).language |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.version | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).meta |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[presentedForm](StructureDefinition-EHDSAttachment.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).text |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).modality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[encounter](StructureDefinition-EHDSEncounter.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).encounter |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).started | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).started |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[basedOn](StructureDefinition-EHDSServiceRequest.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).basedOn |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).numberOfSeries | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).numberOfSeries |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).numberOfInstances | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).numberOfInstances |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).description | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).description |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[studyCustodian](StructureDefinition-EHDSOrganisation.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[studyEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).endpoint |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.seriesUid | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.number | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.acquisitionModality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.description | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.numberOfInstances | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[series.seriesEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[series.bodySite](StructureDefinition-EHDSBodyStructure.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[series.specimen](StructureDefinition-EHDSSpecimen.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.started | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.instanceTitle | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.instanceUid | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.sopClass | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.instanceNumber | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.numberOfFrames | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
{:.table-bordered .table-striped .thead-light}
