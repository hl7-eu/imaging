Instance: A-7-ComparisonStudy
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.7 Comparison Study"
Description: """Maps the A.7 Key Images section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.7"
* title = "A.7 Comparison Study"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN A.7 Comparison Study section and the FHIR profiles. \n
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-comparison-study"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-comparison-study"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #comparisonStudyDocumentation, "A.7.1 Comparison Study Documentation", #section[comparison].entry, "", #equivalent )
  
// * group[+]
//  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
//   * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
