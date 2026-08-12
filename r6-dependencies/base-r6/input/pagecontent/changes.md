This page summarizes the main changes applied to this version of the guide.

### From 2.0.0-ballot to 2.0.0

* Profile and constraint updates
  * FHIR-55554: Removed `DiagnosticReportComposition` extension from the R5 profile.
  * FHIR-55522: Relaxed a constraint in `DiagnosticReportEuCore` to align with IPS.
  * FHIR-55541: Removed the category slice from `DiagnosticReportEuCore`.
  * FHIR-55542: Added EU core profile references for `performer` and `resultInterpreter` in `DiagnosticReportEuCore`.
  * FHIR-55548: Removed the `procedure-targetBodyStructure` extension.
  * FHIR-53896 / FHIR-55503: Removed constraint on `subject.reference`.
  * FHIR-53897: Removed constraint on `patient.reference`.
  * FHIR-55387: Renamed `FlagEuCore` to `FlagPatientEuCore`.
  * Updated `Immunization` profile to align with model maps.
  * FHIR-55458: Renamed attester slice `resultValidator`.
  * FHIR-55526: Set `Composition.attester.party` cardinality to `1..` for validator and legalAuthenticator.
  * MedicalTestResultEuCore: Temporarily removed the R5 `value[x]` extension to fix extension errors.
  * FHIR-55424: Removed category slice in `MedicalTestResultEuCore`.
  * FHIR-55639: Added missing target elements referenced by model maps and reviewed all profiles.
  * FHIR-56415: fixed misalignemnt between MedicalTestResultEuCore and LaboratoryObservations.

* Editorial and documentation updates
  * FHIR-55553: Partial typo fixes.
  * FHIR-55461: Editorial updates across multiple pages.
  * FHIR-53895: Fixed the Location mapping page header.
  * FHIR-53894: Fixed the EHDSOrganisation page header.
  * FHIR-55533: Updated descriptions in core profiles.
  * FHIR-55536: Harmonized profile titles.
  * FHIR-55452: Clarified the role of base and core profiles in the introduction page.
  * FHIR-55454: Moved the EHDSBodyStructure model and related map under the Entity group.
  * FHIR-55741: Normalized relationships in model map tables.

* EHDS model and mapping alignment (Xt-EHR `0.3.0`) 
  * Revised the Flag model map and fixed links to model version `0.3.0`.
  * FHIR-55532: Aligned model map pages with the updated model version.
  * Added the Xt-EHR `0.3.0` model and refactored EHDS-to-FHIR mappings based on the updated model.
  

### From 0.1.0 to 2.0.0-ballot


* Added new profiles and model to profile maps
  * DiagnosticReport (FHIR-53481)
  * Composition (FHIR-53480)
  * AllergyIntolerance; Condition; Procedure; Flag; Immunization; Medication; MedicationStatement; MedicationRequest (FHIR-53197)
  * Medication/MedicationStatement/Immunization content (target profiles, revised mappings, removal of `basedOn` in Medication diff).
  * Medical Test Result observation profile (FHIR-53573)
* Updated the EHDS model links to the published versions (FHIR-53124)
* Changed dependency to the xver-r5 package for the cross-version extensions 
* Extended logical models and maps: grouped/reorganized model map landing pages, refactored the HTML/XML layout of the mapping pages, merged tables in the HCP model with the resource column (FHIR-53197 + others).
* Added examples for the profiles (FHIR-53197 + others).
* Moved the bodySite extension to Condition.bodySite and Procedure.bodySite (FHIR-53124)
* General maintenance:
  * aligned the versioning with the new HL7 EU guidelines (version bumped to `2.0.0`) (FHIR-53618)
  * Updated Known Issues and Change Log pages


### From 0.1.0-ballot to 0.1.0


* Updated IPS dependency to version `2.0.0` (FHIR-51370).
* Removed scoped references from base profiles (FHIR-51879; FHIR-51321; FHIR-51318).
* Added page for missing data and removed *data-absent-reason* extensions (FHIR-51374).
* Removed EHIC from this version (FHIR-51267).
* Added explanations about *Address.line* extensions usage (FHIR-50782; FHIR-51880).
* Revised index and introduction pages with extended explanations about core and base profiles (FHIR-51199).
* Replaced `iso21090-SC-coding` extension with `iso21090-codedString` (FHIR-51664, R4).
* Added minimal guidance for sex/gender-related extensions (FHIR-50969).
* Fixed HL7 Europe copyright statement (FHIR-50968).
* Added introductory text about extensions for the *AddressEu* profile (FHIR-51269).
* Removed references to IPS datatypes from base profiles (FHIR-51272).
* Defined *Patient Animal* as a core profile derived from *Patient Base* (FHIR-51402; FHIR-51569).
* Removed unused value sets (FHIR-51989).
* Added EHDS models and mappings to profiles (FHIR-51222).
* Harmonized display names across artifacts (FHIR-51375).
* Updated laterality value set to use *left/right/bilateral* (FHIR-51391).
* Added *gender-identity* and *pronoun* extensions to *Patient* (FHIR-51270).
* Moved *data-absent-reason* extensions to core profiles where elements are `1..` (FHIR-51374).
* Fixed resource IDs to follow `lowerCamelCase` convention (FHIR-51663).
* Grouped profiles in *Artifacts Summary* page (FHIR-51223).
* Fixed typos in the artifacts page (FHIR-51262).
* Set `Patient.name.extension[name-absent-reason]` to `0..1` (FHIR-51261).
* Added EHIC model to the R5 IG (FHIR-51369).
* Created *Patient EHIC* profile derived from *EU Core* (FHIR-51394).
* Added *birthTime* extension to *Patient* (FHIR-51177).
* Set `Location.managingOrganization` reference to *OrganizationEU* (FHIR-51268).
* Set `Patient.communication` to `0..0` for animals (FHIR-51362).
* Fixed package IDs on the home page (FHIR-51221).
* Fixed typo in *downloads.md* (FHIR-51372).
* Fixed typo in constraint name `name-or-identifier` (FHIR-51392).
* Corrected description for *Patient-animal-eu* profile (FHIR-51438).
