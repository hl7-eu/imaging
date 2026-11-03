Instance: PatientGestationalAgeExample
InstanceOf: $EuPatient
Title: "Patient: gestational age examples"
Description: "Patient used in the gestational age Observation examples."
Usage: #example
* name
  * use = #official
  * family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
  * family.extension[=].valueString = "de"
  * family = "Boer"
  * given = "Madelief"
* gender = #female
* birthDate = "1996-04-29"

Instance: ObservationGestationalAgeWeeksExample
InstanceOf: ObservationGestationalAgeEuImaging
Title: "Observation: gestational age in weeks"
Description: "Gestational age expressed in completed weeks."
Usage: #example
* status = #final
* effectiveDateTime = "2026-11-03"
* code = $loinc#11884-4 "Gestational age Estimated"
* subject = Reference(PatientGestationalAgeExample)
* valueQuantity
  * value = 20
  * unit = "week"
  * system = "http://unitsofmeasure.org"
  * code = #wk

Instance: ObservationGestationalAgeDaysExample
InstanceOf: ObservationGestationalAgeEuImaging
Title: "Observation: gestational age in days"
Description: "Gestational age expressed in days."
Usage: #example
* status = #final
* effectiveDateTime = "2026-11-03"
* code = $loinc#11884-4 "Gestational age Estimated"
* subject = Reference(PatientGestationalAgeExample)
* valueQuantity
  * value = 140
  * unit = "day"
  * system = "http://unitsofmeasure.org"
  * code = #d
