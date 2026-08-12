Profile: PatientEu
Parent: Patient
Id: patient-eu
Title:    "Patient (EU base)"
Description: """This profile specifies how the HL7 FHIR Patient resource should be used for conveying commonly used concepts in the European context."""
* insert SetFmmandStatusRule (2, trial-use)
* extension contains
    $patient-birthPlace named birthPlace 0..1 and
    $sexForClinicalUse named sex-for-clinical-use 0..* and // from Lab Report
    $individual-genderIdentity named gender-identity 0..* and
    $individual-pronouns named pronouns 0..* and
    $patient-citizenship named patient-citizenship 0..* and
    $patient-nationality named patient-nationality 0..* and
    $patient-birthTime named birthTime 0..1
* extension[birthPlace].valueAddress only AddressEu
* extension[birthTime] ^short = "Birth time"
* extension[sex-for-clinical-use] ^short = "Sex for clinical use"
* extension[gender-identity] ^short = "Gender identity"
* extension[pronouns] ^short = "Pronouns"
* extension[patient-citizenship] ^short = "Citizenship"
* extension[patient-nationality] ^short = "Nationality"
* identifier ^short = "Patient identifiers" // MS according to IPS
* name // only HumanNameEu
* name ^requirements = "Need to be able to track the patient by multiple names. Examples are your official name and a partner name.\r\nThe Alphabetic representation of the name SHALL be always provided"
* name ^requirements = "Need to be able to track the patient by multiple names. Examples are your official name and a partner name.\r\nThe Alphabetic representation of the name SHALL be always provided"
* name.text ^definition = "Text representation of the full name. Due to the cultural variance around the world a consuming system may not know how to present the name correctly; moreover not all the parts of the name go in given or family. Creators are therefore strongly encouraged to provide through this element a presented version of the name. Future versions of this guide may require this element."
* name.family ^short = "Family name."  // MS according to IPS
// * name.family ^definition = """Family name. When more the family is composed of more than one name, this element documents the full composed family name with the proper name order. The parts are recorded in the father and mother family names extensions."""
* name.family ^example.label = "spanish"
* name.family ^example.valueString = "Valero Iglesias"
* name.given 
  * ^comment = "If only initials are recorded, they may be used in place of the full name parts. Initials may be separated into multiple given names but often aren't due to practical limitations. This element is not called \"first name\" since given names do not always come first."
* name.text ^short = "Text representation of the full name."
* telecom ^short = "A contact detail for the patient" // MS according to IPS
* gender ^short = "Administrative Gender" // MS according to IPS
* birthDate 0.. // MS according to IPS
  * ^comment = "At least an estimated year should be provided as a guess if the real DOB is unknown. There is a standard extension \"patient-birthTime\" available that should be used where Time is required (such as in maternity/infant care systems)."
* address only AddressEu // MS according to IPS
* maritalStatus ^short = "Marital status"
* contact
  *  relationship ^short = "Contact relationship"
  // include additional value sets when they are defined
  * address ^short = "Contact person address"
  * address only AddressEu
  * telecom ^short = "Contact details for the person"
  * name // only HumanNameEu
    * ^short = "Contact name"
* generalPractitioner ^short = "Patient's nominated primary care provider."
// * generalPractitioner only Reference(OrganizationEu or PractitionerRoleEu or PractitionerEu) 
* communication.language ^short = "Communication language"
