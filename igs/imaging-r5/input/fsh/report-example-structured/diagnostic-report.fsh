Instance: DiagnosticReportStructured
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: structured report"
Description: "Example of a DiagnosticReportEuImaging showing the report for a stress echo"
Usage: #example
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "dfkjewoieoijwoskdjf" // invented - not there in the report* 
* status = #final
* effectiveDateTime = "2003-06-01"
* language = #en-GB
* basedOn // order
  * type = #ServiceRequest
  * identifier
    * type   = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "87654321" // invented - not there in the report
* code = http://www.ama-assn.org/go/cpt#93351 "STRESS TTE COMPLETE"
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#CUS "Cardiac Ultrasound"
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
* extension[anatomical-region].valueCodeableConcept.coding = $sct#67734004 

//R4* imagingStudy[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000004"
* study[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000004"

* performer[organization].reference = "urn:uuid:11111111-2222-4333-8444-000000000007"
* resultsInterpreter[author].reference = "urn:uuid:11111111-2222-4333-8444-000000000005"

//R4* extension[composition].valueReference.reference = "urn:uuid:11111111-2222-4333-8444-000000000001"
* composition.reference = "urn:uuid:11111111-2222-4333-8444-000000000001"

// HISTORY
* extension[patientHistory][+].valueReference.reference = "urn:uuid:11111111-2222-4333-8444-000000000008"
* extension[patientHistory][+].valueReference.reference = "urn:uuid:11111111-2222-4333-8444-000000000009"
* extension[patientHistory][+].valueReference.reference = "urn:uuid:11111111-2222-4333-8444-00000000000a"
* extension[patientHistory][+].valueReference.reference = "urn:uuid:11111111-2222-4333-8444-00000000000b"

// Procedure

// Comparison

// FINDINGS
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text = """**Stress Findings**\nNormal baseline electrocardiogram. There was a maximum 1.5mm ST segment depression. The patient exhibited a hypertensive response with stress."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text = """**Right Ventricle**\nThe right ventricle is not well visualized. There is mild right ventricular hypertrophy."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Atria**\nA patent foramen ovale is present and there is low risk for embolism. The left atrium is small."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """Mitral Valve\nThe mitral valve leaflets appear normal. There is no evidence of stenosis, fluttering, or prolapse. Mitral valve prolapse cannot be excluded. No significant mitral valve stenosis. The mitral regurgitant jet is posteriorly directed, which is consistent with anterior leaflet pathology. There is a porcine mitral valve."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Tricuspid Valve**\nThe tricuspid valve leaflets are thickened and/or calcified, but open well. There is a ruptured tricuspid valve chordae with a flail free wall leaflet. No significant tricuspid stenosis. There is mild to moderate tricuspid regurgitation. The prosthetic tricuspid valve is not well visualized."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Aortic Valve**\nThe aortic valve is trileaflet. The aortic valve is normal in structure and function. Cannot exclude aortic valvular vegetation. Hemodynamically significant valvular aortic stenosis cannot be excluded. No aortic regurgitation is present. The prosthetic aortic valve is not well visualized."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Pulmonic Valve**\nThe pulmonic valve is normal in structure and function. A pulmonic valvular vegetation cannot be excluded. Infundibular pulmonic stenosis is noted. There is no pulmonic valvular regurgitation. The prosthetic pulmonic valve is well‐seated."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Vessels**\nThe aortic root is not well visualized but is probably normal size. Type B aortic dissection. The pulmonary artery is normal size."""
//R4* extension[note][+].valueAnnotation
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Pericardium**\nThere is pericardial thickening and/or a small pericardial effusion. Large left pleural effusion."""
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000000d"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000000e"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000000f"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000010"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000011"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000012"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000013"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000014"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000015"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000016"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000018"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000019"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001a"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001b"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001c"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001d"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001e"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001f"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000020"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000021"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000022"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000023"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000024"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000025"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000026"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000027"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000029"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002a"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002b"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002c"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002d"
* result[+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002e"

* media[+]
  * comment = "Rest"
  * link.reference = "urn:uuid:11111111-2222-4333-8444-00000000002f"
* media[+]
  * comment = "Stress"
  * link.reference = "urn:uuid:11111111-2222-4333-8444-000000000030"

// IMPRESSIONS
* conclusion = """
This was a normal stress echocardiogram.
Nothing wrong with this patient
See you next year.
"""
// RECOMMENDATION
* extension[recommendation].valueReference.reference = "urn:uuid:11111111-2222-4333-8444-000000000031"

* presentedForm
  * contentType = #application/pdf
  * language = #de-DE
  * pages = 3
  * url = "urn:uuid:11111111-2222-4333-8444-000000000032"


Instance: BinaryStructuredReport
InstanceOf: Binary
Title: "Binary: Structured report"
Description: "Binary resource holding the report pdf."
Usage: #example
* id = "structured-pdf"
* contentType = #application/pdf
// * data = "ig-loader-9df9cc92-0f09-4dbb-8d5d-e74bd9eaac3a.pdf"
* data = "ig-loader-1.3.46.670589.58.10.10562925256214266678.11674839624289915183.pdf"
