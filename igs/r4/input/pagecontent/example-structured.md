{% include variable-definitions.md %}

### Structured report

This example addresses representing a imaging report that in the report structure with mostly structured data.

The figure below shows the pdf of the report. The document is annotated to show where what part of the report goes in the FHIR document.

{% include img.html img="example-structured-pdf-1.drawio.png" caption="Figure: Ultrasound report with marked content-page 1" %}

{% include img.html img="example-structured-pdf-2.drawio.png" caption="Figure: Ultrasound report with marked content-page 2" %}

{% include img.html img="example-structured-pdf-3.drawio.png" caption="Figure: Ultrasound report with marked content-page 3" %}

The set of resources related to this example is much larger than the previous one so a uml diagram does not really add value. Instead we will focus on some aspects of the example.

The figure below shows the main structure of the report.

<figure>
  {% include example-structured-base.svg %}
  <figcaption><b>Figure: FHIR objects in the Semi-Structured Report</b></figcaption>
  <p></p>
</figure>

As in the previous example the report consists of a {{ImDiagnoticReport}} and a {{ImComposition}} resource. The study the report is about is represented by an {{ImImagingStudy}} resource. The different resources point to the {{Patient}} and the author. The author is represented by an {{PractitionerRole}}, {{Practitioner}} and {{Organization}} resource. The {{Organization}} is also the custodian of the report.

This report contains structured data in the patient history section. It points to height, weight, heart rate and blood pressure observations for the patient.

<figure>
  {% include example-structured-history.svg %}
  <figcaption><b>Figure: History</b></figcaption>
  <p></p>
</figure>

The finding sections hold the notes indicated in the report and references to observations of the different wall motion index scores of the different segments indicated in the graph on page three of the report. These observation include a reference to a {{DocumentReference}} resource which holds the image itself.

<figure>
  {% include example-structured-findings.svg %}
  <figcaption><b>Figure: Findings</b></figcaption>
  <p></p>
</figure>

The document contains two key images. These are included as {{DocumentReference}} resources.

The figure below illustrates the way the conclusion is represented.

<figure>
  {% include example-structured-conclusion.svg %}
  <figcaption><b>Figure: Conclusion and Recommendations</b></figcaption>
  <p></p>
</figure>

The conclusion of the report is reflected in text in the `DiagnosticReport.conclusion` and `Composition.section.extension[note]`. The suggestion to do the same exam again is represented as a `ServiceRequest` resource with the field `intent` set to `proposal`.
