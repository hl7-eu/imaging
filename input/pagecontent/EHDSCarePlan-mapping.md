<!--
  Generated file. Do not edit.
-->

---
title: EHDSCarePlan Mapping
---

### EHDSCarePlan

The following table shows the mapping from EHDSCarePlan logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| activity[x] | EuCarePlan.activity |  |
| addresses |  |  |
| description | EuCarePlan.description ; EuCarePlan.description.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml] |  |
| header |  |  |
| header.authorship | EuCarePlan.contributor |  |
| [header.authorship.author[x]](#ehdsdevice) |  |  |
| header.authorship.datetime | EuCarePlan.created |  |
| header.identifier | EuCarePlan.identifier |  |
| header.language | EuCarePlan.language |  |
| header.lastUpdate | EuCarePlan.meta.lastUpdated |  |
| header.status | EuCarePlan.status |  |
| header.statusReason[x] |  | No field for statusReason, will require an extension |
| [header.subject](#ehdspatient) | EuCarePlan.subject |  |
| header.version | EuCarePlan.meta.versionId |  |
| period | EuCarePlan.subject |  |
| [presentedForm](#ehdsattachment) | EuCarePlan.text | No field to map this element, will require and extension |
| title | EuCarePlan.title ; EuCarePlan.title.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml] |  |

