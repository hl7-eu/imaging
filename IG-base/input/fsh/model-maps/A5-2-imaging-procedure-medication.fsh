Instance: A-5.2-ImagingProcedureMedicationMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.5.2 Imaging Procedure Medication"
Description: """Maps on A.5.2-ImagingProcedureMedication section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.5.2"
* title = "A.5.2 Imaging Procedure Medication"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the eHN A.5.2-ImagingProcedureMedication section and the FHIR profiles. 
The medication information is mapped on the FHIR `Medication` resource. The use of the medication is modelled using MedicationDispense.
Links to these resource are added to the composition resource.
"
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-medication"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-medication"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-medication" 
  * insert ElementMapping( #brandName, "A.5.2.1 Brand name", #extension[productName], "", #equivalent )
  * insert ElementMapping( #code, "A.5.2.2 Code", #code, "", #equivalent )
  * insert ElementMapping( #activeIngredientList, "A.5.2.3 Active ingredient list", #ingredient, "", #equivalent )
  * insert ElementMapping( #strength, "A.5.2.4 Strength", #ingredient.strength, "", #equivalent )
  * insert ElementMapping( #pharmaceuticalDoseForm, "A.5.2.5 Pharmaceutical dose form", #doseForm, "", #equivalent )
  // * insert ElementMapping( #routeOfAdministration, "A.5.2.6 Route of administration", #tbd, "", #equivalent )
  // * insert ElementMapping( #dateTime, "A.5.2.7 Date and time", #tbd, "", #equivalent )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-medication"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-medication-administration" 
  // * insert ElementMapping( #brandName, "A.5.2.1 Brand name", #extension[productName], "", #equivalent )
  // * insert ElementMapping( #code, "A.5.2.2 Code", #code, "", #equivalent )
  // * insert ElementMapping( #activeIngredientList, "A.5.2.3 Active ingredient list", #ingredient, "", #equivalent )
  // * insert ElementMapping( #strength, "A.5.2.4 Strength", #ingredient.strength, "", #equivalent )
  // * insert ElementMapping( #pharmaceuticalDoseForm, "A.5.2.5 Pharmaceutical dose form", #doseForm, "", #equivalent )
  * insert ElementMapping( #routeOfAdministration, "A.5.2.6 Route of administration", #dosage.route, "", #equivalent )
  * insert ElementMapping( #dateTime, "A.5.2.7 Date and time", #occurance, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #medication, "A.5.2 Imaging Procedure Medication", #section.entry[medication], "", #equivalent )

// * group[+]
//   * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
//   * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
//   * insert ElementMapping( #medication, "A.5.2 Imaging Procedure Medication", #based[ImOrder], "", #equivalent )

