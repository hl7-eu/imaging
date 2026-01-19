Instance: EEHRxF-EPS-Resource-Consumer-CapabilityStatement
InstanceOf: CapabilityStatement
Title: "EEHRxF EPS Resource Consumer Actor"
Usage: #definition
* description = """
CapabilityStatement for EEHRxF Resource Consumer Actor.

The actor in this profile provides FHIR-based queries for one or more fine-grained data elements (FHIR resources).
"""
* name = "EEHRxF_EPS_Resource_Consumer"
* title = "EEHRxF Resource Consumer Actor"
* status = #active
* experimental = false
* date = "2025-10-31"
* kind = #requirements
//R4* fhirVersion = #4.0.1
* fhirVersion = #5.0.0

* format[+] = #application/fhir+json
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHOULD

* format[+] = #application/fhir+xml
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #MAY

* patchFormat = #application/json-patch+json
* patchFormat.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* patchFormat.extension.valueCode = #MAY

* instantiates[+] = "https://profiles.ihe.net/ITI/PDQm/CapabilityStatement/IHE.PDQm.PatientDemographicsConsumerMatch"
* instantiates[+] = "https://profiles.ihe.net/ITI/PDQm/CapabilityStatement/IHE.PDQm.PatientDemographicsConsumerQuery.html"

* rest
  * mode = #server
  * documentation = "The EEHRxF Resource Provider in this profile responds to FHIR-based queries."
  * security.description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  
  * insert CapabilityStatement-AllergyIntolerance( #SHOULD )
  * insert CapabilityStatement-CarePlan( #SHOULD )
  * insert CapabilityStatement-ClinicalImpression( #SHOULD )
  * insert CapabilityStatement-Composition( #SHOULD )
  * insert CapabilityStatement-Condition( #SHOULD, #MAY )
  * insert CapabilityStatement-Consent( #SHOULD )
  * insert CapabilityStatement-Device( #SHOULD )
  * insert CapabilityStatement-DeviceUseStatement( #SHOULD )
  * insert CapabilityStatement-DiagnosticReport( #SHOULD, #MAY )
  * insert CapabilityStatement-IncludedDocumentReference( #SHOULD )
  * insert CapabilityStatement-Encounter( #SHOULD )
  * insert CapabilityStatement-Flag( #SHOULD )
  * insert CapabilityStatement-Immunization( #SHOULD )
  * insert CapabilityStatement-ImmunizationRecommendation( #SHOULD )
  * insert CapabilityStatement-MedicationRequest( #SHOULD )
  * insert CapabilityStatement-MedicationRequest( #SHOULD )
  * insert CapabilityStatement-Observation( #SHOULD, #MAY, #MAY )
  * insert CapabilityStatement-Organization( #SHOULD )
  // // require basic query, other choices may enhance this
  // * insert CapabilityStatement-Patient-BasicQuery( #SHOULD )
  * insert CapabilityStatement-Practitioner( #SHOULD )
  * insert CapabilityStatement-PractitionerRole( #SHOULD )
  * insert CapabilityStatement-Procedure( #SHOULD )
  * insert CapabilityStatement-RelatedPerson( #SHOULD )

Instance: EEHRxF-EPS-Resource-Provider-CapabilityStatement
InstanceOf: CapabilityStatement
Title: "EEHRxF EPS Resource Provider Actor"
Usage: #definition
* description = """
CapabilityStatement for EEHRxF Resource Provider Actor.

The actor in this profile responds to FHIR-based queries for one or more fine-grained data elements (FHIR resources).
"""
* name = "EEHRxF_EPS_Resource_Provider"
* title = "EEHRxF Resource Provider Actor"
* status = #active
* experimental = false
* date = "2025-10-31"
* kind = #requirements
//R4* fhirVersion = #4.0.1
* fhirVersion = #5.0.0

* format[+] = #application/fhir+json
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL

* format[+] = #application/fhir+xml
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHOULD

* patchFormat = #application/json-patch+json
* patchFormat.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* patchFormat.extension.valueCode = #SHOULD

* rest
  * mode = #server
  * documentation = "The EEHRxF Resource Provider in this profile responds to FHIR-based queries."
  * security.description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  
  * insert CapabilityStatement-AdverseEvents( #SHALL )
  * insert CapabilityStatement-AllergyIntolerance( #SHALL )
  * insert CapabilityStatement-CarePlan( #SHALL )
  // * insert CapabilityStatement-ClinicalImpression( #SHALL )
  * insert CapabilityStatement-Composition( #SHALL )
  * insert CapabilityStatement-Condition( #SHALL, #SHOULD )
  // * insert CapabilityStatement-Consent( #SHALL )
  * insert CapabilityStatement-Device( #SHALL )
  // * insert CapabilityStatement-DeviceUseStatement( #SHALL )
  * insert CapabilityStatement-DiagnosticReport( #SHALL, #SHOULD )
  * insert CapabilityStatement-IncludedDocumentReference( #SHALL )
  * insert CapabilityStatement-Encounter( #SHALL )
  * insert CapabilityStatement-Flag( #SHALL )
  * insert CapabilityStatement-Immunization( #SHALL )
  * insert CapabilityStatement-ImmunizationRecommendation( #SHALL )
  * insert CapabilityStatement-ImagingStudy( #SHALL, #SHOULD )
  * insert CapabilityStatement-ImagingSelection( #SHALL )
  // * insert CapabilityStatement-MedicationRequest( #SHALL )
  * insert CapabilityStatement-Observation( #SHALL, #SHOULD, #MAY )
  * insert CapabilityStatement-Organization( #SHALL )
  // // require basic query, other choices may enhance this
  // * insert CapabilityStatement-Patient-BasicQuery( #SHALL )
  * insert CapabilityStatement-Practitioner( #SHALL )
  * insert CapabilityStatement-PractitionerRole( #SHALL )
  * insert CapabilityStatement-Procedure( #SHALL )
  // * insert CapabilityStatement-RelatedPerson( #SHALL )
  * insert CapabilityStatement-ServiceRequest( #SHALL )
  
