Instance: DiagnosticReportStructured
InstanceOf: ImDiagnosticReport
Title: "DiagnosticReport for stress echo"
Description: "Example of a ImDiagnosticReport showing the report for a stress echo"
Usage: #example
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "dfkjewoieoijwoskdjf" // invented - not there in the report* 
* status = #final
* effectiveDateTime = "2003-06-01"
* language = #en-GB
* basedOn // order
  * identifier
    * type   = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "87654321" // invented - not there in the report
* code = http://www.ama-assn.org/go/cpt#93351 "transthoracic echocardiogram"
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#CUS "Cardiac Ultrasoundy"
* subject =  Reference( PatientStructuredReport )

* study[+] = Reference( ImagingStudStructuredReport )

* performer[organization] = Reference(OrganizationStructuredReport)
* resultsInterpreter[author] = Reference(PractitionerRoleStructuredReportAuthor)

* composition = Reference(CompositionStructured)

// HISTORY
* extension[patientHistory][+].valueReference = Reference( WeightObservation )
* extension[patientHistory][+].valueReference = Reference( HeightObservation )
* extension[patientHistory][+].valueReference = Reference( BPObservation )
* extension[patientHistory][+].valueReference = Reference( HRObservation )

// Procedure

// Comparison

// FINDINGS
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text = """**Stress Findings**\nNormal baseline electrocardiogram. There was a maximum 1.5mm ST segment depression. The patient exhibited a hypertensive response with stress."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text = """**Right Ventricle**\nThe right ventricle is not well visualized. There is mild right ventricular hypertrophy."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Atria**\nA patent foramen ovale is present and there is low risk for embolism. The left atrium is small."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """Mitral Valve\nThe mitral valve leaflets appear normal. There is no evidence of stenosis, fluttering, or prolapse. Mitral valve prolapse cannot be excluded. No significant mitral valve stenosis. The mitral regurgitant jet is posteriorly directed, which is consistent with anterior leaflet pathology. There is a porcine mitral valve."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Tricuspid Valve**\nThe tricuspid valve leaflets are thickened and/or calcified, but open well. There is a ruptured tricuspid valve chordae with a flail free wall leaflet. No significant tricuspid stenosis. There is mild to moderate tricuspid regurgitation. The prosthetic tricuspid valve is not well visualized."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Aortic Valve**\nThe aortic valve is trileaflet. The aortic valve is normal in structure and function. Cannot exclude aortic valvular vegetation. Hemodynamically significant valvular aortic stenosis cannot be excluded. No aortic regurgitation is present. The prosthetic aortic valve is not well visualized."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Pulmonic Valve**\nThe pulmonic valve is normal in structure and function. A pulmonic valvular vegetation cannot be excluded. Infundibular pulmonic stenosis is noted. There is no pulmonic valvular regurgitation. The prosthetic pulmonic valve is well‐seated."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Vessels**\nThe aortic root is not well visualized but is probably normal size. Type B aortic dissection. The pulmonary artery is normal size."""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text =  """**Pericardium**\nThere is pericardial thickening and/or a small pericardial effusion. Large left pleural effusion."""
* result[+] = Reference( RestWmsi01 )
* result[+] = Reference( RestWmsi02 )
* result[+] = Reference( RestWmsi03 ) 
* result[+] = Reference( RestWmsi04 )
* result[+] = Reference( RestWmsi05 )
* result[+] = Reference( RestWmsi06 )
* result[+] = Reference( RestWmsi07 )
* result[+] = Reference( RestWmsi08 )
* result[+] = Reference( RestWmsi09 )
* result[+] = Reference( RestWmsi10 )
* result[+] = Reference( RestWmsi12 )
* result[+] = Reference( RestWmsi13 )
* result[+] = Reference( RestWmsi14 )
* result[+] = Reference( RestWmsi15 )
* result[+] = Reference( RestWmsi16 )
* result[+] = Reference( RestWmsi17 )
* result[+] = Reference( StressWmsi01 )
* result[+] = Reference( StressWmsi02 )
* result[+] = Reference( StressWmsi03 ) 
* result[+] = Reference( StressWmsi04 )
* result[+] = Reference( StressWmsi05 )
* result[+] = Reference( StressWmsi06 )
* result[+] = Reference( StressWmsi07 )
* result[+] = Reference( StressWmsi08 )
* result[+] = Reference( StressWmsi09 )
* result[+] = Reference( StressWmsi10 )
* result[+] = Reference( StressWmsi12 )
* result[+] = Reference( StressWmsi13 )
* result[+] = Reference( StressWmsi14 )
* result[+] = Reference( StressWmsi15 )
* result[+] = Reference( StressWmsi16 )
* result[+] = Reference( StressWmsi17 )
* extension[finding].valueReference = Reference( StructuredKeyImageRest )
* extension[finding].valueReference = Reference( StructuredKeyImageStress )

// IMPRESSIONS
* conclusion = """
This was a normal stress echocardiogram.
Nothing wrong with this patient
See you next year.
"""
// RECOMMENDATION
* extension[recommendation].valueReference = Reference( ComeBackNextYearServiceRequest )

* presentedForm
  * contentType = #application/pdf
  * language = #de-DE
  * pages = 1
  * url = "./Binary/structured-pdf"


Instance: BinaryStructuredReport
InstanceOf: Binary
Title: "Binary: Structured report pdf"
* id = "structured-pdf"
* contentType = #application/pdf
// * data = "ig-loader-9df9cc92-0f09-4dbb-8d5d-e74bd9eaac3a.pdf"
* data = "ig-loader-1.3.46.670589.58.10.10562925256214266678.11674839624289915183.pdf"
