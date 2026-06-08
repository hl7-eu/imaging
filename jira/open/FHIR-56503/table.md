| Profile | Field | Slice | Fixed Code | Binding |
|---------|-------|-------|-----------|---------|
| `CompositionEuImaging` | `type` | — | — | `ImagingReportTypesEuVSEuImaging` (preferred) |
| `CompositionEuImaging` | `category` | `[imaging-report]` | `$loinc#85430-7` "Diagnostic imaging report" | — |
| `CompositionEuImaging` | `category` | `[imaging]` | eehrxf `#Medical-Imaging` | — |
| `CompositionEuImaging` | `category` | `[diagnostic-service]` | — | `$diagnostic-service-sections` (required) |
| `CompositionEuImaging` | `section[imagingstudy].code` | — | `$loinc#18726-0` | — |
| `CompositionEuImaging` | `section[order].code` | — | `$loinc#55115-0` | — |
| `CompositionEuImaging` | `section[history].code` | — | `$loinc#11329-0` | — |
| `CompositionEuImaging` | `section[procedure].code` | — | `$loinc#55111-9` | — |
| `CompositionEuImaging` | `section[comparison].code` | — | `$loinc#18834-2` | — |
| `CompositionEuImaging` | `section[findings].code` | — | `$loinc#59776-5` | — |
| `CompositionEuImaging` | `section[impression].code` | — | `$loinc#19005-8` | — |
| `CompositionEuImaging` | `section[recommendation].code` | — | `$loinc#18783-1` | — |
| `CompositionEuImaging` | `section[communication].code` | — | `$loinc#73568-8` | — |
| `CompositionEuImaging` | `section[report].code` | — | `$loinc#LP173421-1` | — |
| `DiagnosticReportEuImaging` | `code` | — | — | `ImagingReportTypesEuVSEuImaging` (preferred) |
| `DiagnosticReportEuImaging` | `category` | `[imaging-report]` | `$loinc#85430-7` | — |
| `DiagnosticReportEuImaging` | `category` | `[imaging]` | eehrxf `#Medical-Imaging` | — |
| `DiagnosticReportEuImaging` | `category` | `[diagnostic-service]` | — | `$diagnostic-service-sections` (required) |
| `DocumentReferenceImagingReport` | `category.coding` | `[priority-area]` | eehrxf `#Medical-Imaging` | — |
| `DocumentReferenceImagingReport` | `type.coding` | `[imaging-report]` | `$loinc#85430-7` | — |
| `DocumentReferenceImagingReport` | `bodySite.concept.coding` | — | — | `ValueSetAnatomicalRegion` (extensible) |
| `DocumentReferenceKeyImageEuImaging` | `type` | — | — | `image-reference-type` (preferred) |
| `DocumentReferenceKeyImageEuImaging` | `category[imkeyimages].coding` | `[keyimagecode]` | `$loinc#55113-5` "Key images Document Radiology" | — |
| `ImagingStudyEuImaging` | `series.performer.function` | — | — | `ImagingStudyEuImagingPerformerTypeVS` (extensible) |
| `ImagingStudyEuImaging` | `series.performer[performer].function` | — | `v3-ParticipationType#PRF` | — |
| `ImagingStudyEuImaging` | `series.performer[custodian].function` | — | `v3-ParticipationType#CST` | — |
| `ImagingStudyEuImaging` | `series.performer[device].function` | — | `v3-ParticipationType#DEV` | — |
| `ImagingStudyEuImaging` | `series.performer[organization].function` | — | `v3-ParticipationType#LOC` | — |
| `ServiceRequestOrderEuImaging` | `category` | `[imaging]` | `$sct#363679005` "Imaging" | — |
| `ServiceRequestOrderEuImaging` | `code` | — | — | `ProcedureEuImagingType` (example) |
| `ProcedureEuImaging` | `code` | — | — | `ProcedureEuImagingType` (extensible) |
| `ProcedureEuImaging` | `performer[performer].function.coding` | `[healthcare-professional]` | `$sct#223366009` "Healthcare professional" | — |
| `ProcedureEuImaging` | `performer[imaging-device].function.coding` | `[imaging-equipment]` | `$sct#314789007` "Diagnostic imaging equipment" | — |
| `DeviceEuImaging` (R5) | `category` | `[imaging]` | `$sct#314789007` "Diagnostic imaging equipment" | — |
| `DeviceEuImaging` (R4) | `extension[imagingCategory].valueCodeableConcept` | — | `$sct#314789007` | — |
| `DeviceEuImaging` | `type` | — | — | `DeviceEuImagingType` (extensible) |
| `AccessionNumberIdentifierEuImaging` | `type.coding` | `[v2-0203-coding]` | `$v2-0203#ACSN` | — |
| `AccessionNumberIdentifierEuImaging` | `type.coding` | `[dcm]` | `DCM#121022` "Accession Number" | — |
| `StudyInstanceUidIdentifierEuImaging` | `type.coding` | `[dcm]` | `DCM#110180` "Study Instance UID" | — |
| `ObservationRadiationDoseEuImaging` | `code.coding` | `[radiation-dose]` | `$loinc#73569-6` "Radiation exposure and protection information" | — |
