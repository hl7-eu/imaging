Instance: A-5.6-RecommendationsMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.5.6 Recommendation"
Description: """Maps the A.5.6 Results section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.5.6"
* title = "A.5.6 Recommendation"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN A.5.6 Recommendation section and the FHIR profiles. 
The eHN Guideline requires narrative recommendations only.  It also states that in the future it is expected to also contain structured and coded recommendations. In order to support a transition towards a structured and coded format, the mapping is defined to the FHIR `CarePlan` resource. This also prevents akward mappings on the text field of `Composition.section`.
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-recommendation"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-recommendation"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-recommended-careplan" 
  * insert ElementMapping( #description, "A.5.6.1 Description", #description, "", #equivalent )
  * insert ElementMapping( #carePlan, "A.5.6.2 Care plan", #description, "", #equivalent )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-recommendation"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #description, "A.5.6.1 Description", #section[recommendation].entry, "", #equivalent )
  * insert ElementMapping( #carePlan, "A.5.6.2 Care plan", #section[recommendation].entry, "", #equivalent )
  
// * group[+]
//   * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-recommendation"
//   * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
//   * insert ElementMapping( #impression,         "A.5.6.1 Impression",             #conclusion, "", #equivalent )  
//   * insert ElementMapping( #codedConclusions,   "A.5.6.2 Coded conclusions",      #conclusionCode, "", #equivalent )
//   // * insert ElementMapping( #conditionOrFinding, "A.5.6.2.1 Condition or finding", #tbd, "", #equivalent )
//   // * insert ElementMapping( #stagingOrGrading,   "A.5.6.2.2 Staging or grading"	, #tbd, "", #equivalent )
