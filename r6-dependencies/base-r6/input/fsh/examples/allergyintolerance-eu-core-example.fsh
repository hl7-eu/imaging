Instance: AllergyIntoleranceEuCoreExample
InstanceOf: AllergyIntoleranceEuCore
Title: "AllergyIntolerance Example"
Description: "Example of an AllergyIntolerance resource conforming to the AllergyIntolerance (EU Core) profile."
* id = "allergyintolerance-eu-core-example"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed "Confirmed"
* type = $allergy-intolerance-type#allergy
* category = #food
* criticality = #low
* code = $sct#91935009 "Allergy to peanuts"
* patient = Reference(PatientExample)
* onsetDateTime = "2012-05-01"
* onsetDateTime.extension[PeriodsOfLife].valueCodeableConcept = $sct#255398004 "Childhood"
* reaction[0].manifestation[0] = $sct#271807003 "Eruption of skin"
* reaction[0].severity = #mild
