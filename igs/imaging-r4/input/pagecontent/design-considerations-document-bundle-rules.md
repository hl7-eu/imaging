### Document Bundle Resource Inclusion Rules (FHIR R5)



This FHIR R4 guide allows for the pre-adoption of the R5 rules for the inclusion of the resources in a document Bundle, that is:

> The document Bundle SHALL include only the supporting information: any resources that are part of the graph of resources that reference or are referenced from the Composition set, either directly or indirectly (e.g., recursively in a chain).

In opposition to the R4 rules requiring that, with the exception of the Provenance resource and the Binary including the stylesheet, only resources directly or indirectly - referred from the composition can be included.

This means that all resources which are part of the reference graph—whether they reference the Composition or are referenced by it, directly or through chains of references—should be included in the Bundle. This approach ensures that all relevant clinical context and supporting data are present for the document consumer.


#### Rationale for this design decision

- There is broad consensus in the HL7 FHIR community for supporting this inclusive approach in R5.
- In R5, the link between the `DiagnosticReport` and the `Composition` is established via a `Reference` from the `DiagnosticReport` to the `Composition`. This design pattern was chosen to facilitate clarity and consistency in resource relationships.
- Adding a reference from the `Composition` to the `DiagnosticReport` would create an undesirable circular reference, so it is avoided in the R5 specification.
- However, this approach is not strictly imposed. Usage contexts that wish to maintain full consistency with previous R4 rules may use the `DiagnosticReportReference` extension to refer to the `DiagnosticReport` from the `Composition`. Adopting this extension will result in a circular reference between `Composition` and `DiagnosticReport`.
