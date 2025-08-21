Profile: ConditionEu
Parent: Condition
Title: "Condition: EU Condition"
Description: "A condition profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* extension contains
  $artifact-related-artifact-url named relatedArtifact 0..* and
  $workflow-status-reason-url named status-reason 0..1

* bodySite from http://hl7.org/fhir/ValueSet/body-site (preferred)
* subject only Reference( $EuPatient or Group )
* participant.actor only Reference (
    $EuPractitioner or 
    $EuPractitionerRole or 
    $EuPatient or
    Device or
    RelatedPerson or
    $EuOrganization or
    CareTeam
  )
* participant.extension contains SpecialistContactExtension named specialist-contact 0..1

Extension: SpecialistContactExtension
Title: "Specialist Contact Extension"
Description: "This extension is used to identify a Health Professional who may be specifically related to the problem, as a preferred contact."
* insert SetFmmAndStatusRule( 1, draft )
* ^context[+].type = #element
* ^context[=].expression = "Condition.participant"

* value[x] only Reference( $EuPractitioner or $EuOrganization )