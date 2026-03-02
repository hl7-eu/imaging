Instance: CompositionStructured
InstanceOf: CompositionEuImaging
Title: "Composition: structured report"
Description: "Example of a CompositionEuImaging showing the report with structured data."
Usage: #example
* status = #final
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
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
* extension[diagnosticreport-reference].valueReference.reference = "urn:uuid:11111111-2222-4333-8444-000000000002"

//R4* extension[version].valueString = "1"
* version = "1" // invented - not there in the report

* status = #final
* type = http://www.ama-assn.org/go/cpt#93351 "STRESS TTE COMPLETE"

* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#CUS "Cardiac Ultrasound"
* category[imaging] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* category[imaging-report] = $loinc#85430-7 //Diagnostic imaging report
  
* author[author].reference = "urn:uuid:11111111-2222-4333-8444-000000000005"
* author[organization].reference = "urn:uuid:11111111-2222-4333-8444-000000000007"

* title = "Transthoracic echocardiogram" // invented - not there in the report
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">Stress echocardiography composition narrative. See section narratives below.</div>"

///////////////////////////////////////////////////////////////////////
* section[imagingstudy]
  * title = "Imaging Study"
  * code = $loinc#18726-0 "Radiology studies (set)"
  * entry[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000004"

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
  * entry[vitals].reference = "urn:uuid:11111111-2222-4333-8444-000000000008"
  * entry[vitals].reference = "urn:uuid:11111111-2222-4333-8444-000000000009"
  * entry[vitals].reference = "urn:uuid:11111111-2222-4333-8444-00000000000a"
  * entry[vitals].reference = "urn:uuid:11111111-2222-4333-8444-00000000000b"

///////////////////////////////////////////////////////////////////////
* section[procedure]
  * title = "Procedure"
  * code = $loinc#55111-9 "Current imaging procedure descriptions Document"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">Unavailable</div>"

///////////////////////////////////////////////////////////////////////
* section[comparison]
  * title = "Comparison"
  * code = $loinc#18834-2 "Radiology Comparison study (narrative)"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">Nil Known</div>"
  
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
  * entry[finding].reference = "urn:uuid:11111111-2222-4333-8444-00000000000d"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000000e"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000000f"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000010"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000011"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000012"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000013"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000014"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000015"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000016"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000018"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000019"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001a"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001b"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001c"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001d"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001e"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000001f"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000020"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000021"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000022"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000023"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000024"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000025"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000026"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000027"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000029"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002a"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002b"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002c"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002d"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002e"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000030"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-00000000002f"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000017"
  * entry[finding][+].reference = "urn:uuid:11111111-2222-4333-8444-000000000028"
  
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
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\" lang=\"en-GB\">This was a normal stress echocardiogram. Nothing wrong with this patient. See you next year.</div>"

// /////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * title = "Recommendations"
  * code = $loinc#18783-1 "Radiology Study recommendation (narrative)"
  * entry[+].reference = "urn:uuid:11111111-2222-4333-8444-000000000031"
