### Data entrypoints

This IG describes a large set of different resources. Using FHIR search operations, there are many different ways to search for specific information.

The goal of this IG is to provide information on Imaging Reports and Imaging Studies. Although it will allow for other ways to access information, the main "data entrypoints" are the resources that represent these resources.

Each imaging study is represented by a _single_ {% raw %}{{ImagingStudy}}{% endraw %} resource.  
Each imaging report is represented by a {% raw %}{{DiagnosticReport}}{% endraw %} resource. There might be more than one instance of the {% raw %}{{DiagnosticReport}}{% endraw %}, when the status of the report changes. All of these will have the same `identifier`. The {% raw %}{{DiagnosticReport}}{% endraw %} holds the structured representation of the report. The {% raw %}{{Composition}}{% endraw %} represents a rendering of the data in the report. All structured data present in the {% raw %}{{DiagnosticReport}}{% endraw %} SHALL also be present in the {% raw %}{{Composition}}{% endraw %}. This specification suggests a set of sections for the Composition which implementers are RECOMMENDED to follow.
{% if isR5 %}
```mermaid
classDiagram
  class ImagingStudyEuImaging{ 
    <<ImagingStudy>> 
    identifier: studyInstanceUid
  }
  class DiagnosticReportEuImaging{ 
    <<DiagnosticReport>> 
    identifier
  }
  class CompositionEuImaging{ <<Composition>>}
  
  DiagnosticReportEuImaging --> ImagingStudyEuImaging: study
  DiagnosticReportEuImaging --> CompositionEuImaging: composition
  CompositionEuImaging --> DiagnosticReportEuImaging: extension[diagnosticReport-reference]

  note for DiagnosticReportEuImaging "entry point for report"
  note for ImagingStudyEuImaging "entry point for study"
```
{% endif %}

{% if isR4 %}
```mermaid
classDiagram
  class ImagingStudyEuImaging{ 
    <<ImagingStudy>> 
    identifier: studyInstanceUid
  }
  class DiagnosticReportEuImaging{ 
    <<DiagnosticReport>> 
    identifier
  }
  class CompositionEuImaging{ <<Composition>>}
  
  DiagnosticReportEuImaging --> ImagingStudyEuImaging: imagingStudy
  DiagnosticReportEuImaging --> CompositionEuImaging: extension[composition]
  CompositionEuImaging --> DiagnosticReportEuImaging: extension[diagnosticReport-reference]

  note for DiagnosticReportEuImaging "entry point for report"
  note for ImagingStudyEuImaging "entry point for study"
```
{% endif %}
When modelling the IG, it is assumed that information related to the report will be gathered by starting at the {% raw %}{{DiagnosticReport}}{% endraw %} and information related to the imaging study from the {% raw %}{{ImagingStudy}}{% endraw %}.

All information related to the report will referred to from the {% raw %}{{Composition}}{% endraw %}. All important structured information used for searching will be referred to from the {% raw %}{{DiagnosticReport}}{% endraw %}. The structure of the {% raw %}{{Composition}}{% endraw %} is subject to change and less formal on the meaning on referred to resources. When possible, such references will be made from the {% raw %}{{DiagnosticReport}}{% endraw %}.
