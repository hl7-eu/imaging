{% if isR4 %}
Profile: EehrxfMhdDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Title: "EHDS Access: EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile.

**Search Strategy**:
- `category`: Use [ValueSet EEHRxF Document Priority Category ValueSet](ValueSet-eehrxf-document-priority-category-vs.html) (EHDS Priority Categories) for coarse document filtering (Patient Summaries, Discharge Reports, etc.)
- `type`: Use EEHRxFDocumentTypeVS (LOINC) for clinical precision (specific document types)
- `context.practiceSetting`: SHOULD be used to differentiate lab vs imaging reports when category=REPORTS

"""
* insert SetFmmAndStatusRule( 1, draft )
* category from EEHRxFDocumentPriorityCategoryVS (preferred)
* type from EEHRxFDocumentTypeVS (preferred)
* context.practiceSetting MS
* context.practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"
* subject 1..1
{{R4}}* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core )
{{R5}}* subject only Reference( $EuPatient )
* date 1..1
* custodian 1..1

{% endif %}