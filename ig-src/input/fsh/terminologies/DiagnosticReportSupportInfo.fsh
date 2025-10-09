CodeSystem: DiagnosticReportSupportingInfoCodeSystem
Id: codesystem-diagnostic-report-support-info
Title: "Diagnostic Report Support Info Code System"
Description: "Code system for codes to be used in `DiagnosticReport.supportInfo` for imaging reports."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a

* #imaging-procedure "Imaging Procedure"
    "The procedure in which the imaging study was performed supportInfo codesCodes to be used in `DiagnosticReport.supportInfo` for imaging reports."

ValueSet: DiagnosticReportSupportingInfoVCodes
Id: valueset-diagnosticreport-report-support-info
Title: "DiagnosticReport supportInfo codes"
Description: "Codes to be used in `DiagnosticReport.supportInfo` for imaging reports."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* include codes from system DiagnosticReportSupportingInfoCodeSystem

