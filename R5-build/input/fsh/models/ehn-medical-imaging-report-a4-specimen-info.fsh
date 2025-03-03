Logical: MedicalImagingReportOrderSpecimenInformationEhn
Id: ehn-medical-imaging-report-specimen-information
Title: "A.4 Specimen information" 
Description: "Note: a specimen (not attached to a body) can be used for diagnostic, forensic and medical research purposes."
* insert SetFmmAndStatusRule( 2, informative)
* specimenIdentifier 0..1 Identifier "A.4.1 Specimen identifier" """
  An identifier of the specimen which is unique within in a defined scope. Example: identifier assigned by ordering system. Multiple identifiers can be used.
  """
* material 0..1 CodeableConcept "A.4.2 Material" """
  Specimen material (e.g. "Specimen from breast obtained by biopsy"). SNOMED CT
  """
* collectionPeriod 0..1 dateTime "A.4.3 Collection period" """
  Collection date time or period. ISO 8601
  """
* anatomicLocation 0..1 CodeableConcept "A.4.4 Anatomic location" """
  Anatomic location (body location, laterality) where the material is collected (e.g. "Elbow, left"). SNOMED CT, ICD-O-3
  """
* morphology 0..1 CodeableConcept "A.4.5 Morphology" """
  Morphological abnormalities of the anatomical location where the material is taken, for example wound, ulcer. SNOMED CT
  """
* sourceDevice 0..1 CodeableConcept "A.4.6 Source Device" """
  If the material is not collected directly from the patient but comes from a patient-related object, e.g. a catheter. SNOMED CT, EMDN
  """
* collectionProcedureMethod 0..1 CodeableConcept "A.4.7 Collection procedure/method" """
  If relevant for the results, the method of obtaining the specimen. SNOMED CT
  """
* receivedDate 0..1 dateTime "A.4.8 Received date" """
  Date and time that the material is handed over at imaging department or workplace performing imaging study. ISO 8601
  """
