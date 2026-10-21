### Report access examples

Each example uses a [[[DocumentReferenceImagingReport]]] to index a report Bundle defined in the [Imaging Report R4 guide](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/). The wrapper supplies search and retrieval metadata; the Bundle, patient, organization, and clinical resources remain owned by the report-content guide.

| Format | API wrapper | R4 report content |
| --- | --- | --- |
| Renderable report with minimal metadata | [RenderableFormatWithBasicMetadata](DocumentReference-RenderableFormatWithBasicMetadata.html) | [Unstructured report](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/example-unstructured.html) |
| Semi-structured report | [DocumentReferenceSemiStructured](DocumentReference-DocumentReferenceSemiStructured.html) | [Semi-structured report](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/example-semi-structured.html) |
| Structured report | [DocumentReferenceStructuredReport](DocumentReference-DocumentReferenceStructuredReport.html) | [Structured report](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/example-structured.html) |

The wrapper's `subject` and `custodian` identify the patient and organization in the report-content examples. Its `content.attachment.url` identifies the report Bundle, and `content.extension[profile].valueCanonical` declares that Bundle's profile. The unstructured example uses `BundleReportMinimalMetadataEuImaging`; the semi-structured and structured examples use `BundleReportEuImaging`.

For a renderable report with minimal metadata, the collection Bundle groups a DiagnosticReport and its context resources. The DiagnosticReport references a PDF or another renderable attachment through `presentedForm`. For section-structured and fully structured reports, the document Bundle also contains a Composition. In each case the API DocumentReference supplies the indexing and retrieval layer without changing the report-content model.

### Unstructured report wrapper

{% fragment DocumentReference/RenderableFormatWithBasicMetadata JSON ELIDE:meta|text %}

### Semi-structured report wrapper

{% fragment DocumentReference/DocumentReferenceSemiStructured JSON ELIDE:meta|text %}

### Structured report wrapper

{% fragment DocumentReference/DocumentReferenceStructuredReport JSON ELIDE:meta|text %}
