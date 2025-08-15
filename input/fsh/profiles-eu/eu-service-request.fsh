Profile: ServiceRequestEu
Parent: ServiceRequest
Title: "ServiceRequest EU"
Description: """This profile defines how to represent ServiceRequests in HL7 FHIR for the purpose of this guide."""

* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference( $EuPatient )

* extension contains $workflow-status-reason-url named status-reason 0..1