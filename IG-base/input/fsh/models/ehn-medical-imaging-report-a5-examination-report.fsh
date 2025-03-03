Logical: MedicalImagingReportOrderExaminationReportEhn
Id: ehn-medical-imaging-report-examreport
Title: "A.5 Examination Report"
Description: "Examination Report"
* insert SetFmmAndStatusRule( 2, informative)
* imagingProcedureDescription 0..1 MedicalImagingReportOrderExaminationReportImagingProcedureDescriptionEhn "A.5.1 Imaging procedure description" """
  Note: this part records the technical details of the performed procedures and may include information about protocol, imaging phases, imaging device, anatomical location, performer, place, date and time of performance.
  """
* medication 0..1 MedicalImagingReportOrderExaminationReportImagingProcedureDescriptionEhn "A.5.2 Medication" """
  Medication section includes information about medication administered during the medical imaging examination (contrast, sedation, stress agents), etc.
  """
* adverseReaction 0..1 MedicalImagingReportOrderExaminationReportAdverseReactionEhn "A.5.3 Adverse reaction" """
  Adverse reactions manifested during imaging investigation.
  """
* results 0..1 MedicalImagingReportOrderExaminationReportResultsEhn "A.5.4 Results" """
  Note: The results summarise the findings and observations by the health professional following the imaging study. Note: this part includes textual as well as structured results or findings of the imaging investigation.
  """
* conclusion 0..1 MedicalImagingReportOrderExaminationReportConclusionEhn "A.5.5 Conclusion" """
  A concise and clinically contextualised summary including interpretation/impression of the diagnostic report
  """
* recommendation 0..1 MedicalImagingReportOrderExaminationReportRecommendationEhn "A.5.6 Recommendation" """Recommendation"""



Logical: MedicalImagingReportOrderExaminationReportImagingProcedureDescriptionEhn
Id: ehn-medical-imaging-report-examreport-imaging-proc-description
Title: "A.5.1 Imaging procedure description" 
Description: """
  Note: this part records the technical details of the performed procedures and may include information about protocol, imaging phases, imaging device, anatomical location, performer, place, date and time of performance.
  """
* modality 0..1 CodeableConcept "A.5.1.1 Modality" """
  Imaging modality (or modalities) expresses the type of device used during imaging procedure. This element is relevant for the interactive selection of the available studies. DICOM Modality
  """
* procedureDate 0..1 dateTime "A.5.1.2 Procedure date" """
  Date and time of the procedure or interval of its performance. ISO 8601
  """
* procedureText 0..1 string "A.5.1.3 Procedure text" """
  Detailed textual description of the procedure.
  """
* procedureCode 0..1 CodeableConcept "A.5.1.4 Procedure code" """
  Code representing the procedure. SNOMED CT
  """
* procedureName 0..1 string "A.5.1.5 Procedure name" """
  Full name of the procedure according to the used procedure coding standard.
  """
* anatomicalFocus 0..1 Base "A.5.1.6 Anatomical focus"
  * bodyLocation 0..1 CodeableConcept "A.5.1.6.1 Body location" """
    Localisation on/in the body (part of the body focused during the procedure). The element could be repeated to provide information at multiple levels (bigger body location, smaller body location). This element is relevant for the interactive selection of the available studies. SNOMED CT, ICD-O-3
    """
  * laterality 0..1 CodeableConcept "A.5.1.6.2 Laterality" """
    Body side of the body location, if needed to distinguish from a similar location on the other side of the body. SNOMED CT
    """
* deviceId 0..1 Identifier "A.5.1.7 Device ID" """
  Normalised identifier of the acquisition modality equipment instance such as UDI according to REGULATION (EU) 2017/745.
  """
* performer 0..1 Base "A.5.1.8 Performer"
  * performerId 0..1 Identifier "A.5.1.8.1 Performer Id" """
    Performer identifier unique within a given context (namespace). Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the license or registration number.
    """
  * performerName 0..* HumanName "A.5.1.8.2 Performer Name" """
    Person name.
    """
  * performerOrganization 0..1 string "A.5.1.8.3 Performer Organisation" """
    The healthcare provider organisation information.
    """
* additionalProcedureDetails 0..1 string "A.5.1.9 Additional procedure details" """
  Additional information pertaining imaging procedure, such as imaging phase. e.g., without contrast, arterial phase, venous phase, delayed phase. Only some types of studies have phases. SNOMED CT
  """


Logical: MedicalImagingReportOrderExaminationReportMedicationEhn
Id: ehn-medical-imaging-report-examreport-medication
Title: "A.5.2 Medication" 
Description: """
  Medication section includes information about medication administered during the medical imaging examination (contrast, sedation, stress agents), etc.
  """
* brandName 0..1 string "A.5.2.1 Brand name" """
  Brand name of biological medicinal product or when justified by the health professional (ref. Commission Directive 2012/52/EU)
  """
* code 0..1 CodeableConcept "A.5.2.2 Code" """
  Product Code IDMP
  """
* activeIngredientList 0..1 string "A.5.2.3 Active ingredient list" """
  Substance that alone or in combination with one or more other ingredients produces the intended activity of a medicinal product. Example: "paracetamol". ATC* (IDMP identifier, when available)
  """
* strength 0..1 string "A.5.2.4 Strength" """
  The content of the active ingredient expressed quantifiably per dosage unit, per unit of volume or per unit of weight, according to the pharmaceutical dosage form. Example: 500 mg per tablet. UCUM, EDQM Standard Terms
  """
* pharmaceuticalDoseForm 0..1 CodeableConcept "A.5.2.5 Pharmaceutical dose form" """
  The form in which a pharmaceutical product is presented in the medicinal product package (e.g. tablet, syrup). EDQM Standard Terms
  """
* routeOfAdministration 0..1 CodeableConcept "A.5.2.6 Route of administration" """
  Path by which the pharmaceutical product is taken into or makes contact with the body. EDQM Standard Terms
  """
* dateTime 0..1 dateTime "A.5.2.7 Date and time" """
  Date and time of medication. ISO 8601
  """

Logical: MedicalImagingReportOrderExaminationReportAdverseReactionEhn
Id: ehn-medical-imaging-report-examreport-adverse-reaction
Title: "A.5.3 Adverse reaction" 
Description: """
  Adverse reactions manifested during imaging investigation.
  """
* allergyDescription 0..1 string "A.5.3.1 Allergy description" """
  Textual description of the allergy or intolerance.
  """
* typeOfPropensity 0..1 CodeableConcept "A.5.3.2 Type of propensity" """
  This element describes whether this condition refers to an allergy, non-allergy intolerance, or unknown class of intolerance (not known to be allergy or intolerance). SNOMED CT
  """
* allergyManifestation 0..1 string "A.5.3.3 Allergy manifestation" """
  Description of the clinical manifestation of the allergic reaction. Example: anaphylactic shock, angioedema (the clinical manifestation also gives information about the severity of the observed reaction). SNOMED CT
  """
* severity 0..1 CodeableConcept "A.5.3.4 Severity" """
  Severity of the clinical manifestation of the allergic reaction. SNOMED CT
  """
* criticality 0..1 CodeableConcept "A.5.3.5 Criticality" """
  Potential risk for future life-threatening adverse reactions when exposed to a substance known to cause an adverse reaction. SNOMED CT
  """
* onsetDate 0..1 dateTime "A.5.3.6 Onset date" """
  Date of the observation of the reaction. ISO 8601
  """
* certainty 0..1 CodeableConcept "A.5.3.7 Certainty" """
  Assertion about the certainty associated with a propensity, or potential risk, of a reaction to the identified substance. Diagnostic and/or clinical evidence of the condition. SNOMED CT
  """
* agentOrAllergen 0..1 CodeableConcept "A.5.3.8 Agent or Allergen" """
  A specific allergen or other agent/substance (drug, food, chemical agent, etc.) to which the patient has an adverse reaction propensity. SNOMED CT (for non-drug allergy) or ATC (for drug allergy) (IDMP, when available)
  """

Logical: MedicalImagingReportOrderExaminationReportResultsEhn
Id: ehn-medical-imaging-report-examreport-results
Title: "A.5.4 Results" 
Description: """
  Note: The results summarise the findings and observations by the health professional following the imaging study. Note: this part includes textual as well as structured results or findings of the imaging investigation.
  """
* date 0..1 dateTime "A.5.4.1 Date" """
  Date and time of the observation. ISO 8601
  """
* resultText 0..1 string "A.5.4.2 Result text" """
  Comments and narrative representation of the observation results and findings.
  """
* observationDetails 0..* Base "A.5.4.3 Observation details"
  * observationCode 0..1 CodeableConcept "A.5.4.3.1 Observation code" """
    Code representing the observation. SNOMED CT
    """
  * observationName 0..1 string "A.5.4.3.2 Observation name" """
    Full name of the observation according to the used observation coding standard.
    """
  * observationMethod 0..1 CodeableConcept "A.5.4.3.3 Observation method" """
    Observation method (measurement principle) to obtain the result. SNOMED CT
    """
  * observationResult 0..1 string "A.5.4.3.4 Observation result" """
    Results of the observation including text, numeric and coded results of the measurement and measurement uncertainty. The content of the observation result will vary according to the type of observation. Examples: diameter, density, and number of nodes. SNOMED CT (for ordinal or nominal scale results and result interpretation) UCUM (for units)
    """


Logical: MedicalImagingReportOrderExaminationReportConclusionEhn
Id: ehn-medical-imaging-report-examreport-conclusion
Title: "A.5.5 Conclusion" 
Description: """
  A concise and clinically contextualised summary including interpretation/impression of the diagnostic report
  """
* impression 0..1 string "A.5.5.1 Impression" """
  Narrative description of the clinical conclusion (impression).
  """
* codedConclusions 0..* Base "A.5.5.2 Coded conclusions"
  * conditionOrFinding 0..1 CodeableConcept "A.5.5.2.1 Condition or finding" """
    Condition or finding from imaging investigation. ICD-10, SNOMED CT, Orphacode
    """
  * stagingOrGrading 0..1 CodeableConcept "A.5.5.2.2 Staging or grading" """
    Assessment of the condition expressed using common staging or grading (typically TNM but also other) or coded observations (Bi-Rads, Li-Rads etc.). E.g. TNM, Bi-Rads, Li-Rads
    """


Logical: MedicalImagingReportOrderExaminationReportRecommendationEhn
Id: ehn-medical-imaging-report-examreport-recommendation
Title: "A.5.6 Recommendation"
Description: """Recommendation"""
* description 0..1 string "A.5.6.1 Description" """
  Narrative description of the recommended activities including additional tests, medication etc.
  """
* carePlan 0..1 string "A.5.6.2 Care plan" """
  Narrative containing the plan including proposals, goals, and order requests for monitoring, tracking, or improving the condition of the patient. In the future it is expected that the care plan could be provided in a structured and coded format.
  """
