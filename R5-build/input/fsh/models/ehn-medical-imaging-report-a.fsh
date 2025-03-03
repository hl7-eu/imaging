Logical: MedicalImagingReportEhn
Id: ehn-medical-imaging-report
Title: "A Medical Imaging Report (eHN)"
Description: "Medical Imaging Report"
* insert SetFmmAndStatusRule( 2, informative)
* header 1..1 MedicalImagingReportHeaderEhn "Header"
* orderInformation 1..1 MedicalImagingReportOrderEhn "A.2 Order Information"
* orderReason 1..1 MedicalImagingReportOrderReasonEhn "A.3 Order Reason"
* specimenInformation 0..1 MedicalImagingReportOrderSpecimenInformationEhn "A.4 Specimen information"
* examinationReport 1..1 MedicalImagingReportOrderExaminationReportEhn "A.5 Examination Report"
* media 0..* MedicalImagingReportOrderMediaEhn "A.6 Key images associated with this report"
* comparisonStudy 0..1 MedicalImagingReportOrderComparisonStudyEhn "A.7 Comparison study"
* presentedForm 0..1 MedicalImagingReportOrderPresentedFormEhn "A.8 Presented form"
