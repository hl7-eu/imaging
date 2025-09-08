{% include variable-definitions.md %}
The imaging report represents a report made by a radiologist based on an ImagingStudy. The figure below presents an overview of the data that is part of the imaging-report.

In order to keep the diagram readable, not all references are included.

### Overview

```mermaid
classDiagram
  direction LR
  class ImReport{
    <<Bundle>>
  }
  ImReport *-- "1" ImComposition
  ImReport *-- "1" ImDiagnosticReport
  ImReport *-- "1" EuPatient
  ImReport *-- "0..*" ImOrder
  ImReport *-- "0..*" PractitionerRoleEu
  ImReport *-- "0..*" DeviceEu
  ImReport *-- "0..*" OrganizationEu
  ImReport *-- "0..*" ImImagingStudy
  ImReport *-- "0..*" ImProcedure
  ImReport *-- "0..*" ImImagingSelection
  ImReport *-- "0..*" ImFinding
  ImReport *-- "0..*" ImKeyImageDocumentReference
  ImReport *-- "0..*" ImKeyImageImagingSelection
  ImReport *-- "0..*" ConditionEu: section[impression]
  ImReport *-- "0..*" CarePlanEU

  ImDiagnosticReport --> ImComposition: composition
  

  ImComposition --> ImOrder: extension[basedOn]  
  ImComposition --> PractitionerRoleEu: extension[informationRecipient]
  ImComposition --> ImDiagnosticReport: extension[diagnosticreport-reference]
  ImComposition --> PractitionerRoleEu: author[author]
  ImComposition --> DeviceEu: author[authoring-device]
  ImComposition --> PractitionerRoleEu: attester[legalAuthenticator]
  ImComposition --> PractitionerRoleEu: attester[resultValidator]
  ImComposition --> OrganizationEu: custodian
  ImComposition --> EuPatient: subject
  ImComposition --> ImImagingStudy: event[study].detail
  ImComposition --> ImProcedure: event[procedure].detail
  ImComposition --> ImImagingStudy: section[imagingstudy]
  ImComposition --> ImOrder: section[order]
  ImComposition --> ImProcedure: section[procedure]
  ImComposition --> ImImagingStudy: section[comparison]
  ImComposition --> ImImagingSelection: section[comparison]
  ImComposition --> ImFinding: section[findings]
  ImComposition --> ImKeyImageDocumentReference: section[keyImage]
  ImComposition --> ImKeyImageImagingSelection: section[keyImage]
  ImComposition --> ImFinding: section[impression]
  ImComposition --> ConditionEu: section[impression]
  ImComposition --> ImKeyImageDocumentReference: section[keyImage]
  ImComposition --> ImKeyImageImagingSelection: section[keyImage]
  ImComposition --> CarePlanEU: section[recommendation]

```

The report is a FHIR bundle that includes ImComposition and ImDiagnosticReport resources and all resources in the tree of resources that referred to (see [$document operation](https://www.hl7.org/fhir/composition-operation-document.html)).

### Report Profiles

These define obligations on FHIR resources for systems conforming to this implementation guide.

The imaging specific obligations are specified in:

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'Report_Im%' ORDER BY CASE WHEN Name = 'Report_ImReport' THEN 1 ELSE 2 END, Name ASC",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

The common obligations are specified in:

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'Report_Eu%' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

### Data sharing and deduplication 

Record holders within the EHDS ecosystem may share imaging data that originated at other care organizations but is nevertheless held and integrated—fully or partially—into their patients’ clinical records. While the EHDS ecosystem will ensure mechanisms to prevent duplication of information, these are not yet in place. It is expected that the DiagnosticReport.identifier element will serve as the unique identifier for each imaging report, supporting accurate encoding and future deduplication efforts.