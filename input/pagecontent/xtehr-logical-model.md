{% include variable-definitions.md %}

### {{XtEhrImaging}}

The {{XtEhrImaging}} is based on {{ehnImagingGuidelines}} and has defined a logical model for imaging reports and manifests.

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
