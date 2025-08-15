Profile: EncounterEu
Parent: Encounter
Title: "Encounter: EU Encounter"
Description: "A encounter profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* priority from http://terminology.hl7.org/ValueSet/v3-xEncounterAdmissionUrgency (preferred)
* type from http://terminology.hl7.org/ValueSet/v3-ActEncounterCode (preferred)

* extension contains $note-url named note 0..1 and $encounter-legal-status-url named legalStatus 0..1

* partOf only Reference( $EuEncounter )
* serviceProvider only Reference( $EuOrganization )

* participant
  * insert SliceElement( #value, type )
* participant contains admitter 0..* and discharger 0..* and referrer 0..*
* participant[admitter]
  * type 1..*
    * insert SliceElement( #value, coding )
  * type contains participantCode 1..1
  * type[participantCode] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ADM
* participant[discharger]
  * type 1..*
    * insert SliceElement( #value, coding )
  * type contains participantCode 1..1
  * type[participantCode] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DIS
* participant[referrer]
  * type 1..*
    * insert SliceElement( #value, coding )
  * type contains participantCode 1..1
  * type[participantCode] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#REF
