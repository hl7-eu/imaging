Profile: MedicalTestResultEuCore
Parent: Observation
Id: medicalTestResult-eu-core
Title: "Observation: Medical Test Result (EU core)"
Description: """This profile introduces essential constraints and extensions for the Observation resource for Medical Test Results that apply across multiple use cases."""
* insert SetFmmandStatusRule (2, trial-use)
* language ^short = "Language of the observation"
* specimen ^short = "Specimen used for the observation"
* identifier
  * ^requirements = "EHDSObservation.header.identifier"
* triggeredBy.observation only Reference(MedicalTestResultEuCore)
  * ^requirements = "EHDSObservation.triggeredBy[x]"
* basedOn
  * ^requirements = "EHDSObservation.order"
* status
  * ^requirements = "EHDSObservation.header.status"
* category 1..
/*  Removed for the time being based on https://jira.hl7.org/browse/FHIR-55424
 * insert SliceElement( #value, $this )
  * ^requirements = "EHDSObservation has no requirement"
* category contains 
    laboratory 0..1 and
    vital-signs 0..1
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[vital-signs] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs */
* code from MedicalTestResultCodeEuVs (example)
  * ^requirements = "EHDSObservation.code"
* subject 1.. 
* subject only Reference(PatientEuCore or Device or Group or Location)
  * ^requirements = "EHDSObservation.header.subject"
* focus only Reference(PatientEuCore or RelatedPerson or Group or Device or LocationEuCore)
  * ^requirements = "EHDSObservation.directSubject[x]"
* effective[x] 1..
* effective[x] only dateTime or Period
  * ^requirements = "EHDSObservation.observationDate[x]"
* issued
  * ^requirements = "EHDSObservation.header.authorship.datetime"
* performer only Reference(PractitionerEuCore or PractitionerRoleEuCore or OrganizationEuCore or PatientEuCore or RelatedPerson)
  * ^requirements = "EHDSObservation.header.performer"
* performer
  * extension contains $event-performerFunction named performerFunction 0..*
  * extension[performerFunction]
    * ^requirements = "EHDSObservation.performer.function"
//TODO: datatypes in xt-ehr model only valueString, valueQuantity, valueRange, valueCodeableConcept
* value[x]
  * ^requirements = "EHDSObservation.result.value[x]"
// TODO: is uncertainty a modifierExtension? Also relevant for Ratio, Range, integer
// TODO: ask for scope change on extension
* valueQuantity
  * extension contains 
    $iso21090-uncertainty named uncertainty 0..1
  * extension[uncertainty]
    * ^requirements = "EHDSObservation.result.uncertainty"
* dataAbsentReason
  * ^requirements = "EHDSObservation.dataAbsentReason"
* interpretation
  * ^requirements = "EHDSObservation.interpretation"
* note
  * ^requirements = "EHDSObservation.resultDescription"
* bodySite
  * ^requirements = "EHDSObservation.anatomicLocation"
* bodyStructure
  * ^requirements = "EHDSObservation.anatomicLocation"
* method
  * ^requirements = "EHDSObservation.method"
//TODO: specimen is not part of the EHDSObservation model but needed for lab observations
* device only Reference(Device or DeviceMetric)
  * ^requirements = "Device information for laboratory observations"
* referenceRange
  * ^requirements = "EHDSObservation.referenceRange"
* hasMember only Reference(MedicalTestResultEuCore)
  * ^requirements = "EHDSObservation.hasMember[x]"
* derivedFrom only Reference(MedicalTestResultEuCore or ImagingStudy)
  * ^requirements = "EHDSObservation.derivedFrom[x]"
* component
  * ^requirements = "EHDSObservation.component"
  * code from MedicalTestResultCodeEuVs (example)
    * ^requirements = "EHDSObservation.component.code"
//TODO: datatypes in xt-ehr model only valueString, valueQuantity, valueRange, valueCodeableConcept
  * value[x]
    * ^requirements = "EHDSObservation.component.result.value[x]"
  * valueQuantity
    * extension contains 
      $iso21090-uncertainty named uncertainty 0..1
    * extension[uncertainty]
      * ^requirements = "EHDSObservation.component.result.uncertainty"
  * dataAbsentReason
    * ^requirements = "EHDSObservation.component.dataAbsentReason"
  * referenceRange
    * ^requirements = "EHDSObservation.component.referenceRange"
  * interpretation
    * ^requirements = "EHDSObservation.component.interpretation"
Invariant: obs-value-1
Description: "The elements Observation.extension:value-r5 and Observation.value[x] SHALL not be used simultaneously."
Severity: #error
Expression: "value.empty() or extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.value').empty()"