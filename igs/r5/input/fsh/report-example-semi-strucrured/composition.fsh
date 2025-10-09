Instance: CompositionSemiStructured
InstanceOf: ImComposition
Title: "Composition for the left/right foot study"
Description: "Example of a ImComposition showing the report for the left/right foot study"
Usage: #example
* status = #final
* subject = Reference( PatientSemiStructuredReport )
* date = "2025-05-08"
* language = #de-DE
* extension[basedOn] // order
  * url = "http://hl7.org/fhir/StructureDefinition/event-basedOn"
  * valueReference
    * type = #ServiceRequest
    * identifier
      * type
        * coding
          * system = "http://terminology.hl7.org/CodeSystem/v3-ActClass#v2-0203"
          * code   = #ACSN
      * system = "http://example.org/myhosptital/accessionsystem"
      * value  = "123456789" // invented - not there in the report
* extension[diagnosticreport-reference].valueReference = Reference ( DiagnosticReportSemiStructured )
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "o32u4js8492ff" // invented - not there in the report
//R4* extension[version].valueString = "1.0.0" // invented - not there in the report
* version = "1.0.0" // invented - not there in the report
* status = #final
* type = $loinc#24802-1 "MR Knee"
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"
* author[author] = Reference(PractitionerRoleSemiStructuredReportAuthor)
* author[organization] = Reference(OrganizationSemiStructuredReport)
* title = "Radiology Report for the left/right foot study" // invented - not there in the report

///////////////////////////////////////////////////////////////////////
* section[imagingstudy]
  * title = "Imaging Study"
  * code = $loinc#18726-0
  * entry[+] = Reference(ImagingStudySemiStructuredReport1)
  * entry[+] = Reference(ImagingStudySemiStructuredReport2)

///////////////////////////////////////////////////////////////////////

* section[order]
  * title = "Order"
  * code = $loinc#55115-0 "Requested imaging studies information Document"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  
///////////////////////////////////////////////////////////////////////
* section[history]
  * title = "History"
  * code = $loinc#11329-0 "History general Narrative - Reported"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

///////////////////////////////////////////////////////////////////////
* section[procedure]
  * title = "Procedure"
  * code = $loinc#55111-9 "Current imaging procedure descriptions Document"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"

///////////////////////////////////////////////////////////////////////
* section[comparison]
  * title = "Comparison"
  * code = $loinc#18834-2 "Radiology Comparison study (narrative)"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  
///////////////////////////////////////////////////////////////////////
* section[findings]
  * title = "Findings"
  * code = $loinc#59776-5 "Findings"
  * extension[note][+]
    * valueAnnotation.text = """
Linker Fuß:
  Allenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte
  Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des
  Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative
  Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.
"""
  * extension[note][+]
    * valueAnnotation.text = """
Rechter Fuß:
  Analog zur Gegenseite zeigt sich eine allenfalls geringe Abflachung des Fußgewölbes und unauffällige
  Plantarfaszie. Normale Artikulation im Rückfuß, Mittelfußes und Vorfußes. Im Seitenvergleich rechts
  geringere degenerative Veränderungen des Großzehengrundgelenkes. Keine Signalauffälligkeiten an den
  Beuge- und Strecksehnen.
"""

// /////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * title = "Impression"
  * code = $loinc#19005-8 "Radiology Imaging study [Impression] (narrative)"
  * extension[note][+]
    * valueAnnotation.text = "Beginnende Großzehengrundgelenksarthrose, links mehr als rechts. Z.n. Umstellungsosteotomie des MFK1 links." 

// /////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * title = "Recommendations"
  * code = $loinc#18783-1 "Radiology Study recommendation (narrative)"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
