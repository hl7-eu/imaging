Profile: ImCoverage
Parent: Coverage
Id: im-coverage
Title: "Coverage information"
Description: "Health Insurance and Payment Information. This resource represents the insurance coverage for a patient."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* identifier 0..* MS
  * ^definition = """ 
    Insurance policy number registered at the provider. Note in some area's this may serve as Patient ID. 
    """
  * insert SetPopulateIfKnown
// TODO -> do we need to specify the identifier type?
* status 1..1 MS

* kind 1..1 MS
* kind = #insurance

* beneficiary 1..1 MS
* beneficiary only Reference(ImPatient)

* period 0..1 MS

* insurer 0..1 MS
  * insert SetPopulateIfKnown
* insurer only Reference(ImHealthInsuranceProvider)



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: ImHealthInsuranceProvider
Parent: http://hl7.eu/fhir/base/StructureDefinition/organization-eu
Id: im-health-insurance-provider
Title: "Health Insurance Provider"
Description: """
    Health Insurance Provider profile for healthcare organizations, this resource contains all information
    related to a health insurance provider.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* identifier 0..* MS
  * ^definition = """ 
    Unique code for the health insurance company.
    """
  * insert SetPopulateIfKnown
// TODO -> do we need to specify the identifier type?
* active 1..1 MS
* name 0..1 MS
  * ^definition = """ 
    Official name of the health insurance provider.
    """
  * insert SetPopulateIfKnown

