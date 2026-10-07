
A *key image* is an image, or a specific frame within an image, that the imaging clinician has selected as particularly relevant to the report — for example an image that best demonstrates a finding, supports the impression, or is useful for comparison and follow-up. In radiology a study can contain hundreds or thousands of instances, so flagging key images helps the referring physician and other readers quickly locate the most significant images. In DICOM, key images are typically captured using a Key Object Selection (KOS) document, described by [Key Object Selection, TID 2010](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_TID_2010.html) in DICOM PS3.16.


### Representation of Key Images

Key images can be represented either as image content or as a reference to DICOM selection data:

{% if isR4 %}
* `Media` ({{ MediaKeyImageEuImaging }}) — the key image as image content.
* `ImagingSelection` ({{ ImagingSelectionKeyImageEuImaging }}) — the key image identified using DICOM selection data. In this R4 IG the `ImagingSelection` is implemented on a `Basic` resource with a cross-version extension backporting the R5 `ImagingSelection` structure.
{% else %}
* `DocumentReference` ({{ DocumentReferenceKeyImageEuImaging }}) — the key image as image content.
* `ImagingSelection` ({{ ImagingSelectionKeyImageEuImaging }}) — the key image identified using DICOM selection data.
{% endif %}

`ImagingSelection` is more DICOM oriented and relates to DICOM identifiers. {% if isR4 %}`Media`{% else %}`DocumentReference`{% endif %} represents the image content and contains information such as its size, format and duration. The {{ ehnImagingGuidelines }} requires information on the size, format and duration; these data elements are provided by the `Attachment` in {% if isR4 %}`Media.content`{% else %}`DocumentReference.content.attachment`{% endif %}.

This IG uses {% if isR4 %}`Media` in R4{% else %}`DocumentReference` in R5{% endif %} for image content, and `ImagingSelection` when the key image is identified using DICOM selection data (for example, to state that an image can come from a Procedure Phase).

The `ImagingSelection` resource points to DICOM data. The DICOM instance data also holds the data required by the {{ ehnImaging }}, so the client can retrieve the information from the DICOM source data. Access to the imaging data can be direct or through a web based image viewer; a scenario supported by `ImagingSelection` requires access to the DICOM identifiers and a WADO endpoint.

{% if isR4 %}`Media`{% else %}`DocumentReference`{% endif %} resources refer to the image data directly, either by including it in the `Attachment` or by linking to it. The report may also refer to key images such as charts or PDFs that are not stored in a DICOM PACS; {% if isR4 %}`Media`{% else %}`DocumentReference`{% endif %} supports this case.

Key images can be represented by `ImagingSelection` or {% if isR4 %}`Media`{% else %}`DocumentReference`{% endif %} resources. When using {% if isR4 %}`Media`{% else %}`DocumentReference`{% endif %} to represent a DICOM artifact, it carries an identifier corresponding to the SOP instance, series or study it represents. In the case of `ImagingSelection` these values are represented as fields in the resource.
