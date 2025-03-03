Instance: A-1-1-PatientInformationMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.1 Identification of the patient/subject"
* name = "A.1.1"
* title = "A.1.1 Identification of the patient/subject mapping"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.1 Identification of the patient/subject section and the FHIR profiles."

* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-patient-identification"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-patient-identification"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-patient"
  
  * insert ElementMapping( #name, "A.1.1.1 Family name/surname", #name, "", #equivalent )
  * insert ElementMapping( #givenName, "A.1.1.2 Given name", #name.given, "", #equivalent )
  * insert ElementMapping( #dob, "A.1.1.3 Date of birth", #birthDate, "", #equivalent )
  * insert ElementMapping( #personalIdentifier, "A.1.1.4 Personal identifier", #identifier, "", #equivalent )
  * insert ElementMapping( #gender, "A.1.1.5 Gender", #gender, "adminstrative gender", #source-is-broader-than-target	 )
  * insert ElementMapping( #gender, "A.1.1.5 Gender", #extions[genderIdentity], "physiological gender", #source-is-broader-than-target	 )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #identification, "A.1.1 Identification of the patient/subject", #subject, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #identification, "A.1.1 Identification of the patient/subject", #subject, "", #equivalent )

