## Use cases based on Data Formats
The EHDS Imaging Report specification supports the use of different data formats for the representation of imaging reports, that introduce increasing level of structure to the data exchanged.

### Renderable format with basic metadata
Comprised of a `Bundle` of type collection containing a `DiagnosticReport` with a reference to a PDF (or other renderable format) attachment through .presentedForm, the `ImagingStudy` resource(s) that is the object of the report, the `ServiceRequest` that represented the original order for the study, and the `Patient` to whom the report belongs. Other resources are also allowed to encode additional elements of the report environment, as specified by this IG. Optionally, if the only available information about the study and the order are their identifiers, those can be encoded as `DiagnosticReport.study.identifier` and `DiagnosticReport.basedOn.identifier`, without having to include `ImagingStudy` and `ServiceRequest` resources in the `Bundle`. 

A `DocumentReference` resource wrapper pointing to the `Bundle` is used to encode the elements used as search parameters to fulfill functional requirements of the ACCESSOR actor.

Note that no `Composition` resource is used in this case, and the `DiagnosticReport` is used as the main resource to represent the report.

This level of structure allows for a human-readable report (the PDF) that can fulfill the requirements of the DISPLAYER actor, while also having some basic metadata about the report and its connection with the imaging study and service request.

An example of this type of report format can be found [here](example-unstructured.html).

```mermaid
classDiagram
    class DocumentReference {
        +subject : Reference~Patient~
        +date : dateTime
        +type : CodeableConcept
        +category : CodeableConcept
        +content: Bundle
        ...
    }
    
    class Bundle {
        <<type: collection>>

    }
    
    class DiagnosticReport {
        <<main resource>>
        +presentedForm : Attachment~PDF~
        +imagingStudy : Reference~ImagingStudy~
        +basedOn : Reference~ServiceRequest~
        ...
    }
    
    class ImagingStudy {
        <<optional in Bundle>>
        +identifier : StudyInstanceUidIdentifierEuImaging
        ...
    }
    
    class ServiceRequest {
        <<optional in Bundle>>
        +identifier : AccessionNumberIdentifierEuImaging
        ...
    }
    
    class PDF {
        <<attachment>>
        +contentType : "application/pdf"
        +data : base64Binary
    }

    DocumentReference --> Bundle : content
    Bundle --> DiagnosticReport : entry
    Bundle --> ImagingStudy : entry (optional)
    Bundle --> ServiceRequest : entry (optional)
    DiagnosticReport --> PDF : presentedForm
    DiagnosticReport --> ImagingStudy : imagingStudy
    DiagnosticReport --> ServiceRequest : basedOn
```

### Section-structured report with processable narrative
Building on top of the previous data format, the `DiagnosticReport` is exchanged alongside a `Composition` as entries of a `Bundle` of type `document`. Both `DiagnosticReport` and `Composition` encode the same information, but the `Composition` can be used for display purposes, especially the narrative sections of the report, while the `DiagnosticReport` can be used for the interpretation of the structured data. The `DocumentReference` resource wrapper, as in the previous case, serves as an interface layer to surface search parameters that allow finding and retrieving the report.

In this case, the PDF loses relevance, as the narrative of the `Composition` can adapt dynamically to different display contexts. However, the PDF can still be included as an attachment in the `DiagnosticReport` for archival purposes, or for use cases where a human-readable report is needed without the requirement for structured data. Creators of this type of report must ensure tight consistency between the narrative of the `Composition` and the PDF, as they are both intended for display purposes.

This data structure is the one that should be utilized to map existing implementations that use HL7 V2 messages or DICOM SR containing a CDA or other XML or HTML file as the report content.

This level of structure allows the PROCESSOR actor to interpret the structured data and the narrative (as it is exchanged in a machine-readable format).

An example of this type of report format can be found [here](example-section-structured.html).

```mermaid
classDiagram
    class DocumentReference {
        +subject : Reference~Patient~
        +date : dateTime
        +type : CodeableConcept
        +category : CodeableConcept
        +content : Bundle
        ...
    }
    
    class Bundle {
        <<type: document>>
    }
    
    class Composition {
        <<first entry - for display purposes>>
        +section : BackboneElement[]
        +section.text : Narrative
        ...
    }
    
    class DiagnosticReport {
        <<for structured data>>
        +presentedForm : Attachment~PDF~ (optional)
        ...
    }
    
    class ImagingStudy {
        ...
    }
    
    class ServiceRequest {
        ...
    }
    
    class Observation {
        <<findings / measurements>>
        ...
    }
    
    class PDF {
        <<optional attachment>>

    }

    DocumentReference --> Bundle : content
    Bundle --> Composition : entry[0]
    Bundle --> DiagnosticReport : entry
    Bundle --> ImagingStudy : entry
    Bundle --> ServiceRequest : entry
    Bundle --> Observation : entry
    DiagnosticReport --> ImagingStudy : imagingStudy
    DiagnosticReport --> ServiceRequest : basedOn
    DiagnosticReport --> Observation : result
    DiagnosticReport --> PDF : presentedForm (optional)
    DiagnosticReport --> Composition : composition
``` 

### Fully structured report
This case utilizes the data structures of the previous case and adds a fully coded (ideally with standard clinical or radiology domain terminology) representation of the report's findings and impressions, encoded in FHIR `Observation` and `Condition` resources.

This format allows for a fully computable report that can be easily integrated with other data sources and used for advanced use cases such as clinical decision support, research, etc. The `Composition` resource is still used for display purposes, but the narrative of the sections can be generated dynamically based on the coded data, and the PDF loses relevance in this case.

It is expected that most systems will not be able to produce this level of structure in the short term, but it is important to have it as a long-term goal, as it allows full leverage of the FHIR format's potential for imaging reports.
