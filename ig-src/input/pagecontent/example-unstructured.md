{% include variable-definitions.md %}

### Renderable format with minimal metadata

This example addresses representing a imaging report that has the minimal amount of the structured data.

The structure of this report is illustrated in the figure below.

<figure>
	{% include example-unstructured.svg %}
	<figcaption>Figure 1: Renderable format with minimal metadata resource structure</figcaption>
</figure>

This example corresponds to the [Renderable format with minimal metadata](data-formats.html#renderable-format-with-minimal-metadata) data format.

The report is represented by a collection Bundle containing a DiagnosticReport and its patient context. The DiagnosticReport references the reporting Organization and the renderable report payload.

Resources used in this example:

- [Bundle](Bundle-bundle-report-minimal-metadata-unstructured.html): collection bundle that groups the core report resources for exchange.
- [DiagnosticReport](DiagnosticReport-DiagnosticReportMinimalMetadata.html): main clinical report resource carrying report metadata and references to study/order as identifiers.
- [Patient](Patient-PatientUnstructuredReport.html): subject of the report.
- [Organization](Organization-OrganizationUnstructuredReport.html): reporting/custodian organization metadata.
- [Binary](Binary-BinaryUnstructuredReport.html): PDF payload referenced from `DiagnosticReport.presentedForm`.

The full report `Bundle` resource is presented below.

{% fragment Bundle/bundle-report-minimal-metadata-unstructured JSON ELIDE:meta|text %}
