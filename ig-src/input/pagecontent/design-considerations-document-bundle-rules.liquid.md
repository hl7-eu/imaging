### Document Bundle Resource Inclusion Rules (FHIR R5)
{% if isR5 %}
The rules for including resources in a document Bundle follow the [R5 FHIR Documents rules](https://hl7.org/fhir/R5/documents.html) and are as follows:

> The document Bundle SHALL include only the supporting information: any resources that are part of the graph of resources that reference or are referenced from the Composition set, either directly or indirectly (e.g., recursively in a chain).

In practice this rule is bounded, so that assembling a document does not pull in an unbounded data set:

- **Direct references from the `Composition`** (e.g., `subject`, `encounter`, `author`, `attester.party`, `custodian`, `section.author`, `section.focus`, `section.entry`) **SHALL** be included in the Bundle when the document is assembled.
- **Indirect references** (resources reached transitively from those direct references, either directly or through chains of references) **SHOULD** be included.

> **Note:** Indirect references should be included where clinically relevant to the report, not as an unbounded transitive closure.
{% endif %}

{% if isR4 %}
This FHIR R4 guide allows for the pre-adoption of the [R5 FHIR Documents rules](https://hl7.org/fhir/R5/documents.html) for the inclusion of the resources in a document Bundle, that is:

> The document Bundle SHALL include only the supporting information: any resources that are part of the graph of resources that reference or are referenced from the Composition set, either directly or indirectly (e.g., recursively in a chain).

In practice this rule is bounded, so that assembling a document does not pull in an unbounded data set:

- **Direct references from the `Composition`** (e.g., `subject`, `encounter`, `author`, `attester.party`, `custodian`, `section.author`, `section.focus`, `section.entry`) **SHALL** be included in the Bundle when the document is assembled.
- **Indirect references** (resources reached transitively from those direct references, either directly or through chains of references) **SHOULD** be included.

> **Note:** Indirect references should be included where clinically relevant to the report, not as an unbounded transitive closure.
{% endif %}

#### Rationale for this design decision

- There is broad consensus in the HL7 FHIR community for supporting this inclusive approach in R5.
- In R5, the link between the `DiagnosticReport` and the `Composition` is established via a `Reference` from the `DiagnosticReport` to the `Composition`. This design pattern was chosen to facilitate clarity and consistency in resource relationships.
- Adding a reference from the `Composition` to the `DiagnosticReport` would create an undesirable circular reference, so it is avoided in the R5 specification.
- However, this approach is not strictly imposed. Usage contexts that wish to maintain full consistency with previous R4 rules may use the `DiagnosticReportReference` extension to refer to the `DiagnosticReport` from the `Composition`. Adopting this extension will result in a circular reference between `Composition` and `DiagnosticReport`.