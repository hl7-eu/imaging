Profile: CompositionEuImaging
Parent: Composition
Title: "Composition: Imaging Report"
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

//R5* identifier 1..*
* identifier 1..1
  * ^short = "Report identifier"
  * ^definition = "Identifiers assigned to this report by the performer or other systems. It shall be common to several report versions"
  * ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"

* extension contains 
    $event-basedOn-url          named basedOn 0..* and
    $information-recipient-url  named informationRecipient 0..* and
    DiagnosticReportEuImagingReferenceExtensionEuImaging named diagnosticreport-reference 0..1
* extension contains $CrossVersion-Composition.version named version 0..1
* extension[diagnosticreport-reference].valueReference only Reference ( DiagnosticReportEuImaging )

* custodian only Reference( $EuOrganization )
  * ^short = "Organization that manages the Imaging Report"

* attester 0..*
  * insert SliceElement( #value, mode )
* attester contains legalAuthenticator 0..* and resultValidator 0..*
* attester[legalAuthenticator]
  * mode 1..1
  * mode = http://hl7.org/fhir/composition-attestation-mode#legal
  * party only Reference( $EuPractitionerRole )
  * time 1..1
* attester[resultValidator]
  * mode 1..1
  * mode = http://hl7.org/fhir/composition-attestation-mode#professional
  * party only Reference( $EuPractitionerRole )
  * time 1..1

* author 1..*
  * insert SliceElement( #profile, [[$this.resolve()]] )
* author contains 
    author 0..* and 
    authoringDevice 0..* and
    organization 0..*
* author[author] only Reference( $EuPractitionerRole )
* author[authoringDevice] only Reference( $EuDevice )
* author[organization] only Reference( $EuOrganization )

// type of the report. Matching DiagnosticReport.code
// code 
* type from ImagingReportTypesEuVSEuImaging (preferred) 
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Defines the document type, it is recommended to take this from the suggested LOINC set."

* category 1..*
  * insert SliceElement( #value, $this )
* category contains diagnostic-service 1..1 
* category[diagnostic-service] from $diagnostic-service-sections (required)


* status 

* section.code 1..1 
* section 
  * insert SliceElement( #value, code )
* section.emptyReason from SectionEmptyReasonEuImaging (preferred)  
* section obeys eu-imaging-composition-1
* section contains 
    imagingstudy 1..1  and
    order 1..1 and
    history 1..1 and 
    procedure 1..1 and
    comparison 0..1 and 
    findings 0..1  and 
    impression 0..1 and 
    recommendation 0..1  and 
    communication 0..1  and
    report 0..1 

// ///////////////////////////////// IMAGING STUDY SECTION ///////////////////////////////////////
* section[imagingstudy]
  * ^short = "Imaging Study"
  * ^definition = "This section holds information related to the imaging studies covered by this report."
  // * title = "Imaging Studies"
  * code = $loinc#18726-0
  * extension contains $note-url named note 0..*
  * entry 
    * insert SliceElement( #profile, $this )
  * entry contains imagingstudy 1..*
  * entry[imagingstudy]
    * ^short = "Imaging Study Reference"
    * ^definition = "This entry holds a reference to the Imaging Study instance that is associated with this Composition."
  * entry[imagingstudy] only Reference(ImagingStudyEuImaging)  

// ///////////////////////////////// ORDER SECTION ///////////////////////////////////////
* section[order]
  * ^short = "Order"
  * ^definition = "This section holds information related to the order for the imaging study."
  * code = $loinc#55115-0 // "Requested imaging studies information Document"
  * extension contains $note-url named note 0..*

  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      order 0..*

  * entry[order]
    * ^short = "Order reference"
    * ^definition = "This entry holds a reference to the order for the Imaging Study and report."
  * entry[order] only Reference(ServiceRequestOrderEuImaging)  
  

// // ///////////////////////////////// HISTORY SECTION ///////////////////////////////////////
* section[history]
  * ^short = "History"
  * code = $loinc#11329-0 // "History general Narrative - Reported"
  * extension contains $note-url named note 0..*

// // ///////////////////////////////// PROCEDURE SECTION ///////////////////////////////////////
* section[procedure]
  * ^short = "Procedure"
  * code = $loinc#55111-9 // "Current imaging procedure descriptions Document"
  * extension contains $note-url named note 0..*
  * entry 
    * insert SliceElement( #profile, $this )
  * entry contains 
      procedure 0..*
  * entry[procedure] only Reference(ProcedureEuImaging)


// ////////////////// COMPARISON SECTION //////////////////////////
* section[comparison]
  * ^short = "History"
  * code = $loinc#18834-2 // "Radiology Comparison study (narrative)"
  * extension contains $note-url named note 0..*
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      comparedstudy 0..*
  * entry[comparedstudy] only Reference( ImagingStudyEuImaging or ImagingSelectionEuImaging )

// /////////////////// FINDINGS SECTION //////////////////////////
* section[findings]
  * ^short = "Findings"
  * code = $loinc#59776-5 // "Findings"
  * extension contains $note-url named note 0..*
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* and
      keyimage 0..*
  * entry[finding] only Reference(ObservationFindingEuImaging)
  * entry[keyimage] only Reference(DocumentReferenceKeyImageEuImaging or ImagingSelectionKeyImageEuImaging)

// /////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * ^short = "Impressions"
  * code = $loinc#19005-8 // "Radiology Imaging study [Impression] (narrative)"
  * extension contains $note-url named note 0..*
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* and
      impression 0..* and
      keyimage 0..*
  * entry[finding] only Reference(ObservationFindingEuImaging)
  * entry[impression] only Reference( $EuCondition )
  * entry[keyimage] only Reference(DocumentReferenceKeyImageEuImaging or ImagingSelectionKeyImageEuImaging)

// /////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * ^short = "Recommendations"
  * code = $loinc#18783-1 // "Radiology Study recommendation (narrative)"
  * extension contains $note-url named note 0..*
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains suggestion 0..*
  * entry[suggestion] only Reference($EuCarePlan or $EuServiceRequest)


// /////////////////// COMMUNICATION SECTION //////////////////////////
* section[communication]
  * ^short = "Communications"
// a proper code is needed
  * code = $loinc#73568-8 // "Communication"
  * extension contains $note-url named note 0..*

// /////////////////// COMMUNICATION SECTION //////////////////////////
* section[report]
  * ^short = "Report - all content in one section"
// a proper code is needed
  * code = $loinc#LP173421-1 // "Report"
  * extension contains $note-url named note 0..*

Invariant: eu-imaging-composition-1
Description: "When a section is empty, the emptyReason extension SHALL be present."
Severity: #error 
Expression: "entry.empty().not() or emptyReason.exists() or entry.extension('http://hl7.org/fhir/StructureDefinition/note').value.text.exists()"

Extension: DiagnosticReportEuImagingReferenceExtensionEuImaging
Title:  "Extension: Document DiagnosticReport Reference"
Description: """
    This extension provides a reference to the DiagnosticReport instance that is associated with this Composition.
    """
Context: Composition
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert ExtensionContext(Composition)
* insert SetFmmAndStatusRule ( 2, draft )
* value[x] only Reference (DiagnosticReportEuImaging)
