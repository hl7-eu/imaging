Instance: A-5.4-ResultsMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.5.4 Results"
Description: """Maps the A.5.4 Results section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.5.4"
* title = "A.5.4 Results"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN A.5.4 Results section and the FHIR profiles. 
In FHIR, these are mapped on `Observation` resources.
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-results"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-results"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-finding" 
  * insert ElementMapping( #date,              "A.5.4.1 Date",                 #effective[x], "", #equivalent )
  * insert ElementMapping( #resultText,        "A.5.4.2 Result text",          #code.text, "Text description when no code available.", #equivalent )
  * insert ElementMapping( #resultText,        "A.5.4.2 Result text",          #note, "Text description when coding is available.", #equivalent )
  * insert ElementMapping( #observationCode,   "A.5.4.3.1 Observation code",   #code, "", #equivalent )
  * insert ElementMapping( #observationName,   "A.5.4.3.2 Observation name",   #code.coding.display, "", #equivalent )
  * insert ElementMapping( #observationName,   "A.5.4.3.2 Observation name",   #code.text, "", #equivalent )
  * insert ElementMapping( #observationMethod, "A.5.4.3.3 Observation method", #method, "", #equivalent )
  * insert ElementMapping( #observationResult, "A.5.4.3.4 Observation result", #value[x], "", #equivalent )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #results, "A.5.4 Results", #section.entry[findings], "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #results, "A.5.4 Results", #result, "", #equivalent )

