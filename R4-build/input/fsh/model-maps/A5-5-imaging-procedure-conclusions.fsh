Instance: A-5.5-ConclusionMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.5.5 Conclusion"
Description: """Maps the A.5.5 Results section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.5.5"
* title = "A.5.5 Conclusion"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN A.5.5 Conclusion section and the FHIR profiles. 
The coded conclusions and narrative are mapped directly on `DiagnosticReport`, they are also present in `Composition.section.text`.
In FHIR, these are mapped on `Observation` and `Condition` resources.
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-conclusion"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-conclusion"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-finding" 
  // * insert ElementMapping( #impression,         "A.5.5.1 Impression",             #code, "", #equivalent )
  // * insert ElementMapping( #codedConclusions,   "A.5.5.2 Coded conclusions",      #code, "", #equivalent )
  * insert ElementMapping( #conditionOrFinding, "A.5.5.2.1 Condition or finding", #code, "", #equivalent )
  // * insert ElementMapping( #stagingOrGrading,   "A.5.5.2.2 Staging or grading"	, #code, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-conclusion"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-impression" 
  // * insert ElementMapping( #impression,         "A.5.5.1 Impression",             #tbd, "", #equivalent )
  // * insert ElementMapping( #codedConclusions,   "A.5.5.2 Coded conclusions",      #tbd, "", #equivalent )
  * insert ElementMapping( #conditionOrFinding, "A.5.5.2.1 Condition or finding", #code, "", #equivalent )
  * insert ElementMapping( #stagingOrGrading,   "A.5.5.2.2 Staging or grading"	, #stage, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #impression,         "A.5.5.1 Impression",             #section[impression].text, "The narrative needs to be included in the text.", #equivalent )
  * insert ElementMapping( #codedConclusions,   "A.5.5.2 Coded conclusions",      #section[impression].text, "Are represented by Observations and/or Conditions", #equivalent ) // TODO
  * insert ElementMapping( #conditionOrFinding, "A.5.5.2.1 Condition or finding", #section[impression].entry[finding], "", #equivalent )
  * insert ElementMapping( #stagingOrGrading,   "A.5.5.2.2 Staging or grading"	, #section[impression].entry[impression], "", #equivalent )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-conclusion"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #impression,         "A.5.5.1 Impression",             #conclusion, "", #equivalent )  
  * insert ElementMapping( #codedConclusions,   "A.5.5.2 Coded conclusions",      #conclusionCode, "", #equivalent )
  // * insert ElementMapping( #conditionOrFinding, "A.5.5.2.1 Condition or finding", #tbd, "", #equivalent )
  // * insert ElementMapping( #stagingOrGrading,   "A.5.5.2.2 Staging or grading"	, #tbd, "", #equivalent )
