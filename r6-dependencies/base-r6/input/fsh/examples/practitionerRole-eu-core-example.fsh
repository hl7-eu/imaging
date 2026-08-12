Instance: PractitionerRoleEuCoreExample
InstanceOf: PractitionerRoleEuCore
Title: "PractitionerRole Example"
Description: "Example of a PractitionerRole resource conforming to the PractitionerRole (EU Core) profile."
* id = "practitionerRole-eu-core-example"
* practitioner = Reference(PractitionerEuCoreExample)
* organization = Reference(OrganizationExample)
* code = http://snomed.info/sct#394814009 "General practice (specialty)"
* specialty = http://snomed.info/sct#408443003 "General medical practice"
* active = true
