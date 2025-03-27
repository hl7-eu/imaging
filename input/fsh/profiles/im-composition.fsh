Profile: ImCompositionProvider
Parent: ImComposition
Id: im-composition-provider
Title: "Imaging Composition (ImProvider)"
Description: "Requirements for the provider of the Imaging Composition."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* custodian
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* attester[legalAuthenticator]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* attester[resultValidator]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* author[author] only Reference(ImPractitionerRole)
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* author[authoring-device] only Reference(ImAuthoringDevice)
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImComposition
Parent: http://hl7.org/fhir/StructureDefinition/clinicaldocument
Id: im-composition
Title: "Imaging Composition"
Description: "Clinical document used to represent a Imaging Study Report for the scope of the HL7 Europe project."
* . ^short = "Imaging Report composition"
* . ^definition = """
Imaging Study Report composition.\n
A composition is a set of healthcare-related information that is assembled together into a single logical document that 
provides a single coherent statement of meaning, establishes its own context and that has clinical attestation with regard 
to who is making the statement.\n
While a Composition defines the structure, it does not actually contain the content: rather the full content of a document is contained in a Bundle, 
of which the Composition is the first resource contained.\n
\n
The `text` field of each section SHALL contain a textual representation of all listed entries.
"""
* insert SetFmmAndStatusRule( 1, draft )

* extension contains 
    ImDiagnosticReportReference named diagnosticreport-reference 1..1 and
    $event-basedOn-url named basedOn 0..* and
    $information-recipient-url named informationRecipient 0..* and
    $artifact-version-url named artifactVersion 0..1
* extension[diagnosticreport-reference].valueReference only Reference ( ImDiagnosticReport )
* extension[basedOn].valueReference only Reference ( ServiceRequest )
// TODO see open issues - readdress the status of the information recipient.
* extension[informationRecipient].valueReference only Reference ( ImInformationRecipient )

* meta
  * security 0..*

* language 0..1

//business identifier and relation with the DiagnosticReport resource
* identifier
  * ^short = "Report identifier"
  * ^definition = "Identifiers assigned to this Imaging Report by the performer or other systems. It shall be common to several report versions"
  * ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"

* status
  * ^short = "Status of the Report"
  * ^comment = "DiagnosticReport.status and Composition.status shall be aligned"

* subject 1..1
* subject only Reference(ImPatient)

* custodian
* custodian only Reference(ImOrganization)
  * ^short = "Organization that manages the Imaging Report"
  
* attester 0..*
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "$this.mode"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
* attester contains legalAuthenticator 0..* and resultValidator 0..*
* attester[legalAuthenticator]
  * mode 1..1
  * mode = #legal
  * party only Reference(ImLegalAuthenticator)
* attester[resultValidator]
  * mode 1..1
  * mode = #professional
  * party only Reference(ImResultValidator)

* author 1..*
  * insert SliceElement( #profile, $this )
* author contains 
    author 0..* and 
    authoring-device 0..*
* author[author] only Reference(ImPractitionerRole)
* author[authoring-device] only Reference(ImAuthoringDevice)

// type of the report. Matching DiagnosticReport.code
// code 
* type 1..
* type from ImagingReportTypesEuVS (preferred) // valueset to be revised. 
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Specifies that it refers to a Imaging Report"
  * ^comment = "At least one DiagnosticReport.code.coding and Composition.type.coding SHALL be equal"

* date
  * ^short = "Date the report was last changed."

* section
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
* section.entry
* section.code 1..1  // LOINC code for the section
* section.title
* section.text
* section contains 
    imagingstudy 1..1 and 
    order 1..1 and 
    history 1..1 and
    procedure 1..1 and
    comparison 1..1 and
    findings 1..1 and
    impression 1..1 and
    recommendation 1..1 and
    communication 1..1

///////////////////////////////// IMAGING STUDY SECTION ///////////////////////////////////////
* section[imagingstudy]
  * ^short = "Imaging Study"
  * ^definition = "This section holds information related to the imaging studies covered by this report."
  // * title = "Imaging Studies"
  * code = $loinc#18726-0
  * entry
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^slicing.ordered = false
  * entry contains imagingstudy 1..*
  * entry[imagingstudy]
    * ^short = "Imaging Study Reference"
    * ^definition = "This entry holds a reference to the Imaging Study instance that is associated with this Composition."
  * entry[imagingstudy] only Reference(ImImagingStudy)  

///////////////////////////////// ORDER SECTION ///////////////////////////////////////
* section[order]
  * ^short = "Order"
  * ^definition = "This section holds information related to the order for the imaging study."
  * code = $loinc#55115-0 "Order"

  * entry
    * insert SliceElement( #profile, "$this" )
  * entry contains order 0..*

  * entry[order]
    * ^short = "Order reference"
    * ^definition = "This entry holds a reference to the order for the Imaging Study and report."
  * entry[order] only Reference(ImOrder)

  
///////////////////////////////// HISTORY SECTION ///////////////////////////////////////
* section[history]
  * ^short = "History"
  * code = $loinc#11329-0 "History"

///////////////////////////////// PROCEDURE SECTION ///////////////////////////////////////
* section[procedure]
  * ^short = "Procedure"
  * code = $loinc#55111-9 "Procedure"
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      procedure 0..*
  * entry[procedure] only Reference(ImProcedure)

////////////////// COMPARISON SECTION //////////////////////////
* section[comparison]
  * ^short = "History"
  * code = $loinc#18834-2 "Comparison"
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      comparedstudy 0..*
  * entry[comparedstudy] only Reference(ImImagingStudy or ImImagingSelection)

/////////////////// FINDINGS SECTION //////////////////////////
* section[findings]
  * ^short = "Findings"
  * code = $loinc#59776-5 "Findings"
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* and
      keyimage 0..*
  * entry[finding] only Reference(ImFinding)
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImagesSelection)

/////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * ^short = "Impressions"
  * code = $loinc#19005-8 "Impression"
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* and
      impression 0..* and
      keyimage 0..*
  * entry[finding] only Reference(ImFinding)
  * entry[impression] only Reference(ImImpression)
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImagesSelection)

/////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * ^short = "Recommendations"
  * code = $loinc#18783-1 "Recommendation"
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      recommendedCarePlan 0..*
  * entry[recommendedCarePlan] only Reference(ImRecommendedCarePlan)


/////////////////// COMMUNICATION SECTION //////////////////////////
* section[communication]
  * ^short = "Communications"
  * code = $loinc#18783-1 "Communication"


Extension: ImDiagnosticReportReference
Id:   im-composition-diagnosticReportReference
Title:  "Document DiagnosticReport Reference"
Description: """
    This extension provides a reference to the DiagnosticReport instance that is associated with this Composition.
    """
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert ExtensionContext(Composition)
* insert SetFmmAndStatusRule ( 2, trial-use)
* value[x] only Reference (ImDiagnosticReport)
