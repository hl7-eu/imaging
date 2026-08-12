//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: EhicExampleIt
InstanceOf: CoverageEhic
Title: "EHIC – Italy"
Description: "Example of an Italian European Health Insurance Card (Tessera TEAM)."
* contained = PatientEhicInline
* identifier.system = "http://example.org/ehic"
* identifier.value = "80380000900090510553"
* status = 	#active
* type = EuV3ActCode#ehic "European Health Insurance Card"
* beneficiary = Reference(PatientEhicInline)
* period.end = 2022-01-19
* kind = http://hl7.org/fhir/coverage-kind#other
// * insurer = Reference(Organization/example-rt)
* insurer.display = "SSN-MIN SALUTE - 500001"
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PatientEhicInline
InstanceOf: PatientEhic
Usage: #inline
* identifier.system = "http://hl7.it/sid/codiceFiscale"
* identifier.value = "RSSMRA70A01F205V"
* name.family = "Rossi"
* name.given = "Mario"
* birthDate = "1970-01-01"
