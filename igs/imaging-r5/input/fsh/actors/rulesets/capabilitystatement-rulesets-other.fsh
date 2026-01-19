RuleSet: CapabilityStatement-AdverseEvents( high )
* resource[+]
  * type = #AdverseEvent
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "subject"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-ClinicalImpression( high )
* resource[+]
  * type = #ClinicalImpression
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-Composition( high )
* resource[+]
  * type = #Composition
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "date"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
    * type = #date
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "category"
    * definition = "http://hl7.org/fhir/SearchParameter/Composition-category"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
    * type = #reference
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-CarePlan( high )
* resource[+]
  * type = #CarePlan 
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-Consent( high )
* resource[+]
  * type = #Consent
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-Device( high )
* resource[+]
  * type = #Device
  * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #read
    * insert CapabilityStatement-Expectation( {high} )
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves // change identifier references to logical references

RuleSet: CapabilityStatement-DeviceUseStatement( high )
* resource[+]
  * type = #DeviceUseStatement
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference


RuleSet: CapabilityStatement-Flag( high )
* resource[+]
  * type = #Flag
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-ImmunizationRecommendation( high )
* resource[+]
  * type = #ImmunizationRecommendation
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-DocumentReference( high )
* resource[+]
  * type = #ImmunizationRecommendation
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

RuleSet: CapabilityStatement-ImagingStudy( high, low )
* resource[+]
  * type = #ImagingStudy
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "based-on"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-based-on"
    * type = #reference
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "body-site"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-body-site"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {low} )
    * name = "dicom-class"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-dicom-class"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {low} )
    * name = "identifier"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#clinical-identifier"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {low} )
    * name = "instance"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-instance"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {low} )
    * name = "modality"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-modality"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "reason"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-reason"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "performer"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-performer"
    * type = #reference
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "referrer"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-referrer"
    * type = #reference
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {low} )
    * name = "series"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-series"
    * type = #reference
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {low} )
    * name = "status"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-status"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "started"
    * definition = "https://hl7.org/fhir/imagingstudy-search.html#ImagingStudy-started"
    * type = #date
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "subject"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-subject"
    * type = #reference

RuleSet: CapabilityStatement-ImagingSelection( high )
* resource[+]
  * type = #ImagingSelection
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "subject"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference

// this is for resource access, not MHD search
RuleSet: CapabilityStatement-IncludedDocumentReference( high )
* resource[+]
  * type = #DocumentReference
  * documentation = "Support of DocumentReference resources in Imaging Reports."
  * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #read
    * insert CapabilityStatement-Expectation( {high} )
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves // change identifier references to logical references

RuleSet: CapabilityStatement-Organization( high )
* resource[+]
  * type = #Organization
  * documentation = "Support of Organization resources in Imaging Reports."
  * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #read
    * insert CapabilityStatement-Expectation( {high} )
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves // change identifier references to logical references

RuleSet: CapabilityStatement-Practitioner( high )
* resource[+]
  * type = #Practitioner
  * documentation = "Support of Practitioner resources in Imaging Reports."
  * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #read
    * insert CapabilityStatement-Expectation( {high} )
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves // change identifier references to logical references


RuleSet: CapabilityStatement-PractitionerRole( high )
* resource[+]
  * type = #PractitionerRole
  * documentation = "Support of Practitioner resources in Imaging Reports."
  * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #read
    * insert CapabilityStatement-Expectation( {high} )
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves // change identifier references to logical references

RuleSet: CapabilityStatement-RelatedPerson( high )
* resource[+]
  * type = #RelatedPerson
  * documentation = "Support of RelatedPerson resources in Imaging Reports."
  * insert CapabilityStatement-Expectation( {high} )
  * interaction[+]
    * code = #read
    * insert CapabilityStatement-Expectation( {high} )
  * updateCreate = false
  * conditionalCreate = false
  * conditionalUpdate = false
  * conditionalDelete = #not-supported
  * referencePolicy = #resolves // change identifier references to logical references

RuleSet: CapabilityStatement-ServiceRequest( high )
* resource[+]
  * type = #ServiceRequest
  * documentation = "Support of ServiceRequest resources in Imaging Reports."
  * insert CapabilityStatement-Expectation( {high} )
  * insert RequireReadAndSearch
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "identifier"
    * definition = "https://hl7.org/fhir/servicerequest-search.html#clinical-identifier"
    * type = #token
  * searchParam[+]
    * insert CapabilityStatement-Expectation( {high} )
    * name = "subject"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference