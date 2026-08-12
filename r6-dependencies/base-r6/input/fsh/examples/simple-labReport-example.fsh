Instance: CompositionLabExample
InstanceOf: CompositionEuCore
Title: "Composition Example"
Description: "Example of a Laboratory Report Composition conforming to the Composition (EU Core) profile."
* extension[information-recipient]
  * valueReference = Reference(OrganizationExample)
    * display = "Nuovo Ospedale S.Agostino (MO)"
* extension[diagnosticReport].valueReference = Reference(DiagnosticReportLabExample)
* id = "26032a57-083a-4ddf-b019-e566ae02f740"
* identifier.system = "http://example.org/composition-ids"
* identifier.value = "c030702.TSTSMN63A01F205H.20220325112426.TSS1Tkju"
* status = #final
* category = $loinc#18719-5 "Chemistry studies (set)"
* type = http://loinc.org#11502-2 "Laboratory report"
* type.text = "Laboratorní zpráva"
* subject = Reference(PatientExample)
* date = "2022-03-30T11:24:26+01:00"
* author[+] = Reference(PractitionerRoleEuCoreExample)
* title = "Laboratorní zpráva"
* attester[+].mode = $composition-attestation-mode#legal
* attester[=].time = "2022-03-25T11:00:00+01:00"
* attester[=].party = Reference(PractitionerRoleEuCoreExample)
* custodian.display = "Example Health Organization"
* section[+].title = "Laboratory examinations"
* section[=].code = $loinc#26436-6 "Laboratory studies (set)"
* section[=].code.text = "Laboratory studies"
* section[=].title = "Urine examinations"  // this title should be aligned with ibservation codes
* section[=].code = http://loinc.org#18729-4 "Urinalysis studies (set)"
* section[=].code.text = "ESAMI DELLE URINE"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table id=\"nota1\">
<thead><tr><th>Date</th><th>Test</th><th>Value</th><th>Unit(s)</th><th>Reference Range</th><th>Interpretation</th></tr></thead>
<tbody>
<tr><td>2023-03-27</td><td>Urea (U) [Moles/Vol]</td><td>310</td><td>mmol/L</td><td>67 - 580 mmol/L</td><td>Significantly low</td></tr>
</tbody>
</table></div>"
* section[=].entry = Reference(ObservationLabResultExample)
Instance: DiagnosticReportLabExample
InstanceOf: DiagnosticReportEuCore
Title: "DiagnosticReport Example"
Description: "Example of a Laboratory Report DiagnosticReport conforming to the DiagnosticReport (EU Core) profile."
* id = "5679723c-4fae-4ba7-9f09-5438a827bfda"
* identifier.system = "http://example.org/composition-ids"
* identifier.value = "c030702.TSTSMN63A01F205H.20220325112426.TSS1Tkju"
* composition = Reference(CompositionLabExample)
* status = #registered
* basedOn = Reference(ServiceRequestExample)
* category[+] = $loinc#18719-5 "Chemistry studies (set)"
* code = $loinc#11502-2 "Laboratory report"
* subject = Reference(PatientExample)
* specimen.display = "Urine specimen"
* result[+] = Reference(ObservationLabResultExample)
Instance: ServiceRequestExample
InstanceOf: ServiceRequest
Title: "ServiceRequest Example"
Description: "Laboratory Report ServiceRequest resource used by the DiagnosticReport example."
* id = "1d4cbcd1-e0d3-49b6-92d8-1893da8d08e1"
* identifier.system = "http://example.org/lis-order"
* identifier.value = "123456"
* requisition.system = "http://example.org/gp-order"
* requisition.value = "0901001234567234"
* status = #active
* intent = #order
* category = $sct#108252007 "Laboratory procedure"
* priority = #asap
* code = $loinc#14957-5 "Microalbumin [Mass/volume] in Urine"
* code.concept.text = "Microalbumin Massa/Volume in Urine"
* subject = Reference(PatientExample)
Instance: ObservationLabResultExample
InstanceOf: MedicalTestResultEuCore
Title: "Observation Example"
Description: "Example of a Laboratory Result Observation conforming to the Medical Test Result (EU Core) profile."
* id = "763f7902-8103-4d10-8bd1-546a726d43ee"
* status = #final
* code.coding[+] = http://loinc.org#22700-9 "Urea [Moles/volume] in Urine"
* code.text = "Urea (U) [Moles/Vol]"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* method = $sct#70621000052105 "Spectrophotometric technique"
* subject = Reference(PatientExample)
* effectiveDateTime = "2023-03-27T11:24:26+01:00"
* performer[+].display = "Jan Laborant" // ToDo: consider cardinality
* valueQuantity.value = 310
* valueQuantity.system = $ucum
* valueQuantity.code = $ucum#mmol/L
* valueQuantity.unit = "mmol/L"
* interpretation = $v3-ObservationInterpretation#LU "Significantly low"
* specimen.display = "Urine specimen"
* referenceRange.low.value = 67
* referenceRange.low.unit = "mmol/L"
* referenceRange.high.value = 580
* referenceRange.high.unit = "mmol/L"
* referenceRange.type = $referencerange-meaning#normal "Normal Range"
