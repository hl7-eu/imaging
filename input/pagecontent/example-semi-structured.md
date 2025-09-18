{% include variable-definitions.md %}

### Semi-structured report

This example addresses representing a imaging report that in the report structure with a mix of structured and unstructured data.

The figure below shows the pdf of the report.

{% include img.html img="example-semi-structured-pdf.drawio.png" caption="Figure: Radiology report with elements marked" %}

The image shows what part of the report link to different elements in the report structure as defined in this specification. The structure of a imaging report as defined in this specification is illustrated in the figure below.

<!-- {% include img.html img="example-semi-structured.drawio.png" caption="Figure: Unstructured Report" %} -->

```mermaid
classDiagram
    DiagnosticReport --> Composition: composition
    DiagnosticReport --> PDF: presentedForm
    DiagnosticReport --> Patient: subject
    DiagnosticReport --> LeftKnee: study
    DiagnosticReport --> RightKnee: study
    DiagnosticReport --> Author: resultsInterpreter[author]
    DiagnosticReport --> RadiologyZentrum: performer[organization]
    
    LeftKnee --> Patient: subject
    LeftKnee --> RadiologyZentrum: series.performer
    RightKnee --> Patient: subject
    RightKnee --> RadiologyZentrum: series.performer

    Composition --> Patient: subject
    Composition --> DiagnosticReport: extension[diagnosticreport-reference]
    Composition --> Author: author[author]
    Composition --> RadiologyZentrum: author[organization]
    Composition --> LeftKnee : entry[study].entry
    Composition --> RightKnee: entry[study].entry
    
    Author --> RadiologyZentrum: organization
    Author --> LucasGassenzer: practitioner

    class Author{
        <<PractitionerRole>>
    }
    class RadiologyZentrum{
        <<Organization>>
    }
    class LucasGassenzer {
        <<Practitioner>>
    }

    class Patient{
        * name 
          * family = "Gutefrage"
          * given[+] = Test-Schust
    }
    class LeftKnee {
        <<ImagingStudy>> 
        * series[+] "PD FatSat 3D (1.0mm) sagittal"
        * series[+] "T1 (2.5mm) axial"
        * series[+] "T2 (2.5mm) axial"
        * series[+] "PDW FatSat (2.5mm) axial"
    }
    class RightKnee {
        <<ImagingStudy>> 
        * series[+] "PD FatSat 3D (1.0mm) sagittal"
        * series[+] "T1 (2.5mm) axial"
        * series[+] "T2 (2.5mm) axial"
        * series[+] "PDW FatSat (2.5mm) axial"    }
    class PDF{
        <<Binary>>
    }
    class Composition {
        section[imagingstudy]
        * entry: LeftKnee
        * entry: RightKnee
        section[order]
        section[history]
        section[procedure]
        section[comparison]
        section[findings]
        * note: "..."
        section[findings]
        * note: "..."
        section[impressions]
        * note: "..."
    }

    class DiagnosticReport {
        note[finding] = "..."
        note[finding] = "..."
        conclusion = "..."
    }
```