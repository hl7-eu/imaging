<!--
  Generated file. Do not edit.
-->

#### EHDSMedia

The following table shows the mapping from EHDSMedia logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSMedia.identifier | EuDocumentReference.identifier |  |
| EHDSMedia.type | EuDocumentReference.type |  |
| EHDSMedia.modality | EuDocumentReference.modality |  |
| EHDSMedia.view | EuDocumentReference.extension[view] | Media.type in R4 |
| EHDSMedia.subject[x] | EuDocumentReference.subject |  |
| EHDSMedia.created[x] | EuDocumentReference.period |  |
| EHDSMedia.reason | EuDocumentReference.event |  |
| EHDSMedia.bodysite | EuDocumentReference.bodySite.concept |  |
| EHDSMedia.deviceName | EuDocumentReference.author ; EuDevice.name |  |
| EHDSMedia.device | EuDocumentReference.author |  |
| EHDSMedia.[content](#ehdsattachment) | EuDocumentReference.content.attachment |  |
| EHDSMedia.note | EuDocumentReference.extension[note] |  |
| EHDSMedia.performer | EuDocumentReference.author |  |

