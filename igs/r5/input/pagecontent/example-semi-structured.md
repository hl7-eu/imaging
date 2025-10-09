{% include variable-definitions.md %}

### Semi-structured report

This example addresses representing a imaging report that in the report structure with a mix of structured and unstructured data.

The figure below shows the pdf of the report.

{% include img.html img="example-semi-structured-pdf.drawio.png" caption="Figure: Radiology report with elements marked" %}

The image shows what part of the report link to different elements in the report structure as defined in this specification. The structure of a imaging report as defined in this specification is illustrated in the figure below.

<figure>
  {% include example-semi-structured.svg %}
  <figcaption><b>Figure: FHIR objects in the Semi-Structured Report</b></figcaption>
  <p></p>
</figure>

The figure shows the DiagnosticReport that is the root of the report which refers to the imaging studies (LeftKnee and RightKnee), to the patient and to the author of the report. The resource holds the textual note of the findings in notes and the impression to conclusion.

The DiagnosticReport has a link to the Composition that represents the content in a document format. It holds a section that refers to the imaging studies. The findings sections holds the finding notes and the impression section holds the conclusion.

The imaging study resources shows the different series that are included.