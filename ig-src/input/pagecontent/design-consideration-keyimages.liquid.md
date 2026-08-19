### Key Images 

#### Representation of Key Images

Key images can be represented either as image content or as a reference to DICOM content. The purpose of each key-image profile and when to use it are documented in the introduction of the profiles themselves:

{% if isR4 %}
* [MediaKeyImageEuImaging](StructureDefinition-MediaKeyImageEuImaging.html) — key image represented as image content in an R4 `Media` resource.
* [ImagingSelectionKeyImageEuImaging](StructureDefinition-ImagingSelectionKeyImageEuImaging.html) — key image identified using DICOM identifiers (implemented in R4 on a `Basic` resource with a cross-version extension backporting the R5 `ImagingSelection` structure).
{% else %}
* [DocumentReferenceKeyImageEuImaging](StructureDefinition-DocumentReferenceKeyImageEuImaging.html) — key image represented as image content in a `DocumentReference` resource.
* [ImagingSelectionKeyImageEuImaging](StructureDefinition-ImagingSelectionKeyImageEuImaging.html) — key image identified using DICOM identifiers.
{% endif %}

#### Key images and the findings section

Key images are carried in the report through the findings section (`Composition.section[findings]`), alongside the structured findings and any general images. How a key image is represented, and how the findings section is sliced, differs between FHIR R4 and R5 because the underlying image-content resource differs.

**Image-content resource by version.** Following the general guidance for non-PACS images — and the FHIR cross-version approach in which `Media` backports `DocumentReference` — a key image held as image content is a `Media` in R4 and a `DocumentReference` in R5. A key image identified by DICOM selection data is an `ImagingSelection` in both versions (implemented on a `Basic` resource with a cross-version extension in R4).

**Why R5 keeps key images and general images as separate slices.** In R5 a key-image `DocumentReference` carries a `category` of *Key images* (LOINC 55113-5) that a general-image `DocumentReference` does not. This coded marker lets the findings section keep two distinct entry slices — a `keyimage` slice (the key-image profiles) and a general `image` slice — and lets consumers tell them apart by category.

**Why R4 merges them into a single slice.** In R4 the image-content resource is a `Media`, and `Media` has no `category` element, so a key-image `Media` cannot be distinguished from a general `Media` by a coded category. In addition, because a key-image resource also conforms to the generic `Media`/`ImagingSelection` supertype, a profile-based slice discriminator would match both a specific key-image slice and a generic image slice — an ambiguity that is not permitted. To avoid this, the R4 findings section uses a **single `image` entry slice** that accepts a general image (`Media`), a key image as image content (`MediaKeyImageEuImaging`), or a key image identified by DICOM selection (`ImagingSelectionKeyImageEuImaging`). A consumer distinguishes a key image from a general image by the profile the resource declares (`meta.profile`), not by a category code.

Deliberately, no `category` element is added to the R4 `Media` key-image profile: `Media` does not define `category`, and introducing a cross-version extension for a single coded marker was judged to add more complexity than value.