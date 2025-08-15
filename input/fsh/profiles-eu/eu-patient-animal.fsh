Profile: PatientAnimalEu
Parent: PatientEu
Title: "Patient: EU Animal"
Description: """This profile defines how to represent an Animal as subject of care in FHIR for the purpose of this guide. This is used (among others) to identify the species when a specimen is collected from an animal."""	
* insert SetFmmAndStatusRule( 1, draft )
* extension contains 
  http://hl7.org/fhir/StructureDefinition/patient-animal named patient-animal 1..1 and
  http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender named recordedSexOrGender 0..1
* maritalStatus 0..0