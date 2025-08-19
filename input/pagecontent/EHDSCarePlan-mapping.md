<!--
  Generated file. Do not edit.
-->

#### EHDSCarePlan

The following table shows the mapping from EHDSCarePlan logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSCarePlan.header |  |  |
| EHDSCarePlan.[header.subject](#ehdspatient) | EuCarePlan.subject |  |
| EHDSCarePlan.header.identifier | EuCarePlan.identifier |  |
| EHDSCarePlan.header.authorship | EuCarePlan.contributor |  |
| EHDSCarePlan.header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) |  |  |
| EHDSCarePlan.header.authorship.datetime | EuCarePlan.created |  |
| EHDSCarePlan.header.lastUpdate | EuCarePlan.meta.lastUpdated |  |
| EHDSCarePlan.header.status | EuCarePlan.status |  |
| EHDSCarePlan.header.statusReason[x] |  | No field for statusReason, will require an extension |
| EHDSCarePlan.header.language | EuCarePlan.language |  |
| EHDSCarePlan.header.version | EuCarePlan.meta.versionId |  |
| EHDSCarePlan.[presentedForm](#ehdsattachment) | EuCarePlan.text | No field to map this element, will require and extension |
| EHDSCarePlan.title | EuCarePlan.title ; EuCarePlan.title.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml] |  |
| EHDSCarePlan.description | EuCarePlan.description ; EuCarePlan.description.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml] |  |
| EHDSCarePlan.period | EuCarePlan.subject |  |
| EHDSCarePlan.addresses |  |  |
| EHDSCarePlan.activity[x] | EuCarePlan.activity |  |

