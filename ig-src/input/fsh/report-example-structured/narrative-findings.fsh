Instance: NarrativeFindingsAll
InstanceOf: ObservationNarrativeReport
Title: "Observation: Narrative findings - all findings"
Description: "All narrative findings text from the report in one Observation."
Usage: #example
* status = #final
* subject = Reference(PatientStructuredReport)
* effectiveDateTime = "2003-06-01"
* code = $loinc#18782-3 "Radiology Study observation (narrative)"
* basedOn[ServiceRequestOrderEuImagingaccession]
  * identifier
    * type
      * coding[+][v2-0203-coding] = $v2-0203#ACSN
      * coding[+][dcm] = http://dicom.nema.org/resources/ontology/DCM#121022 "Accession Number"
    * system = "http://example.org/myhosptital/accessionsystem"
    * value = "87654321"
* valueString = """**Stress Findings**\nNormal baseline electrocardiogram. There was a maximum 1.5mm ST segment depression. The patient exhibited a hypertensive response with stress.\n\n**Right Ventricle**\nThe right ventricle is not well visualized. There is mild right ventricular hypertrophy.\n\n**Atria**\nA patent foramen ovale is present and there is low risk for embolism. The left atrium is small.\n\nMitral Valve\nThe mitral valve leaflets appear normal. There is no evidence of stenosis, fluttering, or prolapse. Mitral valve prolapse cannot be excluded. No significant mitral valve stenosis. The mitral regurgitant jet is posteriorly directed, which is consistent with anterior leaflet pathology. There is a porcine mitral valve.\n\n**Tricuspid Valve**\nThe tricuspid valve leaflets are thickened and/or calcified, but open well. There is a ruptured tricuspid valve chordae with a flail free wall leaflet. No significant tricuspid stenosis. There is mild to moderate tricuspid regurgitation. The prosthetic tricuspid valve is not well visualized.\n\n**Aortic Valve**\nThe aortic valve is trileaflet. The aortic valve is normal in structure and function. Cannot exclude aortic valvular vegetation. Hemodynamically significant valvular aortic stenosis cannot be excluded. No aortic regurgitation is present. The prosthetic aortic valve is not well visualized.\n\n**Pulmonic Valve**\nThe pulmonic valve is normal in structure and function. A pulmonic valvular vegetation cannot be excluded. Infundibular pulmonic stenosis is noted. There is no pulmonic valvular regurgitation. The prosthetic pulmonic valve is well-seated.\n\n**Vessels**\nThe aortic root is not well visualized but is probably normal size. Type B aortic dissection. The pulmonary artery is normal size.\n\n**Pericardium**\nThere is pericardial thickening and/or a small pericardial effusion. Large left pleural effusion."""
