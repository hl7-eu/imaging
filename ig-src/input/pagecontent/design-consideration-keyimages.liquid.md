### Representation of Key Images

Key images can be represented either as image content or as a reference to DICOM content. The purpose of each key-image profile and when to use it are documented in the introduction of the profiles themselves:

{% if isR4 %}
* [MediaKeyImageEuImaging](StructureDefinition-MediaKeyImageEuImaging.html) — key image represented as image content in an R4 `Media` resource.
* [ImagingSelectionKeyImageEuImaging](StructureDefinition-ImagingSelectionKeyImageEuImaging.html) — key image identified using DICOM selection data (implemented in R4 on a `Basic` resource with a cross-version extension backporting the R5 `ImagingSelection` structure).
{% else %}
* [DocumentReferenceKeyImageEuImaging](StructureDefinition-DocumentReferenceKeyImageEuImaging.html) — key image represented as image content in a `DocumentReference` resource.
* [ImagingSelectionKeyImageEuImaging](StructureDefinition-ImagingSelectionKeyImageEuImaging.html) — key image identified using DICOM selection data.
{% endif %}