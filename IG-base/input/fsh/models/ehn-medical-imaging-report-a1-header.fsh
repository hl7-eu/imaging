Logical: MedicalImagingReportHeaderEhn
Id: ehn-medical-imaging-report-header
Title: "A.1 Report header data elements (eHN)"
Description: "A.1 Report header data elements (eHN)"
* insert SetFmmAndStatusRule( 2, informative)
* identification 0..1 MedicalImagingReportHeaderPatientIdentificationEhn "A.1.1 Identification of the patient/subject"
* contact 0..1 MedicalImagingReportHeaderPatientContactEhn "A.1.2 Patient/subject related contact information" 
* insuranceAndPayment 0..1 MedicalImagingReportHeaderHealthInsuranceAndPaymentInformationEhn "A.1.3 Health insurance and payment information" """
     Health insurance information is not always required, 
    however, in some jurisdictions, the insurance number is also 
    used as the patient identifier. It is necessary not just for 
    identification but also forms access to funding for care.
    """
* informationRecipient 0..* MedicalImagingReportHeaderInformationRecipientEhn "A.1.4 Information recipient" """
    Intended recipient or recipients of the report, e.g., GP, another specialist. Multiple recipients could be provided.
    """
* author 0..* MedicalImagingReportHeaderAuthorEhn "A.1.5 Author" """ 
  Author (by whom the imaging report or a subset of its results was authored). Multiple authors could be provided."""
* legalAuthenticator 0..1 MedicalImagingReportHeaderLegalAuthenticatorEhn "A.1.6 Legal authenticator" """
  The person taking responsibility for the medical content of the document.
  """
* resultValidator 0..1 MedicalImagingReportHeaderResultValidatorEhn "A.1.7 Result validator"
* documentMetadata 0..1 MedicalImagingReportHeaderDocumentMetadataEhn "A.1.8 Document metadata"


Logical: MedicalImagingReportHeaderPatientIdentificationEhn
Id: ehn-medical-imaging-report-header-patient-identification
Title: "A.1.1 Identification of the patient/subject"
Description: "Identification of the patient/subject"
* insert SetFmmAndStatusRule( 2, informative)
* name 0..* string "A.1.1.1 Family name/surname"
  """The family name/surname/last name of the patient. This field can contain more than one element or multiple fields 
  could be present.
  """ 
* givenName 0..* string "A.1.1.2 Given name" """The given name/first name of the patient (also known as a forename or first name). This field can contain more than one element."""
* dob 0..1 dateTime "A.1.1.3 Date of birth" 
"""The date of birth of the patient [ISO TS 22220]. As the age of the patient might be important for the correct interpretation 
    of the test result values, a complete date of birth should be provided.
    ISO 8601
"""
* personalIdentifier 0..1 Identifier "A.1.1.4 Personal identifier" """
  An identifier of the patient that is unique within a defined
  scope. Example: Example: National ID (citizen card / eID), 
  health number, passport, etc. Multiple identifiers could be 
  provided.
  """
* gender 0..1 CodeableConcept "A.1.1.5 Gender" """
This field must contain a recognized valid value for 
\"administrative gender\". If different, \"physiological gender\" 
should be communicated elsewhere in the relevant clinical 
information section.
HL7 Administrative Gender
"""

Logical: MedicalImagingReportHeaderPatientContactEhn
Id: ehn-medical-imaging-report-header-patient-contact
Title: "A.1.2 Patient/subject related contact information"
Description: "Patient/subject related contact information"
* insert SetFmmAndStatusRule( 2, informative)
* address 0..1 Address "A.1.2.1 Address" """
  Mailing and home or office addresses. The addresses are 
  always sequences of address parts (e.g., street address line, 
  country, ZIP code, city) even if postal address formats may 
  vary depending on the country. An address may or may not 
  include a specific use code; if this attribute is not present it is 
  assumed to be the default address useful for any purpose.
  ISO 3166 for Country Code
  """
* telecom 0..1 ContactPoint "A.1.2.2 Telecom" """
  Telecommunication contact information (addresses) 
  associated with a person, such as phone number, email, or 
  messaging service. Multiple telecommunication addresses 
  might be provided
    """

Logical: MedicalImagingReportHeaderHealthInsuranceAndPaymentInformationEhn
Id: ehn-medical-imaging-report-header-health-insurance-information
Title: "A.1.3 Health insurance and payment information" 
Description: """
     Health insurance information is not always required, 
    however, in some jurisdictions, the insurance number is also 
    used as the patient identifier. It is necessary not just for 
    identification but also forms access to funding for care.
    """
* insert SetFmmAndStatusRule( 2, informative)
* providerCode 0..1 string "A.1.3.1.1 Health insurance provider code" """
  Unique health insurance company identification code.
  """
* providerName 0..1 string "A.1.3.1.2 Health insurance provider name" """
  The full, official name of the healthcare insurance provider.
  """
* policyNumber 0..1 string "A.1.3.1.3 Health insurance policy number" """
  Number or code under which the insured person is registered at the insurance provider.
  """
  
Logical: MedicalImagingReportHeaderInformationRecipientEhn
Id: ehn-medical-imaging-report-header-information-recipient
Title: "A.1.4 Information recipient" 
Description: """
    Intended recipient or recipients of the report, e.g., GP, another specialist. Multiple recipients could be provided.
    """
* insert SetFmmAndStatusRule( 2, informative)
* recipientIdentifier 0..1 Identifier "A.1.4.1 Recipient identifier" """
  The health professional identification number. Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the license or registration number. In case when the recipient is not a health professional, e.g., a patient, an appropriate personal identifier should be used.
  """
* recipientName 0..* HumanName "A.1.4.2 Recipient name" """
  Person name [the structure of the name will be the same as for the patient (given name, family name / surname)].
  """
* recipientOrganization 0..1 string "A.1.4.3 Recipient organization" """
  The healthcare provider organization information.
  """
* recipientAddress 0..1 Address "A.1.4.4 Address" """
  Mailing and home or office addresses. The addresses are always sequences of address parts (e.g., street address line, country, ZIP code, city) even if postal address formats may vary depending on the country. An address may or may not include a specific use code; if this attribute is not present it is assumed to be the default address useful for any purpose.
  ISO 3166 for Country Code
  """
* recipientCountry 0..1 CodeableConcept "A.1.4.5 Country" """
  Country of the recipient as part of the address. ISO 3166
  """
* recipientTelecom 0..* ContactPoint "A.1.4.6 Telecom" """
  Telecommunication contact information (addresses) associated with a person, such as phone number, email, or messaging service. Multiple telecommunication addresses might be provided.
  """

Logical: MedicalImagingReportHeaderAuthorEhn
Id: ehn-medical-imaging-report-header-author
Title: "A.1.5 Author" 
Description: """ 
  Author (by whom the imaging report or a subset of its results was authored). Multiple authors could be provided."""
* insert SetFmmAndStatusRule( 2, informative)
* authorIdentifier 0..1 Identifier "A.1.5.1 Author identifier" """
  The health professional or authoring device identification number. Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the license or registration number.
  """
* authorName 0..* HumanName "A.1.5.2 Author name" """
  Person or device name.
  """
* authorOrganization 0..1 string "A.1.5.3 Author organization" """
  The healthcare provider organization information.
  """
* authoringDateTime 0..1 dateTime "A.1.5.4 Authoring date and time" """
  Date and time the document was last modified. ISO 8601
  """

Logical: MedicalImagingReportHeaderLegalAuthenticatorEhn
Id: ehn-medical-imaging-report-header-legal-authenticator
Title: "A.1.6 Legal authenticator" 
Description: """
  The person taking responsibility for the medical content of the document.
  """
* insert SetFmmAndStatusRule( 2, informative)
* authenticatorIdentifier 0..1 Identifier "A.1.6.1 Authenticator identifier" """
  The health professional identification number. Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the license or registration number.
  """
* authenticatorName 0..* HumanName "A.1.6.2 Authenticator name" """
  Person name [the structure of the name will be the same as for the patient (given name, family name / surname)].
  """
* authenticatorOrganization 0..1 string "A.1.6.3 Authenticator organization" """
  The healthcare provider organization information.
  """
* authenticatorDateTime 0..1 dateTime "A.1.6.4 Authenticator date and time" """
  Date and time the document was last authenticated. ISO 8601
  """

Logical: MedicalImagingReportHeaderResultValidatorEhn
Id: ehn-medical-imaging-report-header-result-validator
Title: "A.1.7 Result validator"
Description: "Result validator"
* insert SetFmmAndStatusRule( 2, informative)
* validatorIdentifier 0..1 Identifier "A.1.7.1 Result validator identifier" """
  The health professional identification number. Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the license or registration number.
  """
* validatorName 0..* HumanName "A.1.7.2 Result validator name" """
  Person name.
  """
* validatorOrganization 0..1 string "A.1.7.3 Result validator organization" """
  The healthcare provider organization information.
  """
* validationDateTime 0..1 dateTime "A.1.7.4 Validation date and time" """
  Date and time when the document was validated. ISO 8601
  """

Logical: MedicalImagingReportHeaderDocumentMetadataEhn
Id: ehn-medical-imaging-report-header-document-metadata
Title: "A.1.8 Document metadata"
Description: "Document metadata"
* insert SetFmmAndStatusRule( 2, informative)
* documentId 0..1 Identifier "A.1.8.0 Document ID" """
  Unique identifier of the document.
  """
* documentType 0..1 CodeableConcept "A.1.8.1 Document type" """
  A coded type of the document. Fixed value \"Diagnostic Imaging report\" LOINC.
  """
* documentStatus 0..1 CodeableConcept "A.1.8.2 Document status" """
  The status of the imaging result report. E.g., preliminary (in case of an emergency situation), final. hl7:DiagnosticReportStatus.
  """
* reportDateTime 0..1 dateTime "A.1.8.3 Report date and time" """
  Date and time of the result report creation. ISO 8601
  """
* documentTitle 0..1 string "A.1.8.4 Document title" """
  Document title, e.g., "Diagnostic Imaging Report".
  """
* imagingProcedure 0..* CodeableConcept "A.1.8.5 Imaging procedure" """
  Imaging study procedure(s) performed. This element is relevant for the interactive selection of the available studies. LOINC, SNOMED CT.
  """
* reportCustodian 0..1 string "A.1.8.6 Report custodian" """
  Organization that is in charge of maintaining the imaging report.
  """
* confidentiality 0..1 CodeableConcept "A.1.8.7 Confidentiality" """
  Level of confidentiality of the document. Implicit value is normal. hl7:Confidentiality.
  """
* language 0..1 CodeableConcept "A.1.8.8 Language" """
  Language in which the document is written. ISO 639.
  """
* version 0..1 string "A.1.8.9 Version" """
  Version of the document.
  """
* studyInstanceUID 0..* Identifier "A.1.8.10 Study Instance UID" """
  Unique global identifier(s) that identifies an imaging study upon which the imaging report is based. An identifier that links an imaging report to one or more imaging studies. This element is relevant for the interactive selection of the available studies. OID.
  """
* accessionNumber 0..1 Identifier "A.1.8.11 Accession number" """
  This is an identifier, managed by the RIS at the local level, which usually uniquely identifies an imaging procedure request, and links it to imaging study(ies) and related imaging report(s). As it is prefixed by the registration authority it is a globally unique ID, usable both nationally and cross-border.
  """

