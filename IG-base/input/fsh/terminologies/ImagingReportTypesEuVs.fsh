ValueSet:      ImagingReportTypesEuVS
Id:	       im-reportType-eu-lab
Title:	       "Imaging Report Types"
Description:   """Imaging Report Types.
This version includes only one code as suggested by the eHN guideline.
To add specificity the https://loinc.org/kb/users-guide/loinc-rsna-radiology-playbook-user-guide/ could be incorporated as the source of imaging study/report types."""

* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
// * $loinc#81220-6 "Diagnostic imaging report"

* include codes from system $loinc where ancestor = #18726-0
// * exclude $loinc#18726-0 "radiology studies (set)"