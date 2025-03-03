Logical: MedicalImagingReportOrderReasonEhn
Id: ehn-medical-imaging-report-order-reason
Title: "A.3 Order Reason"
Description:  "Note: an imaging report could respond to multiple reasons."
* insert SetFmmAndStatusRule( 2, informative)
* reason 0..* CodeableConcept "A.3.1 Reason" """
  Description of a clinical condition indicating why imaging examination was ordered. The reason could be expressed in coded or textual form. The reason represents the primary condition or finding leading up to a request for an imaging investigation.
  Example: "Cough lasting for 3 months". SNOMED CT
  """
* problemDiagnosisCondition 0..* CodeableConcept "A.3.2 Problem / diagnosis / condition" """
  Health conditions affecting the health of the patient are important to be known for a health professional in relation to the imaging encounter. Clinical conditions of the subject are relevant for the interpretation of the results. ICD-10, SNOMED CT, Orphanet
  """
* clinicalQuestion 0..* string "A.3.3 Clinical question" """
  Specification of clinical question (goal of the investigation) to be answered by the imaging investigation.
  """
