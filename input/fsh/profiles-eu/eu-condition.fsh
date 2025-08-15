Profile: ConditionEu
Parent: Condition
Title: "Condition: EU Condition"
Description: "A condition profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* extension contains $artifact-related-artifact-url named relatedArtifact 0..*
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