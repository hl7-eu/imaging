<!--
  Generated file. Do not edit.
-->

#### EHDSImagingStudy

The following table shows the mapping from EHDSImagingStudy logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header |  | N/A |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[header.subject](StructureDefinition-EHDSPatient.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).subject |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.identifier | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).identifier[studyInstanceUid] |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.authorship | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.authorship.author[x] ([EHDSHealthProfessional](StructureDefinition-EHDSHealthProfessional.html), [EHDSOrganisation](StructureDefinition-EHDSOrganisation.html), [EHDSDevice](StructureDefinition-EHDSDevice.html)) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.authorship.datetime | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).started | No core element to map the issuing of the Study. An extension might be needed to be defined as part of the Imaging-manifest IG |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.lastUpdate | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).meta |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.status | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).status |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.statusReason[x] | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).extension[status-reason] ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).extension[status-reason] |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.language | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).language |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).header.version | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).meta |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[presentedForm](StructureDefinition-EHDSAttachment.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).text |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).modality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).modality |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[encounter](StructureDefinition-EHDSEncounter.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).encounter |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).started | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).started |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[basedOn](StructureDefinition-EHDSServiceRequest.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).basedOn |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).numberOfSeries | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).numberOfSeries |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).numberOfInstances | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).numberOfInstances |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).description | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).description |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[studyCustodian](StructureDefinition-EHDSOrganisation.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[studyEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).endpoint |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.seriesUid | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.number | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.acquisitionModality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.description | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.numberOfInstances | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[series.seriesEndpoint](StructureDefinition-EHDSEndpoint.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[series.bodySite](StructureDefinition-EHDSBodyStructure.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).[series.specimen](StructureDefinition-EHDSSpecimen.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.started | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.instanceTitle | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.instanceUid | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.sopClass | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.instanceNumber | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html).series.instancesInTheSeries.numberOfFrames | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |

