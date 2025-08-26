<!--
  Generated file. Do not edit.
-->

#### EHDSImagingStudy

The following table shows the mapping from EHDSImagingStudy logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSImagingStudy.header |  | N/A |
| EHDSImagingStudy.[header.subject](StructureDefinition-EHDSPatient.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).subject |  |
| EHDSImagingStudy.header.identifier | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).identifier[studyInstanceUid] |  |
| EHDSImagingStudy.header.authorship | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.header.authorship.author[x] ([EHDSHealthProfessional](StructureDefinition-EHDSHealthProfessional.html), [EHDSOrganisation](StructureDefinition-EHDSOrganisation.html), [EHDSDevice](StructureDefinition-EHDSDevice.html)) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.header.authorship.datetime | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).started | No core element to map the issuing of the Study. An extension might be needed to be defined as part of the Imaging-manifest IG |
| EHDSImagingStudy.header.lastUpdate | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).meta |  |
| EHDSImagingStudy.header.status | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).status |  |
| EHDSImagingStudy.header.statusReason[x] | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).extension[status-reason] ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).extension[status-reason] |  |
| EHDSImagingStudy.header.language | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).language |  |
| EHDSImagingStudy.header.version | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).meta |  |
| EHDSImagingStudy.[presentedForm](StructureDefinition-EHDSAttachment.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).text |  |
| EHDSImagingStudy.modality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).modality |  |
| EHDSImagingStudy.[encounter](StructureDefinition-EHDSEncounter.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).encounter |  |
| EHDSImagingStudy.started | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).started |  |
| EHDSImagingStudy.[basedOn](StructureDefinition-EHDSServiceRequest.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).basedOn |  |
| EHDSImagingStudy.numberOfSeries | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).numberOfSeries |  |
| EHDSImagingStudy.numberOfInstances | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).numberOfInstances |  |
| EHDSImagingStudy.description | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).description |  |
| EHDSImagingStudy.[studyCustodian](StructureDefinition-EHDSOrganisation.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.[studyEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).endpoint |  |
| EHDSImagingStudy.series | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.seriesUid | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.number | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.acquisitionModality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.description | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.numberOfInstances | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.[series.seriesEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.[series.bodySite](StructureDefinition-EHDSBodyStructure.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.[series.specimen](StructureDefinition-EHDSSpecimen.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.started | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.instanceTitle | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.instanceUid | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.sopClass | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.instanceNumber | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingStudy.series.instancesInTheSeries.numberOfFrames | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |

