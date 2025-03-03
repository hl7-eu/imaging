{% include variable-definitions.md %}

This page contains open topics detected in the specification that are recognized and still need to be resolved.

* The definition of what a _information recipient_ is is not completely clear. We follow the guidance from hdr in this until more information is available. If it represents a request for info - CommunicationRequest would be an option, if it represents a log of who received the info, Communication or Provenance could address this.
  * Guidance from HL7-EU meeting -> is the party that *originally* requested the document.
* Include A.4 Specimen as it sounds like requiring a Digital Pathology report which may have a different structure from a radiology report.
  * The Specimen does not refer to digital pathology but to a sample taken from the body and scanned using normal imaging devices. Refine model accordingly.
* Add invariant stating that Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists.
* DiagnosticReport.code and Composition.type are bound to a value set with one LOINC code. The value set should be replaced. The best candidate it the (FHIR version) of Radlex/LOINC playbook, as proposed by IDR.

* DiagnosticReport.code and Composition.type should match enforced by an invariant.
* Likewise, DiagnosticReport.status and Composition.status shall be aligned, thus an invariant should be implemented.

* Content in Composition and DiagnosticReport
  * Is all eHN information required to be in both?
  * HL7-WGN feedback: 
    * DiagnosticReport is the intended to be used to search for documents (not relying on the Composition), the Composition is a representation of the contents. Hence all/most search options should be present on DiagnosticReport.

* Provide description of contents of section.title and text; add documentation on the generation of the document and the role of resource.text and Composition.section.text. 
  * HL7 WGM preliminary conclusion: Narrative is generated from the structured content. 
  * TBD where to add free-text notes - note extension? (annotation)

* Provide narrative on the use of the model and define the mandatory relationships between resources (e.g. DR.conclusion and Comp.section.text)

* Some ValueSets refer to EDQM codes - where is this code system defined? 
  * HL7-EU terminology server
  * TBD add reference

* Check whether we need to refer to https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_A.html for document categories or types.

* Check whether Diagnostic Imaging Report titles could benefit from https://dicom.nema.org/dicom/2013/output/chtml/part16/sect_CID_7000.html

* Add section explaining where this specification deviates/aligns with IDR.
  * TBD - planned after publication of initial IHE-IDR IG mapping.

* Refine use of accession number and order id (https://confluence.hl7.org/spaces/HEU/pages/321160132/2024-02+HL7+EU+WGM+-+EU-a-thon+-+imaging+discussions#id-202402HL7EUWGMEUathonimagingdiscussions-SearchbyorderId)
  * Order ID is id of original order
  * Accession Number is id assigned by the RIS.