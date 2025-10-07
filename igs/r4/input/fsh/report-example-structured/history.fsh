Instance: WeightObservation
InstanceOf: Observation
Title: "Patient weight"
Description: "Patient weight in echo report history section"
Usage: #example
* status = #final
* effectiveDateTime = "2023-06-01"
* code = $loinc#29463-7 "Body weigth"
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* subject =  Reference( PatientStructuredReport )
* valueQuantity
  * value = 80
  * unit = "kg"
  * code = #kg
  * system = "http://unitsofmeasure.org"

Instance: HeightObservation
InstanceOf: Observation
Title: "Patient height"
Description: "Patient height in echo report history section"
Usage: #example
* status = #final
* effectiveDateTime = "2023-06-01"
* code = $loinc#8302-2 "Body heigth"
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* subject =  Reference( PatientStructuredReport )
* valueQuantity
  * value = 180
  * unit = "cm"
  * code = #cm
  * system = "http://unitsofmeasure.org"

Instance: HRObservation
InstanceOf: Observation
Title: "Patient heart rate"
Description: "Patient height in echo report history section"
Usage: #example
* status = #final
* effectiveDateTime = "2023-06-01"
* code = $loinc#8867-4 "Heart rate"
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* subject =  Reference( PatientStructuredReport )
* valueQuantity
  * value = 180
  * unit = "bpm"
  * code = #/min
  * system = "http://unitsofmeasure.org"

Instance: BPObservation
InstanceOf: Observation
Title: "Patient blood pressure"
Description: "Patient blood pressure in echo report history section"
Usage: #example
* status = #final
* effectiveDateTime = "2023-06-01"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* subject =  Reference( PatientStructuredReport )
* component[+]
  * code = $loinc#8480-6 "Systolic blood pressure"
  * valueQuantity
    * value = 60
    * unit = "mm/Hg"
    * code = #mm[Hg]
    * system = "http://unitsofmeasure.org"
* component[+]
  * code = $loinc#8462-4 "Diastolic blood pressure"
  * valueQuantity
    * value = 90
    * unit = "mm/Hg"
    * code = #mm[Hg]
    * system = "http://unitsofmeasure.org"

