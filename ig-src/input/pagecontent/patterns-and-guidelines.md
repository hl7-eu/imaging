{%include variable-definitions.md %}

### Presentation format of the document

As is discussed in the [Data Formats](data-formats.html) section there are two formats of the imaging reports. When presenting the content to the user two different presentation forms are used:
* For imaging reports with minimal metadata the presented form is the pdf attached to the `DiagnosticReport`.
* For Regular imaging reports the presented form is the html Narrative of the `Composition` resource, stored in `Compostion.text` and `Compostion.section.text`.

### Inclusion of tables

The annotations are entered as markdown which allows inclusion of tables

### Support of IHE-RAD-IMR

IHE-IMR defines a mechanism that allows inclusion multimedia content in the report. Use of these mechanisms is encouraged but not required.

### Include links from the narrative included annotations (GSPS) and key images (instances/KIN/KO/IMA)

This can be done using the links defined in IHE-IMR.

### Link to FHIR resources

As is specified in the FHIR specification (and made more explicit in FHIR R6), the narrative text of resources allows the inclusion of hyperlinks. A hyperlink can refer to structured data that is included in the report as is shown in the example below.

```
...
The diameter of the lesion is <a href="Observation/kjiewoj">11 mm</a>.
...
```
The `href` field of the link holds a relative reference to the referred resource. When rendering this narrative, a click on this link SHOULD open a rendered version of the referred resource.

### Supporting links to findings and prior studies from the narrative

These links can be included in the text (Narrative) using the mechanism described in the previous section. This does require that the `ImagingStudy`/`Observation` resource representing the finding/prior is included in the document.


### What terminology use in the report

The specification focusses first on the infrastructural aspects and marks the terminology related this as extensible. We are conservative in placing terminology requirements on findings and interpretations are there currently is not a widespread consensus on what terminology is used.

### Support for report replacement and retraction

This spec follows the document-level mechanics outlined in the HL7 [FHIR Clinical Document — Succession Management](https://build.fhir.org/ig/HL7/fhir-clinical-document/en/versioning.html) specification, except that addenda are not allowed, and introducing requirements to the `DiagnosticReport.status` population.

#### Replacement of a report example snippet

See the replacement [DiagnosticReport example](DiagnosticReport-ImagingReportReplacementExample.html) and [Composition example](Composition-ImagingReportReplacementComposition.html).

{% if isR4 %}
```json
// DiagnosticReport
{
  "resourceType": "DiagnosticReport",
  "status": "amended"
}
// Composition
{
  "resourceType": "Composition",
  "status": "final",
  "relatesTo": [
    {
      "code": "replaces",
      "targetIdentifier": { "system": "...", "value": "..." }
    }
  ]
}
```
{% endif %}
{% if isR5 %}
```json
// DiagnosticReport
{
  "resourceType": "DiagnosticReport",
  "status": "amended"
}
// Composition
{
  "resourceType": "Composition",
  "status": "final",
  "relatesTo": [
    {
      "type": "replaces",
      "resourceReference": { "identifier": { "system": "...", "value": "..." } }
    }
  ]
}
```
{% endif %}

#### Retraction of a report example snippet

See the retraction [DiagnosticReport example](DiagnosticReport-ImagingReportRetractionExample.html) and [Composition example](Composition-ImagingReportRetractionComposition.html).

{% if isR4 %}
```json
// DiagnosticReport
{
  "resourceType": "DiagnosticReport",
  "status": "entered-in-error"
}
// Composition
{
  "resourceType": "Composition",
  "status": "entered-in-error",
  "relatesTo": [
    {
      "code": "replaces",
      "targetIdentifier": { "system": "...", "value": "..." }
    }
  ]
}
```
{% endif %}
{% if isR5 %}
```json
// DiagnosticReport
{
  "resourceType": "DiagnosticReport",
  "status": "entered-in-error"
}
// Composition
{
  "resourceType": "Composition",
  "status": "entered-in-error",
  "relatesTo": [
    {
      "type": "replaces",
      "resourceReference": { "identifier": { "system": "...", "value": "..." } }
    }
  ]
}
```
{% endif %}

### Relation with DICOM-SR reports

DICOM-SR reports can be accessed and referred using ImagingSelections as they are stored as instances in the PACS. In the case that the report is a DICOM-SR report,

### Can there be multiple reports on a single study and can a report report on multiple studies?

Yes, there can be multiple reports referring the same study. A study can refer to more than one study. See semi-structured example.

### Inclusion of images/drawings that are not stored in DICOM objects

These can be included as {%if isR4 %}`Media`{%else%}`DocumentReference`{%endif%} and are referred from the `Composition.section[finding]` and `DiagnosticReport.media`. It is RECOMMENDED to:

* Use {%if isR4 %}`Media`{%else%}`DocumentReference`{%endif%} when the information is not present in the PACS (e.g. screenshots, photos, ...)
* Use {%if isR4 %}[`Basic-ImagingSelection`](StructureDefinition-SrInstanceImagingSelectionEuImaging.html){%else%}`ImagingSelection`{%endif%} to refer to information in the PACS.
* Prefer {%if isR4 %}`Media`{%else%}`DocumentReference`{%endif%} over `Binary` as {%if isR4 %}`Media`{%else%}`DocumentReference`{%endif%} is patient scoped and `Binary` is not. `Binary` SHOULD only be used for images in `Narrative`s that are included as contained resources.
* In the case both are possible, systems SHOULD use {%if isR4%}[`Basic-ImagingSelection`](StructureDefinition-SrInstanceImagingSelectionEuImaging.html){%else%}`ImagingSelection`{%endif%}.


### Support for digital pathology

Currently not in scope.

### Link with IHE-AIResults

AI results are stored as DICOM-SR documents which can be accessed as DICOM instances using the manifest. Optionally, the source system has the option to reflect the content of these DICOM-SR documents in FHIR using the DICOM-SR-2-FHIR IG. When elements from the AIR reports are included in the imaging report, it is RECOMMENDED to use the format specified in DICOM-SR-2-FHIR.

### Inclusion of date-time values for which the time-zone is unknown

Some of the source data for imaging report comes from DICOM. Although DICOM recommends to include time-zone information there will be situations that the timezone is not included in the DICOM data and cannot be derived from the context. In this case the document creator SHALL include the date-time value as is and add the [Uncertain period Extension](https://hl7.org/fhir/extensions/StructureDefinition-uncertainPeriod.html) to indicate the uncertainty period of the datetime value.

```json
...
 "started" : "2015-02-07T13:28:17-05:00"
 "_started" : {
 "extension" : [
 { "url": "http://hl7.org/fhir/StructureDefinition/uncertainPeriod",
 "valuePeriod" : {
 "start": "2015-02-07T13:28:17-12:00",
 "end": "2015-02-07T13:28:17+12:00"
 }
 }
 ]
 }
...
```

### Displaying the releasing organization

The organization that released the imaging report is carried by `Composition.author` where the author is an `Organization` (equivalently `DiagnosticReport.performer[author]`, constrained to `Organization` per FHIR-51393). Consuming systems SHOULD make this releasing organization identifiable and display it to the reader as the source of the report.

Consumers SHALL NOT infer the releasing organization from the clinical `encounter`: in independent-reporting / teleradiology / outside-read scenarios the encounter organization differs from the reporting organization, and the acquisition encounter may be unavailable. Where multiple author organizations are present, the releasing organization is the one referenced by the `Composition`/`DiagnosticReport` author/performer, not the encounter.

### Assembling document bundles and freshness of data

It is fully expected that organizations may assemble these document bundles and collections on the fly in response to a request, and that these documents may not be versioned. As a consequence, the `lastUpdated` of a bundle may not correspond to the last clinical change to a result and SHOULD NOT be relied upon as an indicator of clinical currency.