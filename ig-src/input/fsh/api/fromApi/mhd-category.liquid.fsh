{% if isR4 %}
// =============================================================================
// DocumentReference Category ValueSet (Coarse Search)
// =============================================================================
// EHDS Regulation defined priority document categories for cross-border primary use

CodeSystem: EEHRxFDocumentPriorityCategoryCS
Id:         eehrxf-document-priority-category-cs
Title:      "EHDS Access: EEHRxF Document Priority Category CodeSystem"
Description: """
CodeSystem for priority document categories in EEHRxF as the document categories as defined in the EHDS regulation.

The codes defined here are directly linked to the Priority Categories defined in the EHDS regulation. The meaning of these codes is directly linked to the meaning given to the concepts in the EHDS regulation.

The EHDS Regulation initially defines six priority categories of electronic health data that all Member States must support first for cross-border primary use. These categories are explicitly listed in [Article 14](https://eur-lex.europa.eu/eli/reg/2025/327/oj#d1e2289-1-1) of Regulation (EU) 2025/327.

[Article 105](https://eur-lex.europa.eu/eli/reg/2025/327/oj#d1e6862-1-1) specifies the date when support for these priority categories is required: 26 March 2029 for categories (a), (b) and (c); 28 March 2031 for (d), (e) and (f).

EHDS empowers the EU Commission to make changes to the list of priority categories at any point in time by means of a Delegated Act (Article 14(2)). There will be a minimum 1-year lead time between the decision to add a new priority category and the initial date when support ahs to be implemented.

The definitions of the priority categories comes from [ANNEX I](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32025R0327#annex-I) of the EHDS Regulation.
"""
* ^experimental = false
* ^caseSensitive = true
* #Patient-Summaries "patient summaries" """
Electronic health data that include significant clinical facts related to an identified natural person and that are essential for the provision of safe and efficient healthcare to that person. The following information is part of a patient summary:

1. Personal details.
2. Contact information.
3. Information on insurance.
4. Allergies.
5. Medical alerts.
6. Vaccination/prophylaxis information, possibly in the form of a vaccination card.
7. Current, resolved, closed or inactive problems, including in an international classification coding.
8. Textual information related to medical history.
9. Medical devices and implants.
10. Medical or care procedures.
11. Functional status.
12. Current and relevant past medicines.
13. Social history observations related to health.
14. Pregnancy history.
15. Patient-provided data.
16. Observation results pertaining to the health condition.
17. Plan of care.
18. Information on a rare disease, such as details about the impact or characteristics of the disease.
"""
* #Electronic-Prescriptions "electronic prescriptions" "Electronic health data constituting a prescription for a medicinal product as defined in Article 3, point (k), of Directive 2011/24/EU."
* #Electronic-Dispensations "electronic dispensations" "Information on the supply of a medicinal product to a natural person by a pharmacy based on an electronic prescription."
* #Medical-Imaging "medical imaging studies and related imaging reports" "Electronic health data related to the use of or produced by technologies that are used to view the human body in order to prevent, diagnose, monitor or treat medical conditions."
* #Laboratory-Reports "medical test results, including laboratory and other diagnostic results and related reports" "Electronic health data representing results of studies performed in particular through in vitro diagnostics such as clinical biochemistry, haematology, transfusion medicine, microbiology, immunology and others, and including, where relevant, reports supporting the interpretation of the results."
* #Discharge-Reports "discharge reports" "Electronic health data related to a healthcare encounter or episode of care and including essential information about admission, treatment and discharge of a natural person."

ValueSet:  EEHRxFDocumentPriorityCategoryVS
Id:        eehrxf-document-priority-category-vs
Title:     "EHDS Access:EEHRxF Document Priority Category ValueSet"
Description: """
ValueSet for priority document categories in EEHRxF as the document categories as defined in the EHDS regulation. See [EEHRxFDocumentPriorityCategoryCS](CodeSystem-eehrxf-document-priority-category-cs.html) for the complete list and background.
"""
* ^experimental = false
* codes from system EEHRxFDocumentPriorityCategoryCS



// =============================================================================
// DocumentReference Type ValueSet (Clinical Precision)
// =============================================================================
// LOINC codes for specific document types - used for precise clinical identification
// This is NOT intended as a primary search parameter, but for client-side filtering

ValueSet:   EEHRxFDocumentTypeVS
Id:         eehrxf-document-type-vs
Title:      "EHDS Access:EEHRxF Document Type ValueSet"
Description: """
Document type codes for clinical precision in document identification.

This ValueSet contains LOINC codes for specific document types used in
DocumentReference.type. Unlike category (coarse search), type provides
clinical precision for identifying exact document kinds.

**Usage Pattern**:
- type is primarily used for client-side filtering after a broad category search
- type MAY be used as a search parameter when the specific document type is known
- Multiple type codes may apply to a single document (e.g., a discharge summary
  that is also a patient summary)

**MVP Document Types** (Priority Categories):
- Patient Summary (IPS)
- Discharge Summary (HDR)
- Laboratory Report
- Diagnostic Imaging Report

Note: This list will expand as additional priority categories are implemented.

JFM: This ValueSet should be made up of other ValueSets, with each of them assigned to one of the priority categories. Thus it is clear what document types are within each category. Is this the place to find all of them? https://confluence.hl7.org/spaces/HEU/pages/358255737/Implementation+Guides
"""
* ^experimental = false
* insert LOINCCopyrightForVS
* $loinc#60591-5 "Patient summary Document"
* $loinc#18842-5 "Discharge summary"
* $loinc#11502-2 "Laboratory report"
* $loinc#68604-8 "Radiology Diagnostic study note"
* $loinc#18748-4 "Diagnostic imaging study"



{% endif %}