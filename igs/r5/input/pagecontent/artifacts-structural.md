{% include variable-definitions.md %}
This page lists the structural profiles defined in this specification

### Main Resource profiles

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND ( Name LIKE 'ImReport' OR Name LIKE 'ImComposition' OR Name LIKE 'ImDiagnosticReport' OR Name LIKE 'ImKeyImageDocumentReference')",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

### Other Resource profiles

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'Im%' AND Name NOT LIKE 'ImReport' AND NOT Name LIKE 'ImComposition' AND Name NOT LIKE 'ImDiagnosticReport' AND Name NOT LIKE 'ImKeyImageDocumentReference' ORDER BY Name ",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

### Code systems

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='CodeSystem' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

### Value Sets

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='ValueSet' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}



