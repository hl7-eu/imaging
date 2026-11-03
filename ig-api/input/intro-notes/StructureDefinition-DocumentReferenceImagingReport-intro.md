This profile defines the R4 `DocumentReference` used by the EEHRxF Health Access API to index and retrieve an imaging report. It is based on `EehrxfMhdDocumentReference` and adds imaging-report-specific metadata and constraints.

The `DocumentReference` is the access and discovery wrapper, not the report content itself. Its `content.attachment.url` identifies a report `Bundle`, and the `content.extension[profile]` extension declares the canonical profile of that Bundle. The Bundle and its clinical resources follow the Imaging Report R4 guide. For example, structured and semi-structured reports use `BundleReportEuImaging`; a report with minimal metadata may use `BundleReportMinimalMetadataEuImaging`.

### Profile constraints

| Element | Requirement | Meaning |
| --- | --- | --- |
| `status` | `1..1` | A status is required for the document reference. |
| `subject` | `1..1` | Identifies the patient associated with the imaging report. |
| `date` | `1..1` | Records when the document reference was created or indexed; it is distinct from the report's clinical time and the attachment creation time. |
| `category` | `1..1` | Includes the required `priority-area` coding, fixed to `Medical-Imaging` in the EEHRxF document-priority category code system. |
| `type` | `1..1` | Includes the required `imaging-report` coding, fixed to LOINC `85430-7`. The type should correspond to `DiagnosticReport.code`. |
| `custodian` | Reference limited to `EuOrganization` | Identifies the organization managing the imaging report. This profile narrows the reference type without adding a cardinality constraint. |
| `extension[version]` | `0..1` | Carries the R5 `DocumentReference.version` information through its R4 cross-version extension when needed. |
| `extension[bodysite]` | `0..*` | May identify the patient's anatomical region of interest using the IHE MADO body-site extension. Its value is drawn from the EU imaging anatomical-region value set with an extensible binding. |
| `extension[modality]` | `1..*` | Requires at least one imaging modality using the IHE MADO modality extension. |
| `content` | `1..1` | Requires one content entry for the referenced report. |
| `content.extension[profile]` | `1..*` | Requires at least one canonical profile for the referenced content. The extension identifies the Bundle's profile; it does not fix the value to one specific Bundle profile. |

The required `category` and `type` codings are slices; the profile requires those slices but does not close the coding collections to additional codings. The report type is recommended to come from the suggested LOINC set, and it should agree with the code on the report's `DiagnosticReport`.

### Time and version information

The wrapper and the report content can describe different times. Use `context.period` for the clinically effective period, such as when the imaging study took place; `content.attachment.creation` for when the report content was created or assembled; and `date` for when the `DocumentReference` was created or indexed. When version information for the document reference is available, represent it with `extension[version]`.

### Practice setting

`context.practiceSetting` can describe the clinical specialty and should be used to distinguish imaging from other specialties, such as laboratory services.
