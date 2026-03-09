{% if isR5 %}
### Linking to Observations that are not results

In FHIR R5, {{DiagnosticReport}} has a [constraint](https://fhir.hl7.org/fhir/diagnosticreport.html#invs) that requires all {{Observations}} that are referred to in a {{Composition}} to be included in the `DiagnosticReport.result` field.

This is an issue in this specification as the report can also refer to older `Observation`s which are included in the *PatientHistory*  section. The constraint 
requires those to be included in the result section which is not correct as they are not results of the procedure.

The work-around adopted in this specification is to link include a {{List}} resources that acts as an indirection between those {{Observation}}s and the {{Composition}} resource.

``` mermaid
classDiagram
    class DiagnosticReportEuImaging {
      result
    }
    class CompositionEuImaging{
      
    }
    class ListCompositionObservationIndirection {
    }
    

    DiagnosticReportEuImaging --> CompositionEuImaging: composition
    DiagnosticReportEuImaging --> Observation: result
    DiagnosticReportEuImaging --> Observation: extension[patientHistory]
    CompositionEuImaging --> DiagnosticReportEuImaging: extension[diagnosticReport-reference]
    CompositionEuImaging --> ListCompositionObservationIndirection: contained

    ListCompositionObservationIndirection --> Observation
    CompositionEuImaging --> Observation: section[result/impression]
```

This also requires all impression results to be present in the result section.

{% endif %}