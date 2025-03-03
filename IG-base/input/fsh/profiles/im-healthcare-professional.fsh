Profile: ImInformationRecipient
Parent: ImPractitionerRole
Id: im-information-recipient
Title: "Information Recipient"
Description: """
    Information recipient (intended recipient or recipients of the report, e.g., GP, another specialist).
"""
* practitioner 1..1

Profile: ImAuthor
Parent: ImPractitionerRole
Id: im-author
Title: "Report Author"
Description: """
     Author (by whom the imaging report or a subset of its results was authored). Multiple authors could be provided.
"""
* practitioner 1..1


Profile: ImLegalAuthenticator
Parent: ImPractitionerRole
Id: im-legal-authenticator
Title: "Legal Authenticator"
Description: """
    Legal authenticator (The person taking responsibility for the medical content of the document). 
"""
// TODO what code to use to represent this role?
* practitioner 1..1

Profile: ImResultValidator
Parent: ImPractitionerRole
Id: im-result-validator
Title: "Result Validator"
Description: """
    Result validator. The healthcare professional who is responsible 
    validating the diagnostic report. 
"""
// TODO how this differs from legal authenticator?
// TODO what code to use to represent this role?
* practitioner 1..1

Profile: ImOrderPlacer
Parent: ImPractitionerRole
Id: im-order-placer
Title: "Order Placer"
Description: """
    The healthcare professional who placed the order for the study. 
"""
* practitioner 1..1
* specialty 0..1 MS
  * insert SetPopulateIfKnown
// TODO define ValueSet for specialty from SNOMED CT or reuse http://hl7.org/fhir/ValueSet/c80-practice-codes

Profile: ImPerformer
Parent: ImPractitionerRole
Id: im-performer
Title: "Imaging study performer"
Description: """
    The healtcare professional who performed the study/procedure.
"""
* practitioner 1..1

Profile: ImPractitionerRole
Parent: http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu
Id: im-practitioner-role
Title: "Practitioner Role"
Description: """
    Practitioner Role profile for healthcare professionals, all references to healthcare professionals
    will be of this type.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* active 0..1 MS
  * insert SetPopulateIfKnown
* practitioner 0..1 MS
  * insert SetPopulateIfKnown
* practitioner only Reference(ImPractitioner)
* organization 0..1 MS
  * insert SetPopulateIfKnown
* organization only Reference(ImOrganization)

Profile: ImPractitioner
Parent: http://hl7.eu/fhir/base/StructureDefinition/practitioner-eu
Id: im-practitioner
Title: "Practitioner"
Description: """
    Practitioner profile for healthcare professionals, this resource contains all demographic information
    releted to healthcare professionals.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* insert SetFmmAndStatusRule( 1, draft )
* identifier 0..* MS
  * insert SetPopulateIfKnown
* active 0..1 MS
  * insert SetPopulateIfKnown
* name 0..* MS
  * insert SetPopulateIfKnown
* telecom 0..* MS
  * insert SetPopulateIfKnown
* address 0..* MS
  * insert SetPopulateIfKnown

Profile: ImOrganization
Parent: http://hl7.eu/fhir/base/StructureDefinition/organization-eu
Id: im-organization
Title: "Organization"
Description: """
    Organization profile for healthcare organizations, this resource contains all information
    related to healthcare organizations.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* active 0..1 MS
  * insert SetPopulateIfKnown
* name 0..1 MS
  * insert SetPopulateIfKnown
* contact 0..1 MS
  * insert SetPopulateIfKnown