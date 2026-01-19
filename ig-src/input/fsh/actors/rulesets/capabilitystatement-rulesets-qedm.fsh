

RuleSet: CapabilityStatement-AllergyIntolerance( high )
// AllergyIntolerance
* resource[+]
  * type = #AllergyIntolerance
  * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #read
    * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #search-type
    * insert CapabilityStatement-Expectation( {high} )
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves // change identifier references to logical references
  * searchRevInclude = "Provenance:target"
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-Condition( high, medium )
* resource[+]
  * type = #Condition
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "clinical-status"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "category"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * documentation = "Client applications should be prepared to encounter codes they do not recognize and handle the records \naccordingly. Servers SHOULD populate Condition.code.coding.display and/or Condition.code.text so that \nclients can always at least display the condition even if they do not know the codes that are used. Clients should be careful making use of the ```code``` search parameter given that the codes used\nvary so much.\n\nSafety Issues:\n\n* Clients SHALL not treat all conditions as if they are part of the patient's current problem list\n    * Note that some Condition resources may not have these status codes - this is usually due to poor record keeping reflected in legacy data\n    * Servers SHOULD avoid leaving these status codes missing\n* Clients SHALL pay attention to the ```clinicalStatus``` and ```verificationStatus``` and display and process them correctly\n* Clients SHALL still work safely when the server does not support all the search parameters listed here."
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {medium}
  * searchParam[=].name = "category"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The category of the condition"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {medium}
  * searchParam[=].name = "clinical-status"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-clinical-status"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The clinical status of the condition"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference
//  * searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nThe server **SHALL** support both."

RuleSet: CapabilityStatement-Immunization( high )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}
  * type = #Immunization
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference
//  * searchParam[=].documentation = "The client **SHALL** provide at least an id value and **MAY** provide both the Type and id values.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nThe server **SHALL** support both."

RuleSet: CapabilityStatement-Medication( high )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high} 
  * type = #Medication
  * documentation = "The MedicationStatement and MedicationRequest resources can represent a medication, using an external reference to a Medication resource. If an external Medication Resource is used in a MedicationStatement or a MedicationRequest, then the READ and SEARCH Criteria  **SHALL**  be supported."
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference

RuleSet: CapabilityStatement-MedicationRequest( high )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}
  * type = #MedicationRequest
  * documentation = "Clients SHALL query for both MedicationStatement and MedicationRequest when fetching patient Medication information.\n\nThe MedicationRequest resources can represent a medication using either a code or refer to the Medication resource. When referencing Medication, the resource may be [contained](http://hl7.org/fhir/R4/references.html#contained) or an external resource. The server application **MAY** choose any one way or more than one method, but if an external reference to Medication is used, the server **SHALL** support the `_include` parameter for searching this element. The client application **SHALL** support all methods. For example, A server **SHALL** be capable of returning all medications for a patient using one of or both:\n\n `GET /MedicationStatement?patient=[id]`\n\n `GET /MedicationStatement?patient=[id]&_include=MedicationStatement:medication`\n\nWhen representing a prescribed medication, servers SHOULD use codings at the level of a clinical drug rather than ingredient or dose form (e.g. \"loratadine 10mg oral tablet\", rather than a bare ingredient like \"loratadine\" or a dose form like \"loratadine oral tablet\")."
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchInclude = "MedicationRequest:medication"
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference

RuleSet: CapabilityStatement-MedicationStatement( high )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}
/* QEDm does not have combinations/
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "status"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
*/
  * type = #MedicationStatement
//  * profile = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-medicationstatement"
  * documentation = "Clients SHALL query for both MedicationStatement and MedicationRequest when fetching patient Medication information.\n\nThe MedicationRequest resources can represent a medication using either a code or refer to the Medication resource. When referencing Medication, the resource may be [contained](http://hl7.org/fhir/R4/references.html#contained) or an external resource. The server application **MAY** choose any one way or more than one method, but if an external reference to Medication is used, the server **SHALL** support the `_include` parameter for searching this element. The client application **SHALL** support all methods."
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchInclude = "MedicationStatement:medication"
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
/* QEDm only include patient
  * searchParam[=].extension.valueCode = {low}
  * searchParam[=].name = "status"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/medications-status"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "Return statements that match the given status"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
*/
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference
//  * searchParam[=].documentation = "The client **SHALL** provide at least an id value and **MAY** provide both the Type and id values."

RuleSet: CapabilityStatement-Observation( high, medium, low )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"  
  * extension[=].valueCode = {high}
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "category"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "code"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "category"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "date"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "code"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "date"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * type = #Observation
   //* supportedProfile[0] = "http://hl7.org/fhir/StructureDefinition/vitalsigns"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {low}
   //* supportedProfile[+] = "https://profiles.ihe.net/PCC/ODH/StructureDefinition/odh-CombatZonePeriod"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {medium}
   //* supportedProfile[+] = "https://profiles.ihe.net/PCC/ODH/StructureDefinition/odh-EmploymentStatus"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {medium}
   //* supportedProfile[+] = "https://profiles.ihe.net/PCC/ODH/StructureDefinition/odh-OccupationalDataForHealth"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {medium}
   //* supportedProfile[+] = "https://profiles.ihe.net/PCC/ODH/StructureDefinition/odh-PastOrPresentJob"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {medium}
   //* supportedProfile[+] = "https://profiles.ihe.net/PCC/ODH/StructureDefinition/odh-RetirementDate"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {medium}
   //* supportedProfile[+] = "https://profiles.ihe.net/PCC/ODH/StructureDefinition/odh-UsualWork"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {medium}
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {low}
  * searchParam[=].name = "category"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The classification of the type of observation"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {low}
  * searchParam[=].name = "code"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The code of the observation type"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {low}
  * searchParam[=].name = "date"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
  * searchParam[=].type = #date
// added date modifiers to documentation element
  * searchParam[=].documentation = "Obtained date/time. If the obtained element is a period, a date that falls in the period. The date modifiers `ge`,`le`,`gt`,`lt` SHALL be supported."
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {low}
  * searchParam[=].name = "status"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The status of the observation"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {low}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference
// Different note than IPA
  * searchParam[=].documentation = "The Clinical Data Consumer SHALL support at least one of the search parameters combinations."

// RuleSet: CapabilityStatement-Patient( high )
// * resource[+]
//   * type = #Patient\
//   * insert CapabilityStatement-Expectation( {high} )

/* see PDQm
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "family"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "gender"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "birthdate"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "family"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "birthdate"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "name"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "gender"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "name"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * type = #Patient
//  * profile = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient"
  * documentation = "Servers SHALL support the capability for a client application to access the patient record using any of the following API calls:\n\n```GET [url]/Patient/[id]```\n\n```GET [url]/Patient?_id=[id]```\n\n```GET [url]/Patient?identifier=[identifier]```\n\nServers are not required to support any additional search parameters, and clients SHOULD not expect servers to do so.\n\nAdditional rules and guidance for supporting `Patient.link`: \n- The server:\n    - SHALL have no more than one Patient with a status of active = \"true\" *from the server being queried* \n    - MAY include inactive patients on the *same server*\n    - MAY include inactive or active patients from a *different server*\n    - When returning a [search Bundle](http://hl7.org/fhir/bundle.html) that contains more than one Patient record for the same patient, the Patient record(s) SHALL use the `Patient.link` attribute to cross-link the Patient resources.\n- The client:\n    - SHALL be able to follow the link(s) to the other Patient resource(s) and understand the direction of the link (in other words, which Patient is linked to which other Patient)\n    - SHALL understand the `Patient.link.type` code which defines the type of link between this Patient resource and another Patient resource\n    - SHALL be aware of the linked Patient `active` flag and that inactive patients may have relevant information"
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "_id"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
  * searchParam[=].type = #token
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {medium}
  * searchParam[=].name = "birthdate"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
  * searchParam[=].type = #date
  * searchParam[=].documentation = "A client **SHALL** provide a value precise to the *day*.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nA server **SHALL** support a value a value precise to the *day*."
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {medium}
  * searchParam[=].name = "family"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
  * searchParam[=].type = #string
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {medium}
  * searchParam[=].name = "gender"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nThe server **SHALL** support both."
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {medium}
  * searchParam[=].name = "given"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
  * searchParam[=].type = #string
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "identifier"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The client **SHALL** provide both the system and code values.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nThe server **SHALL NOT** support only code values."
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {medium}
  * searchParam[=].name = "name"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-name"
  * searchParam[=].type = #string
*/

// RuleSet: CapabilityStatement-Practitioner( high )
// * rest[=].resource[+]
//   * type = #Practitioner
/* see mCSD
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}  * extension.valueCode = {medium}
  * type = #Practitioner
//  * profile = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitioner"
  * interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction.extension.valueCode = {high}
  * interaction.code = #read
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"

* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}  * extension.valueCode = {medium}
  * type = #PractitionerRole
//  * profile = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitionerrole"
  * interaction.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction.extension.valueCode = {high}
  * interaction.code = #read
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchInclude[0] = "PractitionerRole:endpoint"
  * searchInclude[+] = "PractitionerRole:practitioner"
  * searchRevInclude = "Provenance:target"
* rest.interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.interaction[=].extension.valueCode = {low}
* rest.interaction[=].code = #transaction
* rest.interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.interaction[=].extension.valueCode = {low}
* rest.interaction[=].code = #batch
* rest.interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.interaction[=].extension.valueCode = {low}
* rest.interaction[=].code = #search-system
* rest.interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.interaction[=].extension.valueCode = {low}
* rest.interaction[=].code = #history-system
*/

// Unique to QEDm that are not in IPA

RuleSet: CapabilityStatement-DiagnosticReport( high, medium )
* resource[+]
  * extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}  
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "category"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "category"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "code"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "category"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "date"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {medium}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "category"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "code"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "date"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * type = #DiagnosticReport
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "category"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The classification of the type of observation"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "code"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
  * searchParam[=].type = #token
  * searchParam[=].documentation = "The code of the observation type"
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "date"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
  * searchParam[=].type = #date
// added date modifiers to documentation element
  * searchParam[=].documentation = "Obtained date/time. If the obtained element is a period, a date that falls in the period. The date modifiers `ge`,`le`,`gt`,`lt` SHALL be supported."
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference

RuleSet: CapabilityStatement-Procedure( high )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}  
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "date"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * type = #Procedure
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "date"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
  * searchParam[=].type = #date
// added date modifiers to documentation element
  * searchParam[=].documentation = "Obtained date/time. If the obtained element is a period, a date that falls in the period. The date modifiers `ge`,`le`,`gt`,`lt` SHALL be supported."
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference

RuleSet: CapabilityStatement-Encounter( high )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}  
  * extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].extension[=].valueCode = {high}
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "patient"
  * extension[=].extension[+].url = "required"
  * extension[=].extension[=].valueString = "date"
  * extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
  * type = #Encounter
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchRevInclude = "Provenance:target"
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "date"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
  * searchParam[=].type = #date
// added date modifiers to documentation element
  * searchParam[=].documentation = "Obtained date/time. If the obtained element is a period, a date that falls in the period. The date modifiers `ge`,`le`,`gt`,`lt` SHALL be supported."
  * searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "patient"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * searchParam[=].type = #reference


RuleSet: CapabilityStatement-Provenance( high )
* resource[+]
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension[=].valueCode = {high}  
  * type = #Provenance
   //* supportedProfile[+] = "https://profiles.ihe.net/ITI/mXDE/StructureDefinition/IHE.ITI.mXDE.Provenance"
   //* supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
   //* supportedProfile[=].extension.valueCode = {high}
  * interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #read
  * interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * interaction[=].extension.valueCode = {high}
  * interaction[=].code = #search-type
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves
  * searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * searchParam[=].extension.valueCode = {high}
  * searchParam[=].name = "target"
  * searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-target"
  * searchParam[=].type = #reference