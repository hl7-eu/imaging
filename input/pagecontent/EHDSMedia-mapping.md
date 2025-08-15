<!--
  Generated file. Do not edit.
-->

#### EHDSMedia

The following table shows the mapping from EHDSMedia logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| identifier | EuDocumentReference.identifier |  |
| type | EuDocumentReference.type |  |
| modality | EuDocumentReference.modality |  |
| view | EuDocumentReference.extension[view] | Media.type in R4 |
| subject[x] | EuDocumentReference.subject |  |
| created[x] | EuDocumentReference.period |  |
| reason | EuDocumentReference.event |  |
| bodysite | EuDocumentReference.bodySite.concept |  |
| deviceName | EuDocumentReference.author ; EuDevice.name |  |
| device | EuDocumentReference.author |  |
| [content](#ehdsattachment) | EuDocumentReference.content.attachment |  |
| note | EuDocumentReference.extension[note] |  |
| performer | EuDocumentReference.author |  |

