Instance: CompositionStructured
InstanceOf: ImComposition
Title: "Composition for stress test ultrasound"
Description: "Example of a ImComposition showing the report with structured data."
Usage: #example
* status = #final
* subject = Reference( PatientStructuredReport )
* date = "2025-09-05T02:22:00.000Z" 
* language = #en-GB
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "dfkjewoieoijwoskdjf" // invented - not there in the report* 
* extension[basedOn] // order
  * url = "http://hl7.org/fhir/StructureDefinition/event-basedOn"
  * valueReference
    * type = #ServiceRequest
    * identifier
      * type   = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
      * system = "http://example.org/myhosptital/accessionsystem"
      * value  = "87654321" // invented - not there in the report
* extension[diagnosticreport-reference].valueReference = Reference ( DiagnosticReportStructured )

* version = "1" // invented - not there in the report
* status = #final
* type = http://www.ama-assn.org/go/cpt#93351 "transthoracic echocardiogram"

* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#CUS "Cardiac Ultrasoundy"

* author[author] = Reference(PractitionerRoleStructuredReportAuthor)
* author[organization] = Reference(OrganizationStructuredReport)

* title = "Transthoracic echocardiogram" // invented - not there in the report

///////////////////////////////////////////////////////////////////////
* section[imagingstudy]
  * title = "Imaging Study"
  * code = $loinc#18726-0 "Radiology studies (set)"
  * entry[+] = Reference(ImagingStudStructuredReport)

///////////////////////////////////////////////////////////////////////

* section[order]
  * title = "Order"
  * code = $loinc#55115-0 "Requested imaging studies information Document"
  * entry[+]
    * type = #ServiceRequest
    * identifier
      * type   = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
      * system = "http://example.org/myhosptital/accessionsystem"
      * value  = "87654321" // invented - not there in the report

///////////////////////////////////////////////////////////////////////
* section[history]
  * title = "History"
  * code = $loinc#11329-0 "History general Narrative - Reported"
  * entry[+] = Reference( WeightObservation )
  * entry[+] = Reference( HeightObservation )
  * entry[+] = Reference( BPObservation )
  * entry[+] = Reference( HRObservation )

///////////////////////////////////////////////////////////////////////
* section[procedure]
  * title = "Procedure"
  * code = $loinc#55111-9 "Current imaging procedure descriptions Document"
  * emptyReason = #unavailable "Unavailable"

///////////////////////////////////////////////////////////////////////
* section[comparison]
  * title = "Comparison"
  * code = $loinc#18834-2 "Radiology Comparison study (narrative)"
  * emptyReason = #nilknown "Nil Known"
  
///////////////////////////////////////////////////////////////////////
* section[findings]
  * title = "Findings"
  * code = $loinc#59776-5 "Findings"

  * extension[note][+]
    * valueAnnotation.text =
 """**Stress Findings**\nNormal baseline electrocardiogram. There was a maximum 1.5mm ST segment depression. The patient exhibited a hypertensive response with stress."""
  * extension[note][+]
    * valueAnnotation.text =
 """**Right Ventricle**\nThe right ventricle is not well visualized. There is mild right ventricular hypertrophy."""
  * extension[note][+]
    * valueAnnotation.text =
  """**Atria**\nA patent foramen ovale is present and there is low risk for embolism. The left atrium is small."""
  * extension[note][+]
    * valueAnnotation.text =
  """Mitral Valve\nThe mitral valve leaflets appear normal. There is no evidence of stenosis, fluttering, or prolapse. Mitral valve prolapse cannot be excluded. No significant mitral valve stenosis. The mitral regurgitant jet is posteriorly directed, which is consistent with anterior leaflet pathology. There is a porcine mitral valve."""
  * extension[note][+]
    * valueAnnotation.text =
  """**Tricuspid Valve**\nThe tricuspid valve leaflets are thickened and/or calcified, but open well. There is a ruptured tricuspid valve chordae with a flail free wall leaflet. No significant tricuspid stenosis. There is mild to moderate tricuspid regurgitation. The prosthetic tricuspid valve is not well visualized."""
  * extension[note][+]
    * valueAnnotation.text =
  """**Aortic Valve**\nThe aortic valve is trileaflet. The aortic valve is normal in structure and function. Cannot exclude aortic valvular vegetation. Hemodynamically significant valvular aortic stenosis cannot be excluded. No aortic regurgitation is present. The prosthetic aortic valve is not well visualized."""
  * extension[note][+]
    * valueAnnotation.text =
  """**Pulmonic Valve**\nThe pulmonic valve is normal in structure and function. A pulmonic valvular vegetation cannot be excluded. Infundibular pulmonic stenosis is noted. There is no pulmonic valvular regurgitation. The prosthetic pulmonic valve is well‐seated."""
  * extension[note][+]
    * valueAnnotation.text =
  """**Vessels**\nThe aortic root is not well visualized but is probably normal size. Type B aortic dissection. The pulmonary artery is normal size."""
  * extension[note][+]
    * valueAnnotation.text =
  """**Pericardium**\nThere is pericardial thickening and/or a small pericardial effusion. Large left pleural effusion."""
  * entry[+] = Reference( RestWmsi01 )
  * entry[+] = Reference( RestWmsi02 )
  * entry[+] = Reference( RestWmsi03 ) 
  * entry[+] = Reference( RestWmsi04 )
  * entry[+] = Reference( RestWmsi05 )
  * entry[+] = Reference( RestWmsi06 )
  * entry[+] = Reference( RestWmsi07 )
  * entry[+] = Reference( RestWmsi08 )
  * entry[+] = Reference( RestWmsi09 )
  * entry[+] = Reference( RestWmsi10 )
  * entry[+] = Reference( RestWmsi12 )
  * entry[+] = Reference( RestWmsi13 )
  * entry[+] = Reference( RestWmsi14 )
  * entry[+] = Reference( RestWmsi15 )
  * entry[+] = Reference( RestWmsi16 )
  * entry[+] = Reference( RestWmsi17 )
  * entry[+] = Reference( StressWmsi01 )
  * entry[+] = Reference( StressWmsi02 )
  * entry[+] = Reference( StressWmsi03 ) 
  * entry[+] = Reference( StressWmsi04 )
  * entry[+] = Reference( StressWmsi05 )
  * entry[+] = Reference( StressWmsi06 )
  * entry[+] = Reference( StressWmsi07 )
  * entry[+] = Reference( StressWmsi08 )
  * entry[+] = Reference( StressWmsi09 )
  * entry[+] = Reference( StressWmsi10 )
  * entry[+] = Reference( StressWmsi12 )
  * entry[+] = Reference( StressWmsi13 )
  * entry[+] = Reference( StressWmsi14 )
  * entry[+] = Reference( StressWmsi15 )
  * entry[+] = Reference( StressWmsi16 )
  * entry[+] = Reference( StressWmsi17 )
  * entry[+] = Reference( StructuredKeyImageStress )
  * entry[+] = Reference( StructuredKeyImageRest )
  
// /////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * title = "Impression"
  * code = $loinc#19005-8 "Radiology Imaging study [Impression] (narrative)"
  * extension[note][+]
    * valueAnnotation.text = 
"""
This was a normal stress echocardiogram.
Nothing wrong with this patient
See you next year.
"""

// /////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * title = "Recommendations"
  * code = $loinc#18783-1 "Radiology Study recommendation (narrative)"
  * entry[+] = Reference( ComeBackNextYearServiceRequest )
