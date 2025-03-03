Instance: A-8-PresentedFormMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.8 Presented Form"
Description: """Maps the A.8 Presented Form section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.8"
* title = "A.8 Comparison Study"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN A.8 Comparison Study section and the FHIR profiles. \n
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-presented-form"

// * group[+]
//   * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-comparison-study"
//   * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
//   * insert ElementMapping( #comparisonStudyDocumentation, "A.8.1 Comparison Study Documentation", #section[comparison].entry, "", #equivalent )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-presented-form"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #presentedForm, "A.8 Presented Form", #presentedForm, "", #equivalent )
