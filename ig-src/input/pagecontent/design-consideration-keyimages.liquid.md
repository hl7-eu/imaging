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

**Why the findings section uses a single image slice.** Because a key-image resource also conforms to its generic supertype (`Media` in R4, `DocumentReference` in R5), a profile-based slice discriminator would match both a specific key-image slice and a generic image slice — an ambiguity that is not permitted. To avoid this, the findings section uses a **single `image` entry slice** in both versions that accepts a general image (`Media` / `DocumentReference`), a key image as image content (`MediaKeyImageEuImaging` / `DocumentReferenceKeyImageEuImaging`), or a key image identified by DICOM selection (`ImagingSelectionKeyImageEuImaging`). A consumer distinguishes a key image from a general image by the profile the resource declares (`meta.profile`) — and, in R5, additionally by the *Key images* `category` (LOINC 55113-5) that the key-image `DocumentReference` carries.

Deliberately, no `category` element is added to the R4 `Media` key-image profile: `Media` does not define `category`, and introducing a cross-version extension for a single coded marker was judged to add more complexity than value.