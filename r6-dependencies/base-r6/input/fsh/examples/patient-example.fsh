Instance: PatientExample
InstanceOf: PatientEuCore
Title: "Patient Example"
Description: "Example of a Patient resource conforming to the Patient (EU Core) profile."
* id = "patient-eu-core-example"
* name.family = "Doe"
* name.given = "John"
* gender = #male
* birthDate = "1980-01-01"
* address.line = "123 Example Street"
* address.city = "Example City"
* address.state = "EX"
* address.postalCode = "12345"
* address.country = "EX"
* telecom.system = #phone
* telecom.value = "555-1234"
* telecom.use = #home
* managingOrganization = Reference(OrganizationExample)