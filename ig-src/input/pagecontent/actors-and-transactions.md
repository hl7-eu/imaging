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

### Actors

* **Imaging-Report Content Creator**: creates and updates Imaging Report and publishes them in the format defined in this specification.
* **Imaging-Report Content Displayer**: displays an imaging report to the user.
* **Imaging-Report Content Processor**: accesses and processes the content of an imaging Report without changing it.

### Use cases

#### Display exisitng imaging reports for clinical analyses

This is a core A clinician has retrieved a copy of an Imaging Report and displays it for analysis. The viewer renders the ....
Summary
Show rendered document/source document
If available delve into details of the study.

#### Analyze imaging reports

#### Display exisitng imaging reports for clinical analyses



### Security considerations