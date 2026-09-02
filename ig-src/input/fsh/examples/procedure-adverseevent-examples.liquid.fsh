// Examples for the imaging Procedure and imaging Adverse Event profiles.
// The scenario continues the semi-structured MR foot study: the acquisition itself,
// and a mild contrast reaction that occurred during it.

Instance: MrScannerExample
InstanceOf: DeviceEuImaging
Title: "Device: MR scanner"
Description: "Example imaging device used to acquire the MR foot study."
Usage: #example
* identifier
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.276.2000010.784732.1.1"
* manufacturer = "Example Medical Imaging"
* serialNumber = "MR-2026-0042"
* type = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
{{R4}}* extension[imagingCategory].valueCodeableConcept = $sct#314789007 "Diagnostic imaging equipment"
{{R4}}* deviceName
{{R4}}  * name = "Example 1.5T MR scanner"
{{R4}}  * type = #model-name
{{R5}}* category[imaging] = $sct#314789007 "Diagnostic imaging equipment"
{{R5}}* name
{{R5}}  * value = "Example 1.5T MR scanner"
{{R5}}  * type = #registered-name


Instance: ProcedureMrFootExample
InstanceOf: ProcedureEuImaging
Title: "Procedure: MR imaging of both feet"
Description: """
Example imaging Procedure representing the acquisition (DICOM Performed Procedure Step) of the
bilateral MR foot study. It records both performers required by the profile: the radiographer
who carried out the acquisition, and the MR scanner that produced the images.
"""
Usage: #example
* status = #completed
* code = $sct#113091000 "Magnetic resonance imaging"
* subject = Reference(PatientSemiStructuredReport)
{{R4}}* performedDateTime = "2025-04-29T09:15:00+02:00"
{{R5}}* occurrenceDateTime = "2025-04-29T09:15:00+02:00"

// function is a pattern, not a fixed value: the required SNOMED coding must be present,
// but additional codings are permitted and their order is not significant.
* performer[performer]
  * function
    * coding[+] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF "performer"
    * coding[+] = $sct#223366009 "Healthcare professional"
    * text = "Radiographer who performed the acquisition"
  * actor = Reference(PractitionerRoleSemiStructuredReportAuthor)
* performer[imaging-device]
  * function
    * coding[+] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV "Device"
    * coding[+] = $sct#314789007 "Diagnostic imaging equipment"
    * text = "MR scanner that acquired the images"
  * actor = Reference(MrScannerExample)


Instance: AllergyGadoliniumExample
InstanceOf: $EuAllergyIntolerance
Title: "AllergyIntolerance: gadolinium contrast agent"
Description: "Known propensity to react to gadolinium-based contrast agents, relevant to the MR study."
Usage: #example
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed "Confirmed"
// Text-only: the binding is preferred and no verified SNOMED code/display pair is available here.
* code.text = "Allergy to gadolinium-based contrast agent"
* patient = Reference(PatientSemiStructuredReport)


Instance: AdverseEventContrastReactionExample
InstanceOf: AdverseEventEuImaging
Title: "AdverseEvent: contrast reaction during MR acquisition"
Description: """
Example imaging AdverseEvent: a mild urticarial reaction to the gadolinium-based contrast agent
administered during the bilateral MR foot study. The suspect entity is the imaging Procedure, and
the patient's known contrast allergy is cited as relevant history.
"""
Usage: #example
* actuality = #actual
* subject = Reference(PatientSemiStructuredReport)
{{R4}}* event = $sct#126485001 "Urticaria"
{{R4}}* date = "2025-04-29T09:35:00+02:00"
{{R4}}* suspectEntity[procedure].instance = Reference(ProcedureMrFootExample)
{{R4}}* subjectMedicalHistory[allergy] = Reference(AllergyGadoliniumExample)
{{R5}}* status = #completed
{{R5}}* code = $sct#126485001 "Urticaria"
{{R5}}* occurrenceDateTime = "2025-04-29T09:35:00+02:00"
{{R5}}* suspectEntity[procedure].instanceReference = Reference(ProcedureMrFootExample)
{{R5}}* contributingFactor[allergy].itemReference = Reference(AllergyGadoliniumExample)
