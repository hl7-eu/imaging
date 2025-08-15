Profile: EndpointEu
Parent: Endpoint
Title: "Endpoint: EU Endpoint"
Description: """
The FHIR endpoint resource with EU specific references.
"""
* insert SetFmmAndStatusRule( 1, "draft" )
* managingOrganization only Reference( $EuOrganization )
