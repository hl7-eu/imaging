RuleSet: MhdSearchParameters
// Imaging specific search parameters
* rest[=].resource[=].searchParam[+].name = "bodysite"
* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceBodySite )
//R5* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-bodysite"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Anatomical region of the related imaging study"

* rest[=].resource[=].searchParam[+].name = "modality"
* rest[=].resource[=].searchParam[=].definition = Canonical( SearchParameterDocumentReferenceModality )
//R5* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-modality"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Modality of the related imaging study"


RuleSet: CapabilityStatementExpectation( expectation )
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * valueCode = {expectation}

RuleSet: CapabilityStatementSearchParameter(name, definition, type, strength, documentation )
* searchParam[+]
  * name = "{name}"
  * definition = "{definition}"
  * type = {type}
  * insert CapabilityStatementExpectation( {strength} )
  * documentation = "{documentation}"

RuleSet: ImagingStudyResource( strength1, strength2 )
* resource[+]
  * type = #ImagingStudy
  * insert CapabilityStatementExpectation( {strength1} )
  * documentation = "ImagingStudy resources represent a summary of an imaging exam as represented in DICOM."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read ImagingStudy by logical ID"
  * interaction[+]
    * code = #search-type
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Search for ImagingStudy resources."
  * insert CapabilityStatementSearchParameter( based-on, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-basedon]], #reference, {strength1}, [[The order that lead to the imaging study.]])
  //R5* insert CapabilityStatementSearchParameter( based-on, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-based-on]], #reference, {strength1}, [[The order that lead to the imaging study.]])
  * insert CapabilityStatementSearchParameter( body-site, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-bodysite]], #token, {strength1}, [[The body-site the study examined.]])
  //R5* insert CapabilityStatementSearchParameter( body-site, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-body-site]], #token, {strength1}, [[The body-site the study examined.]])
  * insert CapabilityStatementSearchParameter( dicom-class, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-dicom-class]], #token, {strength2}, [[The type of the instances.]])
  * insert CapabilityStatementSearchParameter( modality, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-modality]], #token, {strength1}, [[The modality of the imaging study.]])
  * insert CapabilityStatementSearchParameter( identifier, [[http://hl7.org/fhir/SearchParameter/clinical-identifier]], #token, {strength1}, [[The identifier of the imaging study.]] )
  * insert CapabilityStatementSearchParameter( instance, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-instance]], #token, {strength2}, [[The SOP Instance UID of the instances in the imaging study.]] )
  * insert CapabilityStatementSearchParameter( patient, [[http://hl7.org/fhir/SearchParameter/clinical-patient]], #reference, {strength1}, [[The patient the study is about.]] )
  * insert CapabilityStatementSearchParameter( performer, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-performer]], #reference, {strength2}, [[The person who performed the study.]] )
  * insert CapabilityStatementSearchParameter( reason, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-reason]], #token, {strength2}, [[The reason the study was performed.]] )
  * insert CapabilityStatementSearchParameter( referrer, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-referrer]], #reference, {strength2}, [[The referring physician.]] )
  * insert CapabilityStatementSearchParameter( series, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-series]], #token, {strength2}, [[The the UID of a series in the study.]] )
  * insert CapabilityStatementSearchParameter( started, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-started]], #date, {strength1}, [[The date the study was started.]] )
  * insert CapabilityStatementSearchParameter( subject, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-subject]], #reference, {strength1}, [[The status of the study.]] )
  * insert CapabilityStatementSearchParameter( status, [[http://hl7.org/fhir/SearchParameter/ImagingStudy-status]], #token, {strength1}, [[The subject the study is about.]] )

//////////////////////////////////////////////////////////////////////////////
// Device
RuleSet: DeviceResource( strength1, strength2 )
* resource[+]
  * type = #Device
  * insert CapabilityStatementExpectation( {strength2} )
  * documentation = "Represents a Device.  No search has been defined as all compositions should be accessed from a reference. When a server does not support it, the resource is to be included as a contained resource."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read Device by logical ID"

// AdverseEvent
RuleSet: AdverseEventResource( strength1 )
* resource[+]
  * type = #AdverseEvent
  * insert CapabilityStatementExpectation( {strength1} )
  * documentation = "Represents an adverse event that occurred during the imaging procedure."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read Composition by logical ID"

// ImagingSelection
RuleSet: ImagingSelectionResource( strength1 )
* resource[+]
  * type = #Basic
//R5  * type = #ImagingSelection
  * insert CapabilityStatementExpectation( {strength1} )
  * documentation = "Represents part of an imaging study."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read Composition by logical ID"

// Composition
RuleSet: CompositionResource( strength1 )
* resource[+]
  * type = #Composition
  * insert CapabilityStatementExpectation( {strength1} )
  * documentation = "Represents a rendering of a report. No search has been defined as all compositions should be accessed from the DiagnosticReport."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read Composition by logical ID"

// Procedure

RuleSet: ProcedureResource( strength1 )
* resource[+]
  * type = #Procedure
  * insert CapabilityStatementExpectation( {strength1} )
  * documentation = "Represents the procedure that generated the study."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read Procedure by logical ID"
  * insert CapabilityStatementSearchParameter( patient, [[http://hl7.org/fhir/SearchParameter/clinical-patient]], #reference, {strength1}, [[The patient of the procedure.]] )
  * insert CapabilityStatementSearchParameter( subject, [[http://hl7.org/fhir/SearchParameter/Procedure-subject]], #reference, {strength1}, [[The subject of the procedure.]] )

// ServiceRequest

RuleSet: ServiceRequestResource( strength1 )
* resource[+]
  * type = #ServiceRequest
  * insert CapabilityStatementExpectation( {strength1} )
  * documentation = "Represents the order that generated the study."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read ServiceRequest by logical ID"
  * insert CapabilityStatementSearchParameter( identifier, [[http://hl7.org/fhir/SearchParameter/clinical-identifier]], #token, {strength1}, [[The identifier of the order (accession number).]] )
  * insert CapabilityStatementSearchParameter( patient, [[http://hl7.org/fhir/SearchParameter/clinical-patient]], #reference, {strength1}, [[The patient of the order.]] )
  * insert CapabilityStatementSearchParameter( subject, [[http://hl7.org/fhir/SearchParameter/ServiceRequest-subject]], #reference, {strength1}, [[The subject of the order.]] )

// Provenance
RuleSet: ProvenanceResource( strength1 )
* resource[+]
  * type = #Provenance
  * insert CapabilityStatementExpectation( {strength1} )
  * documentation = "Represents the provenance of the report."
  * interaction[+]
    * code = #read
    * insert CapabilityStatementExpectation( {strength1} )
    * documentation = "Read ServiceRequest by logical ID"
  * insert CapabilityStatementSearchParameter( patient, [[http://hl7.org/fhir/SearchParameter/clinical-patient]], #reference, {strength1}, [[The patient of the order.]] )
  * insert CapabilityStatementSearchParameter( subject, [[http://hl7.org/fhir/SearchParameter/ServiceRequest-subject]], #reference, {strength1}, [[The subject of the order.]] )
  * insert CapabilityStatementSearchParameter( target, [[http://hl7.org/fhir/SearchParameter/Provenance-target]], #reference, {strength1}, [[The target of the provenance.]] )


// DiagnosticReport 
// DocumentReference
// Observation
