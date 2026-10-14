// CapabilityStatement for EEHRxF Imaging Report Document Access Provider Actor
// Composite actor grouping MHD Document Responder + PDQm Supplier + IUA

Instance: EehrxfImagingDocumentAccessProvider
InstanceOf: CapabilityStatement
Title: "EEHRxF Imaging Report Document Access Provider CapabilityStatement"
Usage: #definition
Description: """
CapabilityStatement for the EEHRxF Imaging Report Document Access Provider actor. This composite actor
provides access to EEHRxF FHIR Documents by serving them to Document Consumers via query APIs.

"""

* name = "EEHRxFImagingReportDocumentAccessProvider"
* title = "EEHRxF Imaging Report Document Access Provider CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-01-26"
* publisher = "HL7 Europe"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml

// Server mode for Document Access Provider
* rest[+].mode = #server
* rest[=].documentation = """
The Imaging Report Document Access Provider actor responds to document queries from Document Consumers
(ITI-67, ITI-68) and provides patient lookup services (PDQm ITI-78).

All transactions require SMART Backend Services authorization.
"""

* rest[=].security.cors = false
* rest[=].security.service = http://hl7.org/fhir/restful-security-service#SMART-on-FHIR
* rest[=].security.description = """
SMART Backend Services authorization is REQUIRED for all transactions.
Systems SHALL:
- Validate JWT client credentials (RFC 7523)
- Verify appropriate scopes for document operations
- Use TLS 1.2 or higher for all communications

Required scopes to accept:
- system/DocumentReference.read (read DocumentReference - ITI-67)
- system/DocumentReference.search (search DocumentReference - ITI-67)
- system/Binary.read (read Binary - ITI-68)
- system/Bundle.read (read Bundle - ITI-68 for FHIR Documents)
- system/Patient.read (read Patient - ITI-78)
- system/Patient.search (search Patient - ITI-78)
"""

// System-level search interaction
* rest[=].interaction[+].code = #search-system
* rest[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].interaction[=].extension[=].valueCode = #MAY
* rest[=].interaction[=].documentation = "System-wide search support"

// ============================================================================
// DocumentReference resource - ITI-67 query
// ============================================================================
* rest[=].resource[+].type = #DocumentReference
* rest[=].resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].documentation = """
DocumentReference resources are served via ITI-67 Find Document References. The server
indexes document metadata for queries by Document Consumers.
"""

// ITI-67: Read DocumentReference by ID
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Read DocumentReference by logical ID"

// ITI-67: Search DocumentReference
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Search for DocumentReference resources (ITI-67)"

* rest[=].resource[=].updateCreate = false
* rest[=].resource[=].conditionalCreate = false
* rest[=].resource[=].conditionalUpdate = false
* rest[=].resource[=].conditionalDelete = #not-supported
* rest[=].resource[=].referencePolicy = #resolves
* rest[=].resource[=].searchRevInclude = "Provenance:target"


// Search parameters for DocumentReference - SHALL support
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].searchParam[=].documentation = "The patient the document is about. The server SHALL support at least id value and MAY support both Type and id values."

* rest[=].resource[=].searchParam[+].name = "type"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD   // Change specific for imaging
* rest[=].resource[=].searchParam[=].documentation = "Kind of document (LOINC code) - SHALL support for clinical precision filtering"

* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL  // Change specific for imaging
* rest[=].resource[=].searchParam[=].documentation = "Logical id of this artifact"

// Search parameters for DocumentReference - SHALL support
* rest[=].resource[=].searchParam[+].name = "category"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].searchParam[=].documentation = "Categorization of document (XDS ClassCode) - SHOULD support for coarse filtering"

* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "When this document reference was created. The date modifiers ge, le, gt, lt SHOULD be supported."

* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "current | superseded | entered-in-error"

* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Master Version Specific Identifier"

// Search parameters for DocumentReference - MAY support
* rest[=].resource[=].searchParam[+].name = "period"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-period"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Time of service that is being documented"

* rest[=].resource[=].searchParam[+].name = "format"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-format"
//R5* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-format-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Format/content rules for the document"

// Additional MHD-aligned search parameters
* rest[=].resource[=].searchParam[+].name = "_lastupdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "When the resource version last changed"

* rest[=].resource[=].searchParam[+].name = "setting"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-setting"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Additional details about where the content was created (e.g. clinical specialty)"

* rest[=].resource[=].searchParam[+].name = "facility"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-facility"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Kind of facility where patient was seen"

* rest[=].resource[=].searchParam[+].name = "event"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-event"
//R5* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-event-code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Main clinical acts documented"

* rest[=].resource[=].searchParam[+].name = "security-label"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-security-label"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Document security-tags"

* rest[=].resource[=].searchParam[+].name = "related"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-related"
//R5* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-relatesto"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Related identifiers or resources"

* rest[=].resource[=].searchParam[+].name = "author.given"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Given name of document author"

* rest[=].resource[=].searchParam[+].name = "author.family"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Family name of document author"

* rest[=].resource[=].searchParam[+].name = "patient.identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #MAY
* rest[=].resource[=].searchParam[=].documentation = "Patient identifier (chained search)"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Imaging specific search parameters
* rest[=].resource[=].searchParam[+].name = "bodysite"
* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceBodySite )
//R5* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-bodysite"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Anatomical region of the related imaging study"

* rest[=].resource[=].searchParam[+].name = "modality"
* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceModality )
//R5* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-modality"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Modality of the related imaging study"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// ============================================================================
// Binary resource - ITI-68 retrieve
// ============================================================================
* rest[=].resource[+].type = #Binary
* rest[=].resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].documentation = """
Binary resources contain the actual document content for non-FHIR documents. They are
served via ITI-68 Retrieve Document.
"""

// ITI-68: Retrieve document content
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Retrieve document content (ITI-68)"

* rest[=].resource[=].updateCreate = false
* rest[=].resource[=].conditionalCreate = false
* rest[=].resource[=].conditionalUpdate = false
* rest[=].resource[=].conditionalDelete = #not-supported

// ============================================================================
// Patient resource - PDQm ITI-78 patient lookup
// ============================================================================
* rest[=].resource[+].type = #Patient
* rest[=].resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].documentation = """
Patient resources support patient context lookup per PDQm [ITI-78]. The identifier
search parameter is required; additional demographics parameters are optional.
"""

* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Read Patient by logical ID"

* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Search for patients (PDQm ITI-78)"

* rest[=].resource[=].updateCreate = false
* rest[=].resource[=].conditionalCreate = false
* rest[=].resource[=].conditionalUpdate = false
* rest[=].resource[=].conditionalDelete = #not-supported
* rest[=].resource[=].referencePolicy = #resolves

* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].searchParam[=].documentation = "Patient identifier (e.g., national ID, MRN) - required for patient lookup"

* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].searchParam[=].documentation = "Patient logical ID"

* rest[=].resource[=].searchParam[+].name = "family"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Patient family name"

* rest[=].resource[=].searchParam[+].name = "given"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Patient given name"

* rest[=].resource[=].searchParam[+].name = "birthdate"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Patient date of birth"
