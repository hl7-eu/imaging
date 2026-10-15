{% include profile-references.md %}
{% include variable-definitions.md %}

This page illustrates the imaging report specific limitations and extensions required to include imaging reports in the {{EuridiceHealthDataAPI}}.

### Document access

This specification builds on the actors defined in {{EuridiceHealthDataAPI}}. For the main actors, imaging report specific versions are defined.

{% include img.html img="eu-health-data-api-document-actors.drawio.png" caption="Figure 1: Document Actors" %}

The different actors defined in this specification are presented in the figure below (marked in blue).

{% include img.html img="imaging-report-document-actors.drawio.png" caption="Figure 2: Imaging Report Document Actors" %}

The main actors Document Access Provider and Document Consumer are refined in this specification and imaging report specific versions are defined.

In this model each imaging report is represented by a [[[DocumentReferenceImagingReport]]] and a [report Bundle](https://hl7.eu/fhir/imaging-r4/StructureDefinition-BundleReportEuImaging.html) defined by the Imaging Report guide.

{% include img.html img="api-documentreference-bundle.drawio.png" caption="Figure 3: DocumentReference and Bundle" %}

### Resource Access

This specification builds on the actors defined in {{EuridiceHealthDataAPI}}.

{% include img.html img="eu-health-data-api-resource-actors.drawio.png" caption="Figure 4: Resource Actors" %}

Note that resource level access requires that document level access is supported as well.
The different actors defined in this specification are presented in the figure below (marked in blue).

{% include img.html img="imaging-report-resource-actors.drawio.png" caption="Figure 5: Imaging Report Resource Actors" %}

The main actors Resource Access Provider and Resource Consumer are refined in this specification and imaging report specific versions are defined.

### Report Bundle generation

Resource Access Providers that support DiagnosticReport SHOULD support the instance-level [DiagnosticReport/$document](OperationDefinition-DiagnosticReport-fhir-report.html) operation to generate a report Bundle conforming to BundleReportEuImaging.

### Report indexing and versioning

The [report access examples](examples.html) illustrate how R4 DocumentReference wrappers refer to report Bundles and their patient and custodian resources.

| Concept | R4 DocumentReference representation |
| --- | --- |
| Clinically effective time (when the study took place) | `context.period` |
| Document created/assembled | `content.attachment.creation` |
| Document reference created/indexed | `date` |
| Version | `extension[version]` |
| Related document | `relatesTo` |

The report Bundle and its clinical resources carry their own identifiers, timestamps, and version information as defined by the [Imaging Report R4 guide](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/imaging-report.html).

### Capability Statements

The requirements related to each actor are reflected by capability statements that are listed below.

{% sql {
 "query" : "SELECT name AS Name, title AS Title, Type, Description, Web, Url FROM Resources WHERE Type='CapabilityStatement' ORDER BY Name",
 "class" : "lines",
 "columns" : [
 { "name" : "Title" , "type" : "link" , "source" : "Name", "target" : "Web"},
 { "name" : "Name" , "type" : "markdown" , "source" : "Title" },
 { "name" : "Description", "type" : "markdown" , "source" : "Description"}
 ]
}
%}
