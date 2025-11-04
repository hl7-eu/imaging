{% include variable-definitions.md %}

The actors defined in this specification are: 

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web, Url FROM Resources WHERE Type='ActorDefinition' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
}
%}


Actors:

| Actor | Description |
|=======|=============|
| Imaging Report Producer  | Produces imaging reports. This includes creation and amending. |
| Imaging Report Displayer | Displays an imaging report, this role is often combined with a Producer. |
| Imaging Report Processor | Inspects Imaging Reports and extracts useful information. This role is typically implemented by systems that do not display or edit the report but inspect to retrieve valuable information. Examples of such actors include gateways, AI engines, ... |
