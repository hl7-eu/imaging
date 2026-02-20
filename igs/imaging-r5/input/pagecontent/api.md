{% include profile-references.md %}
{% include variable-definitions.md %}

This page illustrates the imaging report specific limitations and extensions required to include imaging reports in the {{EuridiceHealthDataAPI}}.
{% if site.data.fhir.version == "5.0.0" %}
<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>The {{EuridiceHealthDataAPI}} specification currently only supports FHIR R4. In this specification the R5 equivalents are presented in line with
this choices in this specification. These artifacts will have to be updated when the {{EuridiceHealthDataAPI}} has an R5 equivalent. 
</p>
 </blockquote>
</div>
{% endif %}

### Document access

This specification builds on the actors defined in {{EuridiceHealthDataAPI}}. For the main actors, imaging report specific versions are defined.

{% include img.html img="eu-health-data-api-document-actors.drawio.png" caption="Figure: Document Actors" %}

The different actors defined in this specification are presented in the figure below (marked in blue).

{% include img.html img="imaging-report-document-actors.drawio.png" caption="Figure: Imaging Report Document Actors" %}

The main actors Document Access Provider and Document Consumer are refined in this specification and imaging report specific versions are defined.

In this model each imaging report is represented by a {{DocumentReferenceImagingReport}} and a {{BundleReportEuImaging}}.

{% include img.html img="api-documentreference-bundle.drawio.png" caption="Figure: DocumentReference and Bundle" %}

### Resource Access

This specification builds on the actors defined in {{EuridiceHealthDataAPI}}.

{% include img.html img="eu-health-data-api-resource-actors.drawio.png" caption="Figure: Resource Actors" %}

Note that resource level access requires that document level access is supported as well.
The different actors defined in this specification are presented in the figure below (marked in blue).

{% include img.html img="imaging-report-resource-actors.drawio.png" caption="Figure: Imaging Report Resource Actors" %}

The main actors Resource Access Provider and Resource Consumer are refined in this specification and imaging report specific versions are defined.

### Capability Statements

The requirements related to each actor are reflected by capability statements that are listed below.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web, Url FROM Resources WHERE Type='CapabilityStatement' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
}
%}

