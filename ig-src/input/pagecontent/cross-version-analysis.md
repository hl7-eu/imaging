{% include variable-definitions.md %}

This page describes the differences between the FHIR R4 (4.0.1) and R5 (5.0.0) versions of this implementation guide.

The R4 build uses the cross-version (xver-r5.r4) extensions 0.1.0 STU package where R5 functionality has no native R4 element. The R5 build uses native R5 resources and elements for those same concepts.

| Area | FHIR R4 representation | FHIR R5 representation |
| --- | --- | --- |
| ImagingSelection | `ImagingSelectionEuImaging` and `ImagingSelectionKeyImageEuImaging` are profiled on the xver `Basic` backport profile. Generated examples are `Basic` resources. | The same profiles are native `ImagingSelection` profiles. Generated examples are `ImagingSelection` resources. |
| Key images as image content | Uses the R4 `MediaKeyImageEuImaging` profile and generated `Media` examples. | Uses the R5 `DocumentReferenceKeyImageEuImaging` profile and generated `DocumentReference` examples. |
| DocumentReference body site and modality | Uses R4 extension slices for `bodySite` and `modality`, with IG-defined R4 SearchParameters for `bodysite` and `modality`. | Uses native R5 `DocumentReference.bodySite`, `DocumentReference.modality`, and the corresponding core R5 SearchParameters. |
| DocumentReference content profile | Uses an R4 `DocumentReference.content` extension carrying the referenced profile canonical. | Uses native R5 `DocumentReference.content.profile`. |
| Device category | Uses the R5 `Device.category` cross-version extension on R4 `Device`. | Uses native R5 `Device.category`. |
| Composition and DiagnosticReport links | Uses R4-compatible elements or R5 backport extensions where R5 moved the relationship, such as DiagnosticReport-to-Composition and Composition version. | Uses native R5 elements such as `DiagnosticReport.composition` and `Composition.version`. |

{% include worknote.html text="Tracked by <a href='https://jira.hl7.org/browse/FHIR-57776'>FHIR-57776</a>: the R4 ImagingSelection profiles were re-modelled onto the xver-r5.r4 0.1.0 granular extensions. R4 profiling of inherited cross-version extensions is valid in principle, but the <code>Basic.extension:derivedFrom</code> and <code>Basic.extension:performer</code> cases expose current tooling limitations: the performer reslice must declare its added discriminators on the unnamed slicing entry while retaining the inherited discriminator, and <code>org.hl7.fhir.core</code> must resolve <code>extension(url)</code> discriminators against inline sub-extensions. The correlated performer reslice therefore remains deferred; the current aggregate performer constraints remain the production representation until a publisher release includes <a href='https://github.com/hapifhir/org.hl7.fhir.core/pull/2599'>FHIR core fix #2599</a> and its <a href='https://github.com/FHIR/fhir-test-cases/pull/280'>validator test case</a>." %}

{% include cross-version-analysis-en.xhtml %}
