<!--
  Generated file. Do not edit.
-->

---
title: EHDSMedia Mapping
---

### EHDSMedia

The following table shows the mapping from EHDSMedia logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| bodysite | EuDocumentReference.bodySite.concept |  |
| [content](#ehdsattachment) | EuDocumentReference.content.attachment |  |
| created[x] | EuDocumentReference.period |  |
| device | EuDocumentReference.author |  |
| deviceName | EuDocumentReference.author ; EuDevice.name |  |
| identifier | EuDocumentReference.identifier |  |
| modality | EuDocumentReference.modality |  |
| note | EuDocumentReference.extension[note] |  |
| performer | EuDocumentReference.author |  |
| reason | EuDocumentReference.event |  |
| subject[x] | EuDocumentReference.subject |  |
| type | EuDocumentReference.type |  |
| view | EuDocumentReference.extension[view] | Media.type in R4 |

