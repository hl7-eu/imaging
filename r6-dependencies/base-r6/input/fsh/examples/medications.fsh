// SINGLE LINE PRESCRIPTIONS - only one medication per prescription.
Instance: 400C-prescription-cefuroxime-singleline
InstanceOf: MedicationRequestEuCore
Usage: #example
Title: "MedicationRequest Example"
Description: """Example of a MedicationRequest conforming to the MedicationRequest (EU Core) profile. 
It is a prescription/request with one medication and changing dosaging. Uses 'actionable' tag. Cefuroxime sodium."""
* meta.tag = $common-tags#actionable
* identifier.value = "10-123EP"  // prescription line identifier if exists
* status = #active
* intent = #order
* authoredOn = "2024-12-06"
* requester.display = "The Best Doctor"
* medication.reference = Reference(01A-Cefuroxime1500GenericExplicit)
* reason.concept = $sct#10625071000119104 "Bronchopneumonia caused by bacteria (disorder)"
* subject = Reference(PatientExample)
* dosageInstruction[0]
  * sequence = 1
  * doseAndRate.doseQuantity = 1500 $ucum#mg "milligram(s)"
  * route = $sct#78421000 "Intramuscular route"
  * timing
    * repeat.frequency = 1
    * repeat.period = 8
    * repeat.periodUnit = $ucum#h "hour(s)"
    * repeat.boundsDuration = 3 $ucum#d "day"
* dosageInstruction[+]
  * sequence = 2
  * doseAndRate.doseRange.low = 750 $ucum#mg "milligram(s)"
  * doseAndRate.doseRange.high = 1500 $ucum#mg "milligram(s)"
  * route = $sct#78421000 "Intramuscular route"
  * timing
    * repeat.frequency = 1
    * repeat.period = 8
    * repeat.periodUnit = $ucum#h "hour(s)"
    * repeat.boundsDuration = 4 $ucum#d "day"
Instance: 01A-Cefuroxime1500GenericExplicit
InstanceOf: MedicationEuCore
Usage: #example
Title: "Medication Example"
Description: """Example of a Medication conforming to the Medication (EU Core) profile. It represents  Cefuroxime 1500mg (1.5g) powder for solution in a vial."""
* doseForm = $edqm#50053000 "Powder for solution for injection or infusion"
* ingredient.item.concept = $sct#372833007 "Cefuroxime"
* ingredient.strengthRatio.numerator = 1500 $ucum#mg "milligram"
* ingredient.strengthRatio.denominator = 1 $edqm#15060000 "Vial"
* extension[classification].valueCodeableConcept = $atc#J01DC02 "cefuroxime"
* ingredient.isActive = true
Instance: example-medicationstatement-eucore
InstanceOf: MedicationStatementEuCore
Title: "MedicationStatement Example"
Description: """Example of a MedicationStatement conforming to the MedicationStatement (EU Core) profile. It describes a patient taking Enalapril."""
* subject = Reference(PatientExample)
* subject.display = "John Doe"
* medication.concept = $atc#C09AA02 "Enalapril"
* medication.concept.text = "Enalapril 20mg tablets"
* status = #recorded 
* effectiveDateTime = "2024-12-01"
* dateAsserted = "2024-12-01"
* informationSource = Reference(PatientExample)
* informationSource.display = "Luigi De Luca"
* dosage[0].text = "Take one tablet daily in the morning"
* dosage[0].timing.repeat.frequency = 1
* dosage[0].timing.repeat.period = 1
* dosage[0].timing.repeat.periodUnit = #d
* dosage[0].route.coding[0].system = "http://snomed.info/sct"
* dosage[0].route.coding[0].code = #26643006
* dosage[0].route.coding[0].display = "Oral route"
* dosage[0].doseAndRate[0].doseQuantity.value = 20
* dosage[0].doseAndRate[0].doseQuantity.unit = "mg"
* dosage[0].doseAndRate[0].doseQuantity.system = "http://unitsofmeasure.org"
* dosage[0].doseAndRate[0].doseQuantity.code = #mg
* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><strong>Medication:</strong> Enalapril 20mg tablets</p>
  <p><strong>Patient:</strong> Fiona XXX_Swart</p>
  <p><strong>Status:</strong> Active</p>
  <p><strong>Dosage:</strong> Take one tablet daily in the morning (oral route)</p>
  <p><strong>Informant:</strong> Dr. Lukas Müller</p>
  <p><strong>Date Asserted:</strong> 2024-12-01</p>
</div>
"""
