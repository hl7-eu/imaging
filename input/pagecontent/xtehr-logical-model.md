{% include variable-definitions.md %}

### {{XtEhrImaging}} logical model

The {{XtEhrImaging}} is based on {{ehnImagingGuidelines}} and has defined a logical model for imaging reports and manifests.

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>This specification uses a snapshot of the EHDS model. Future versions of this specification will replace these files with a reference to a model release.
   </p>
 </blockquote>
</div>

The following logical models where used to generate this overview and the mapping using in this IG:

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'EHDS%' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}
