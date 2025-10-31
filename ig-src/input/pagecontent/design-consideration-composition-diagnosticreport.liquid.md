### FHIR representation of the report

This guide is part of the HL7 EU suite of report related implementation guides that also includes {% raw %}{{hl7EuLabs}}{% endraw %}, {% raw %}{{hl7EuHdr}}{% endraw %} and {% raw %}{{hl7EuEps}}{% endraw %}.
{% if isR5 %}
This implementation guide follows the approach taken by those specifications in that a Imaging Report is:
* represented by one `DiagnosticReport` and and `Composition` resource.
* the `DiagnosticReport` will always point to a  `Composition`.
* the `Composition` can point to the `DiagnosticReport` through a dedicated extension, though this pattern is discouraged.
* the referred Composition:
  * defines the report structure, often just a single section;
  * provides a mean for assembling the report as a document (i.e. as a Bundle of type 'document')
* the document Bundle represents the legally signable report and it includes all the data defining the report.

``` mermaid
classDiagram
    class DiagnosticReportEuImaging
    class CompositionEuImaging
    DiagnosticReportEuImaging --> CompositionEuImaging: composition
    CompositionEuImaging --> DiagnosticReportEuImaging: extension[diagnosticReport-reference]
```
{% endif %}

{% if isR4 %}
This implementation guide follows the approach taken by those specifications in that a Imaging Report is:
* represented by one `DiagnosticReport` and and `Composition` resource.
* the `DiagnosticReport` will always point to a  `Composition` through a dedicated extension.
* the `Composition` can point to the `DiagnosticReport` through a dedicated extension, though this pattern is discouraged.
* the referred Composition:
  * defines the report structure, often just a single section;
  * provides a mean for assembling the report as a document (i.e. as a Bundle of type 'document')
* the document Bundle represents the legally signable report and it includes all the data defining the report.

``` mermaid
classDiagram
    class DiagnosticReportEuImaging
    class CompositionEuImaging
    DiagnosticReportEuImaging --> CompositionEuImaging: extension[composition]
    CompositionEuImaging --> DiagnosticReportEuImaging: extension[diagnosticReport-reference]
```
{% endif %}