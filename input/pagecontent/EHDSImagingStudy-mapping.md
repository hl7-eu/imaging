<!--
  Generated file. Do not edit.
-->

#### EHDSImagingStudy

The following table shows the mapping from EHDSImagingStudy logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSImagingStudy.header |  | N/A |
| EHDSImagingStudy.[header.subject](StructureDefinition-EHDSPatient.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).subject |  |
| EHDSImagingStudy.header.identifier | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).identifier[studyInstanceUid] |  |
| EHDSImagingStudy.header.authorship | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.header.authorship.author[x] ([EHDSHealthProfessional](StructureDefinition-EHDSHealthProfessional.html), [EHDSOrganisation](StructureDefinition-EHDSOrganisation.html), [EHDSDevice](StructureDefinition-EHDSDevice.html)) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.header.authorship.datetime | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).started | No core element to map the issuing of the Study. An extension might be needed to be defined as part of the Imaging-manifest IG |
| EHDSImagingStudy.header.lastUpdate | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).meta |  |
| EHDSImagingStudy.header.status | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).status |  |
| EHDSImagingStudy.header.statusReason[x] | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).extension[status-reason] ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).extension[status-reason] |  |
| EHDSImagingStudy.header.language | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).language |  |
| EHDSImagingStudy.header.version | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).meta |  |
| EHDSImagingStudy.[presentedForm](StructureDefinition-EHDSAttachment.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).text |  |
| EHDSImagingStudy.modality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).modality |  |
| EHDSImagingStudy.[encounter](StructureDefinition-EHDSEncounter.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).encounter |  |
| EHDSImagingStudy.started | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).started |  |
| EHDSImagingStudy.[basedOn](StructureDefinition-EHDSServiceRequest.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).basedOn |  |
| EHDSImagingStudy.numberOfSeries | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).numberOfSeries |  |
| EHDSImagingStudy.numberOfInstances | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).numberOfInstances |  |
| EHDSImagingStudy.description | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).description |  |
| EHDSImagingStudy.[studyCustodian](StructureDefinition-EHDSOrganisation.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.[studyEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).endpoint |  |
| EHDSImagingStudy.series | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.seriesUid | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.number | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.acquisitionModality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.description | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.numberOfInstances | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.[series.seriesEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.[series.bodySite](StructureDefinition-EHDSBodyStructure.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.[series.specimen](StructureDefinition-EHDSSpecimen.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.started | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.instanceTitle | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.instanceUid | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.sopClass | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.instanceNumber | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.numberOfFrames | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |

