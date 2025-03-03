// Mapping: A1-3-HealthInsurenceAndPaymentInformationToImCoverage
// Source: MedicalImagingReportHeaderHealthInsuranceAndPaymentInformationEhn
// Target: "http://130.145.232.202:8081/StructureDefinition-im-order.html"
// * providerCode -> "insurer" 
//   "A.1.3.1 Health Insurance Provider Code" 
// * providerName -> "insurer"
//   "A.1.3.2 Health insurance provider name"
// * policyNumber -> "identifier"
//   "A.1.3.3 Health insurance policy number"

// // Mapping: A1-3-HealthInsurenceAndPaymentInformationToImCoverage
// // Source: MedicalImagingReportHeaderHealthInsuranceAndPaymentInformationEhn
// // Target: ImHealthInsuranceProvider
// // * providerName -> name
// // * providerCode -> identifier

// // Mapping: A1-3-HealthInsurenceAndPaymentInformationToImCoverage
// // Source: MedicalImagingReportHeaderHealthInsuranceAndPaymentInformationEhn
// // Target: ImOrder
// // * insuranceAndPayment -> insurance

// // Mapping: A1-3-HealthInsurenceAndPaymentInformationToImCoverage
// // Source: MedicalImagingReportHeaderHealthInsuranceAndPaymentInformationEhn
// // Target: ImComposition
// // * insuranceAndPayment -> section[order].entry[order]
// // * insuranceAndPayment -> section[order].entry[insurance]
// //       * display = "Insurrance coverage"
// //       * relationship = #equivalent

// //   * element[+]
// //     * code = #insuranceAndPayment
// //     * display = "A.1.3 Health insurance"
// //     * target 
// //       * code = #section[order].entry[insurranceprovider]
// //       * display = "Insurrance Provider"
// //       * relationship = #equivalent
