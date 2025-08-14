Profile: CarePlanEu
Parent: CarePlan
Title: "CarePlan: EU CarePlan"
Description: "Care plan for the patient. 
Contains the narrative containing the plan including proposals, goals, and order requests for monitoring, tracking, or improving the condition of the patient. In the future it is expected that the care plan could be provided in a structured and coded format."
* insert SetFmmAndStatusRule( 1, draft )
* title
  * extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named xthml 0..1
* description
  * extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named xthml 0..1

* subject only Reference ( $EuPatient or Group )

* custodian only Reference (
    $EuPractitionerRole or 
    $EuPatient or
    Device or
    RelatedPerson or
    $EuOrganization or
    CareTeam
  )
* contributor only Reference (
    $EuPractitionerRole or 
    $EuPatient or
    Device or
    RelatedPerson or
    $EuOrganization or
    CareTeam
  )
