{% include variable-definitions.md %}

### Renderable format with minimal metadata

This example addresses representing a imaging report that has the minimal amount of the structured data.

The structure of this report is illustrated in the figure below.

<figure>
	{% include example-unstructured.svg %}
	<figcaption>Figure: Renderable format with minimal metadata resource structure</figcaption>
</figure>

This example corresponds to the [Renderable format with minimal metadata](data-formats.html#renderable-format-with-minimal-metadata) data format.

The report is represented as a DocumentReference resource following the profile {% include profile-link.html name="DocumentReferenceImagingReport" %}. It refers to a {{Patient}} and to an {{Organization}} resource that represents the custodian of the document.

Resources used in this example:

- [DocumentReference](DocumentReference-RenderableFormatWithBasicMetadata.html): wrapper resource used for indexing and retrieval metadata; its `content.attachment.url` points to the report bundle.
- [Bundle](Bundle-bundle-report-minimal-metadata-unstructured.html): collection bundle that groups the core report resources for exchange.
- [DiagnosticReport](DiagnosticReport-DiagnosticReportMinimalMetadata.html): main clinical report resource carrying report metadata and references to study/order as identifiers.
- [Patient](Patient-PatientUnstructuredReport.html): subject of the report.
- [Organization](Organization-OrganizationUnstructuredReport.html): reporting/custodian organization metadata.
- [Binary](Binary-unstructured-pdf.html): PDF payload referenced from `DiagnosticReport.presentedForm`.

The full `DocumentReference` resource is presented below.

{% fragment DocumentReference/RenderableFormatWithBasicMetadata JSON ELIDE:meta|text %}
