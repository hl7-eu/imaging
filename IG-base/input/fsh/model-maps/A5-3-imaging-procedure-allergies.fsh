Instance: A-5.3-ImagingProcedureAdverseReactionMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.5.3 Adverse reaction (Adverse reactions manifested during imaging investigation."
Description: """Maps on A.5.2-ImagingProcedureMedication section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.5.3"
* title = "A.5.3 Adverse reaction"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN A.5.3 Adverse reaction section and the FHIR profiles. 
In FHIR, adverse reactions are modelled using the `AdverseEvent` resource.
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-adverse-reaction"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-adverse-reaction"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-adversereaction" 
  * insert ElementMapping( #allergyDescription, "A.5.3.1 Allergy description",     #code.text, "Description of event when not coded.", #equivalent )
  * insert ElementMapping( #allergyDescription, "A.5.3.1 Allergy description",     #note, "Description of event additional information is recorded.", #equivalent )
  * insert ElementMapping( #typeOfPropensity, "A.5.3.2 Type of propensity",        #category, "", #source-is-narrower-than-target )
  * insert ElementMapping( #allergyManifestation, "A.5.3.3 Allergy manifestation", #resultingEffect, "", #equivalent )
  * insert ElementMapping( #severity, "A.5.3.4 Severity",                          #seriousness, "", #source-is-broader-than-target )
  * insert ElementMapping( #criticality, "A.5.3.5 Criticality",                    #extension.ImAdverseEventCriticality, "", #equivalent )
  * insert ElementMapping( #onsetDate, "A.5.3.6 Onset date",                       #occurance[dateTime], "", #equivalent )
  * insert ElementMapping( #certainty, "A.5.3.7 Certainty",                        #suspectEntity.causality.entityRelatedness, "", #source-is-broader-than-target )
  * insert ElementMapping( #agentOrAllergen, "A.5.3.8 Agent or Allergen",          #suspectEntity.instance:medicationAdministered, "When no formal allergy intolerance has been diagnosed.", #source-is-narrower-than-target )
  * insert ElementMapping( #agentOrAllergen, "A.5.3.8 Agent or Allergen",          #contributingFactor[allergy], "", #source-is-broader-than-target )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-adverse-reaction"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-allergic-reaction"  
  // * insert ElementMapping( #allergyDescription, "A.5.3.1 Allergy description",     #code.text, "Description of event when not coded.", #equivalent )
  // * insert ElementMapping( #allergyDescription, "A.5.3.1 Allergy description",     #note, "Description of event additional information is recorded.", #equivalent )
  // * insert ElementMapping( #typeOfPropensity, "A.5.3.2 Type of propensity",        #code, "", #equivalent )
  // * insert ElementMapping( #allergyManifestation, "A.5.3.3 Allergy manifestation", #resultingEffect, "", #equivalent )
  * insert ElementMapping( #criticality, "A.5.3.5 Criticality",                    #criticallity, "", #equivalent )
  * insert ElementMapping( #allergyManifestation, "A.5.3.3 Allergy manifestation", #reaction.manifestation, "", #equivalent )
  * insert ElementMapping( #severity, "A.5.3.4 Severity",                          #reaction.severity, "", #equivalent )
  * insert ElementMapping( #onsetDate, "A.5.3.6 Onset date",                       #reacton.onset, "", #equivalent )  
  * insert ElementMapping( #certainty, "A.5.3.7 Certainty",                        #extension.allergyCertainty, "", #equivalent )
  * insert ElementMapping( #agentOrAllergen, "A.5.3.8 Agent or Allergen",          #reaction.substance, "", #equivalent )
  
// * group[+]
//   * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
//   * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
//   * insert ElementMapping( #adverseReaction, "A.5.3 Adverse reaction", #section.entry[medication], "", #equivalent )

// // * group[+]
// //   * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
// //   * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
// //   * insert ElementMapping( #adverseReaction, "A.5.3 Adverse reaction", #based[ImOrder], "", #equivalent )

