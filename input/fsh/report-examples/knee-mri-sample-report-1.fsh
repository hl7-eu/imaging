// original report: https://drive.google.com/file/d/1LhscANABX6_TKrZBfq9cDq2Sqzg2MBI_/view?usp=drive_link

Instance: ImagingReport-knee-mri-example
InstanceOf: ImReport
Title: "Example ImagingStudy Manifest"
Description: "Example ImagingStudy Manifest"
Usage: #example
* type = #document
* timestamp = 1993-11-29T12:36:56+00:00
* entry[+]
  * fullUrl = "Composition/1"
  * resource = Composition-knee-mri-exmaple
* entry[+]
  * fullUrl = "ImagingStudy/1"
  * resource = ImagingStudy-knee-mri-example
* entry[+]
  * fullUrl = "Patient/1"
  * resource = Patient-knee-mri-example
* entry[+]
  * fullUrl = "Practitioner/1"
  * resource = Practitioner-knee-mri-example
* entry[+]
  * fullUrl = "Organization/1"
  * resource = Organization-knee-mri-example
* entry[+]
  * fullUrl = "ServiceRequest/1"
  * resource = ServiceRequest-knee-mri-example
* entry[+]
  * fullUrl = "Procedure/1"
  * resource = ImProcedure-knee-mri-example
* entry[+]
  * fullUrl = "Impression/1"
  * resource = ImImpression-knee-mri-example
* entry[+]
  * fullUrl = "Finding/1"
  * resource = ImFinding-knee-mri-example
* entry[+]
  * fullUrl = "DiagnosticReport/1"
  * resource = DiagnosticReport-knee-mri-example

// Profile: ImReport
// Parent: Bundle
// Title: "Document Bundle for Imaging Report"
// Description: "Document Bundle for Imaging Report"
// * insert SetFmmAndStatusRule( 1, draft )
// * type = #document
// * entry 2..*
//   * insert SliceElement( #profile, resource )
// * entry contains 
//     imComposition 1..1 and
//     imDiagnosticReport 1..1
// * entry[imComposition]
//   * resource only ImComposition
// * entry[imDiagnosticReport]
//   * resource only ImDiagnosticReport

Instance: Composition-knee-mri-exmaple
InstanceOf: ImComposition
Title: "Brain MRI example"
Description: "This is an example of a EU Imaging IG Composition for a Brain MRI report."
* status = #final
* language = #en

* extension[diagnosticreport-reference].valueReference = Reference(DiagnosticReport/1)
//* extension[basedOn].valueReference = Reference(ImOrder-example)
//* extension[informationRecipient].valueReference = Reference(ImInformationRecipient-example)

* subject = Reference(Patient/1)

* identifier
  * system = "http://citymedial-imagecenter.org/"
  * value = "123456"

* custodian = Reference( Organization/1 )

// No attester in the original report
// * attester[legalAuthenticator].mode = http://hl7.org/fhir/composition-attestation-mode#legal
// * attester[legalAuthenticator].party = Reference(Practitioner/1)
// * attester[legalAuthenticator].time = "2021-01-01T00:00:00Z"

// * attester[resultValidator].mode = http://hl7.org/fhir/composition-attestation-mode#professional
// * attester[resultValidator].party = Reference(Practitioner/1)
// * attester[resultValidator].time = "2021-01-01T00:00:00Z"

* author[author] = Reference(Practitioner/1)

// value set code is inverted manifest with report
* type = Hl7EuDocumentTypes#imaging-report-v0-0-1

* category[imaging] = http://loinc.org#18748-4 "Diagnostic imaging study"

// not sure what to enconde in theese two
* event[imagingstudy].detail = Reference(ImagingStudy/1)
* event[procedure].detail = Reference(Procedure/1)

* date = "2021-01-01T00:00:00Z"

* title = "MRI LEFT KNEE"


// Imaging Study Section

* section[imagingstudy].title = "Technique"
* section[imagingstudy].code.coding = http://loinc.org#18726-0
* section[imagingstudy].text
  * status = #generated
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
Axial PD fat sat, coronal T1, coronal PD fat sat, coronal T2 fat sat, sagittal PD, and sagittal PD fat sat images were performed
</div>
"""
* section[imagingstudy].entry[0] = Reference(ImagingStudy/1)


// Order Section

* section[order].title = "Clinical information"
* section[order]
  * code.coding = http://loinc.org#55115-0 "Requested imaging studies information Document"
// complete note
  * extension[note].valueAnnotation.text = """
Evaluate medial left knee pain. Injured playing football 3 weeks ago. Positive Lachman test. Evaluate ACL tear. 
Evaluate for meniscal tear
"""
// .text takes de same as note here. Missing the other values that come from other resources
  * text
    * status = #generated
    * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
Evaluate medial left knee pain. Injured playing football 3 weeks ago. Positive Lachman test. Evaluate ACL tear. 
Evaluate for meniscal tear
</div>
"""
  * entry[0] = Reference(ServiceRequest/1)

// History Section

* section[history].title = "History"
* section[history]
  * code.coding = http://loinc.org#11329-0 "History"
// history is inside clinical information ... Maybe LLM to split?
* section[history].extension[note].valueAnnotation.text = """
Evaluate medial left knee pain. Injured playing football 3 weeks ago. Positive Lachman test. Evaluate ACL tear. 
Evaluate for meniscal tear
"""
* section[history].text
  * status = #generated
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 Injured playing football 3 weeks ago.
</div>
"""
* section[history].entry[0] = Reference(Impression/1)

// Procedure Section
// !asigning the Contrast title to this section as is rendered in the pdf. Information is Tile+text, strange...
* section[procedure].title = "Contrast"
* section[procedure]
  * code.coding = http://loinc.org#55111-9 "Procedure"
* section[procedure].extension[note].valueAnnotation.text = """
None utilized.
"""
* section[procedure].text
  * status = #generated
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
None utilized.
</div>
"""
* section[procedure].entry[0] = Reference(Procedure/1)

// Comparison Section
* section[comparison].title = "Comparison"
* section[comparison].code.coding = http://loinc.org#18834-2 "Comparison"
// ! add not available to preferred code system
* section[comparison].emptyReason = http://loinc.org#LA4720-4 "None available"
* section[comparison].text
  * status = #generated
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
None available
</div>
"""

// Findings Section
* section[findings].title = "Findings"
* section[findings].code.coding = http://loinc.org#59776-5 "Findings"
* section[findings].extension[note].valueAnnotation.text = """
None utilized.
"""
* section[findings].text
  * status = #generated
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
FLUID: Moderate effusion.
MENISCI:
Medial: No evidence of a tear.
Lateral: Peripheral vertical tear in the posterior horn of the lateral meniscus at the ligament of Wrisberg 
attachment.
CRUCIATE LIGAMENTS: Complete tear of the ACL, which is torn in the mid substance. The posterior cruciate 
ligament is intact.
COLLATERAL LIGAMENTS: Grade 1 to grade 2 MCL sprain. There is edema in the deep fibers, as well as 
some in the in the superficial fibers and in the adjacent soft tissues. Edema extends anteriorly to the region of the 
medial patellofemoral ligament attachment to the adductor tubercle where the injury is intermediate grade in 
character. The lateral collateral ligament complex is intact. Edema is noted in the popliteus muscle belly and 
muscle-tendon junction as well as the popliteal fibular ligament region also reflective of an intermediate grade 
injury.
EXTENSOR MECHANISM: Intact.
CARTILAGE:
Patellofemoral compartment: No chondral defect or area of high-grade chondral loss.
Medial tibiofemoral compartment: No chondral defect or area of high-grade chondral loss.
Lateral tibiofemoral compartment: No chondral defect or area of high-grade chondral loss.
BONE MARROW: Bone marrow contusions are seen in the posterior medial and lateral proximal tibia as well as 
the mid lateral femoral condyle extending anteriorly. There is a contusion in the anterior lateral proximal tibia and 
as well in the proximal fibula. There is an additional contusion along the inferior pole of the patella.
</div>
"""
* section[findings].entry[0] = Reference(Finding/1)
// Additional findings
// * section[findings].entry[+] = Reference(ImFinding-example)

// Impression Section
* section[impression].title = "Impressions"
* section[impression].code.coding = http://loinc.org#19005-8 "Impression"
* section[impression].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
1. Moderate effusion.
2. Peripheral vertical tear in the posterior horn of the lateral meniscus at the ligament of Wrisberg attachment.
3. Complete tear of the ACL.
4. Grade 1 to grade 2 MCL complex sprain as described above.
5. Edema extends anteriorly to the region of the medial patellofemoral ligament attachment to the adductor 
tubercle where the injury is intermediate grade in character. Edema is noted in the popliteus muscle belly and 
muscle tendon junction as well as the popliteal fibular ligament region also reflective of an intermediate grade 
injury.
6. Bone marrow contusions are seen in the posterior medial and lateral proximal tibia as well as the mid lateral 
femoral condyle extending anteriorly. There is a contusion in the anterior lateral proximal tibia and as well in the 
proximal fibula. There is an additional contusion along the inferior pole of the patella.
</div>
"""
* section[impression].entry[0] = Reference(Impression/1)
// no ImageSelection in the original report
//* section[impression].entry[+] = Reference(ImKeyImagesSelection-example)

// Recommendation Section
* section[recommendation].title = "Recommendations"
* section[recommendation].code.coding = http://loinc.org#18783-1 "Recommendation"
* section[recommendation].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Communication</h3>
 <ul>
 <li><strong>Critical findings:</strong> None.</li>
 <li>Routine results conveyed to the referring physician, Dr. John Doe, via electronic medical record at <strong>[TIME]</strong> on <strong>[DATE]</strong>.</li>
 <li>No urgent follow-up required. The patient will be advised to follow up with their neurologist for further management.</li>
 </ul>
</div>
"""

// Communication Section
* section[communication].title = "Communications"
* section[communication].code.coding = http://loinc.org#18783-1 "Communication"
* section[communication].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Communication</h3>
 <ul>
 <li><strong>Critical findings:</strong> None.</li>
 <li>Routine results conveyed to the referring physician, Dr. John Doe, via electronic medical record at 17:50 on 10/10.</li>
 <li>No urgent follow-up required. The patient will be advised to follow up with their neurologist for further management.</li>
 </ul>
</div>
"""


// PATIENT
Instance: Patient-knee-mri-example
InstanceOf: ImPatient
Title: "Example Patient"
Usage: #inline
* id = "patient"
* identifier[0].use = #usual
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #MR
* identifier[0].type.coding[0].display = "Medical Record number"
* identifier[0].system = "DCM4CHEE.22D779C5.54A03542"
* identifier[0].value = "454a8e3b-0669-68bc-c3de-3f51e3b766f5"
* name[0].use = #usual
* name[0].text = "Banaan Aarbei Citroen"
* name[0].family = "Citroen"
* name[0].given[0] = "Banaan"
* name[0].given[1] = "Aardbei"
* gender = #female
* birthDate = 2002-01-01

// PRACTITIONER
Instance: Practitioner-knee-mri-example
InstanceOf: PractitionerEu
Title: "Example Performer"
Usage: #inline
* id = "referrer"
* name[+] 
  * family = "Bloemkool"
  * given[0] = "Broccoli"


// IMAGING STUDY
Instance: ImagingStudy-knee-mri-example
InstanceOf: ImImagingStudy
Usage: #inline
* id = "1"
* identifier[studyInstanceUid]
  * type = MissingDicomTerminology#0020000D "Study Instance UID" 
  * system = "urn:dicom:uid"
  * value  =  "999.999.3859744"
* status = #available
* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* subject = Reference( Patient/1 )
* started = 1993-11-29T12:36:56+00:00
* referrer = Reference( Practitioner/1 )
* series[+]
  * uid = "999.999.94827453"
  * modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
  * description = "SINUS VAL ANEUR"
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.9"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.6.1
    * number = 8
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.21"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 20
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.7"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 6
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.11"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 10
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.15"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 14
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.17"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 16
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.33"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 32
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.29"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 28
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.23"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 22
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.27"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 26
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.25"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 24
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.37"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.6.1
    * number = 36

// Organization
Instance: Organization-knee-mri-example
InstanceOf: Organization

// Procedure
Instance: ImProcedure-knee-mri-example
InstanceOf: ImProcedure
* code
  * coding[0]
    * system = "http://snomed.info/sct"
    * code = #123456
    * display = "MRI of the knee"
* status = #completed
* subject = Reference(Patient/1)

// ServiceRequest
// placeholder example for ImOrder
Instance: ServiceRequest-knee-mri-example
InstanceOf: ImOrder
* status = #draft
* intent = #order
* subject = Reference(Patient/1)

// Impresion
Instance: ImImpression-knee-mri-example
InstanceOf: ConditionEu
* clinicalStatus = #active
* subject = Reference(Patient/1)

// Finding
Instance: ImFinding-knee-mri-example
InstanceOf: ImFinding

* code = $sct#363406005 "Clinical finding"
* status = #final
* effectiveDateTime = "1993-11-29T12:36:56+00:00"
* valueString = "Complete tear of the ACL, which is torn in the mid substance"

// DiagnosticReport
// placeholder example instance
Instance: DiagnosticReport-knee-mri-example
InstanceOf: ImDiagnosticReport
* status = #final
* code = $loinc#example
* subject = Reference(Patient/1)
* issued = "2021-01-01T00:00:00Z"
* composition = Reference(Composition/1)
* performer[author] = Reference(Practitioner/1)