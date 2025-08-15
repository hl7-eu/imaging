<!--
  Generated file. Do not edit.
-->

#### EHDSCarePlan

The following table shows the mapping from EHDSCarePlan logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuCarePlan.subject |  |
| header.identifier | EuCarePlan.identifier |  |
| header.authorship | EuCarePlan.contributor |  |
| header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) |  |  |
| header.authorship.datetime | EuCarePlan.created |  |
| header.lastUpdate | EuCarePlan.meta.lastUpdated |  |
| header.status | EuCarePlan.status |  |
| header.statusReason[x] |  | No field for statusReason, will require an extension |
| header.language | EuCarePlan.language |  |
| header.version | EuCarePlan.meta.versionId |  |
| [presentedForm](#ehdsattachment) | EuCarePlan.text | No field to map this element, will require and extension |
| title | EuCarePlan.title ; EuCarePlan.title.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml] |  |
| description | EuCarePlan.description ; EuCarePlan.description.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml] |  |
| period | EuCarePlan.subject |  |
| addresses |  |  |
| activity[x] | EuCarePlan.activity |  |

