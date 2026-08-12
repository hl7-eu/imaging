Instance: ConditionEuCoreExample
InstanceOf: ConditionEuCore
Title: "Condition Example"
Description: "Example of a Condition resource conforming to the Condition (EU Core) profile."
* id = "condition-eu-core-example"
* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus = $condition-ver-status#confirmed "Confirmed"
* category = $condition-category#problem-list-item "Problem List Item"
* severity = $sct#24484000 "Severe"
* code = $sct#233604007 "Pneumonia"
* subject = Reference(PatientExample)
* onsetDateTime = "2024-11-30"
* recordedDate = "2024-12-02"
* extension[assertedDate].valueDateTime = "2024-12-01"
* bodySite = $sct#41224006 "Lower lobe of left lung"
* note.text = "Productive cough with fever; antibiotics started during admission."
* participant[+].actor = Reference(PractitionerRoleEuCoreExample)
