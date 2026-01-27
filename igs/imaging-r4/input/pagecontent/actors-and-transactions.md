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
