### Imaging study population use cases

The amount of imaging study information available to the report creator varies by setting. Systems with full access to a PACS can populate the complete study metadata, while other systems (e.g. reports from dentistry, dermatology, or legacy systems) may know only part of it, or nothing at all. The rules for populating the imaging study information are summarised on the [Imaging Report](imaging-report.html#imaging-study) page.

The table below details how to represent the imaging study information depending on which data elements are known to the report creator. The use cases are mutually exclusive. In the table, "Yes" means the element is known, "No" means it is not known, and "Yes/No" marks elements that may or may not be present. Whenever the report creator knows that an entry in the PACS exists (i.e. any identifier or metadata is known), it populates an `ImagingStudy` resource and references it from `section[imagingstudy]`; only when nothing about the study is known is no resource created and the section omitted.

| Use case | StudyInstanceUID | Accession Number | Modality | Anatomy | Procedure code | Time | Implementation |
| -------- | ---------------- | ---------------- | -------- | ------- | -------------- | ---- | -------------- |
| Access to PACS (all data known) | Yes | Yes | Yes | Yes | Yes | Yes | Use `ImagingStudy` resource; populate per current model; reference from Composition / Bundle / DiagnosticReport |
| Only StudyInstanceUID known | Yes | No | No | No | No | No | Use a thin `ImagingStudy` resource carrying only the `studyInstanceUid`; reference it |
| UID + metadata known, Accession not known | Yes | No | Yes/No | Yes/No | Yes/No | Yes/No | Use `ImagingStudy` resource; populate per current model; reference it |
| Only Accession number known | No | Yes | No | No | No | No | Use `ImagingStudy` resource with only `.basedOn[ServiceRequestOrderEuImagingaccession]` |
| Accession + metadata known, StudyInstanceUID not known | No | Yes | Yes/No | Yes/No | Yes/No | Yes/No | Use `ImagingStudy` resource with no `identifier`; populate `.basedOn` + metadata per current model |
| Only metadata known | No | No | Yes/No | Yes/No | Yes/No | Yes/No | Use `ImagingStudy` resource with no `identifier` and no accession; populate metadata per current model |
| Nothing known | No | No | No | No | No | No | Do not create an `ImagingStudy` resource; omit `section[imagingstudy]` |
