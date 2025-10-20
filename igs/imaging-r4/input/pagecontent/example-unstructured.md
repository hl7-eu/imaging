{% include variable-definitions.md %}

### Unstructured  report

This example addresses representing a imaging report that has the minimal amount of the structured data.

The structure of this report is illustrated in the figure below.

{% include img.html img="example-minimal.drawio.png" caption="Figure: Unstructured Report" %}

The report is represented as a DocumentReference resource following the profile {% include profile-link.html name="UnstructuredDocumentReferenceEuImaging" %}. It refers to a {{Patient}} and to an {{Organization}} resource that represents the custodian of the document.

The full resource is presented below. In this example the {{Patient}} and custodian {{Organization}} resources are included as `contained` resources.

{% fragment DocumentReference/UnstructuredReportExample XML ELIDE:meta|text %}
