Instance: CompositionSemiStructured
InstanceOf: CompositionEuImaging
Title: "Composition: semi-structured"
Description: "Example of a CompositionEuImaging showing the report for the left/right foot study"
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
  * text.status = #generated
  * text.extension[$textLink][+]
    * extension[htmlid].valueString = "study1"
    * extension[data].valueUri = "#study1-ref"
  * text.extension[$textLink][+]
    * extension[htmlid].valueString = "study2"
    * extension[data].valueUri = "#study2-ref"
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>ImagingStudy:</b></td><td id=\"study1\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784732; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr><tr><td><b>ImagingStudy:</b></td><td id=\"study2\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784733; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr></table></div>"
    // <div xmlns=\"http://www.w3.org/1999/xhtml\">
    //   <table>
    //     <tr><td><b>ImagingStudy:</b></td><td id=\"study1\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784732; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr>
    //     <tr><td><b>ImagingStudy:</b></td><td id=\"study2\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784733; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr>
    //   </table>
    // </div>
    
  * code = $loinc#18726-0
  * entry[+] = Reference(ImagingStudySemiStructuredReport1)
  * entry[=].id = "study1-ref"
  * entry[+] = Reference(ImagingStudySemiStructuredReport2)
  * entry[=].id = "study2-ref"

///////////////////////////////////////////////////////////////////////

* section[order]
  * title = "Order"
  * code = $loinc#55115-0 "Requested imaging studies information Document"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Nil known</div>"

///////////////////////////////////////////////////////////////////////
* section[history]
  * title = "History"
  * code = $loinc#11329-0 "History general Narrative - Reported"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Nil known</div>"
  
///////////////////////////////////////////////////////////////////////
* section[procedure]
  * title = "Procedure"
  * code = $loinc#55111-9 "Current imaging procedure descriptions Document"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Unavailable</div>"
  
///////////////////////////////////////////////////////////////////////
* section[comparison]
  * title = "Comparison"
  * code = $loinc#18834-2 "Radiology Comparison study (narrative)"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Unavailable</div>"
  
///////////////////////////////////////////////////////////////////////
* section[findings]
  * title = "Findings"
  * code = $loinc#59776-5 "Procedure findings Narrative"
  * extension[note][+].valueAnnotation
    * id = "finding-note1"
    * text = """
Linker Fuß:
  Allenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte
  Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des
  Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative
  Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.
"""
  * extension[note][+].valueAnnotation
    * id = "finding-note2"
    * text = """
Rechter Fuß:
  Analog zur Gegenseite zeigt sich eine allenfalls geringe Abflachung des Fußgewölbes und unauffällige
  Plantarfaszie. Normale Artikulation im Rückfuß, Mittelfußes und Vorfußes. Im Seitenvergleich rechts
  geringere degenerative Veränderungen des Großzehengrundgelenkes. Keine Signalauffälligkeiten an den
  Beuge- und Strecksehnen.
"""
  * text.status = #generated
  * text.extension[$textLink][+]
    * extension[htmlid].valueString = "note1"
    * extension[data].valueUri = "#finding-note1"
  * text.extension[$textLink][+]
    * extension[htmlid].valueString = "note2"
    * extension[data].valueUri = "#finding-note2"
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Note:</b></td><td id=\"note1\"><p>Linker Fuß:</p><p>Allenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.</p></td></tr><tr><td><b>Note:</b></td><td id=\"note2\"><p>Rechter Fuß:</p><p>Analog zur Gegenseite zeigt sich eine allenfalls geringe Abflachung des Fußgewölbes und unauffällige Plantarfaszie. Normale Artikulation im Rückfuß, Mittelfußes und Vorfußes. Im Seitenvergleich rechts geringere degenerative Veränderungen des Großzehengrundgelenkes. Keine Signalauffälligkeiten an den Beuge- und Strecksehnen. </p></td></tr></table></div>"
    
  // <div xmlns=\"http://www.w3.org/1999/xhtml\">
  //     <table>
  //       <tr><td><b>Note:</b></td><td id=\"note1\">
  //         <p>Linker Fuß:</p><p>Allenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.</p>
  //       </td></tr>
  //       <tr><td><b>Note:</b></td><td id=\"note2\"><p>Rechter Fuß:</p><p>Analog zur Gegenseite zeigt sich eine allenfalls geringe Abflachung des Fußgewölbes und unauffällige
  // Plantarfaszie. Normale Artikulation im Rückfuß, Mittelfußes und Vorfußes. Im Seitenvergleich rechts geringere degenerative Veränderungen des Großzehengrundgelenkes. Keine Signalauffälligkeiten an den   Beuge- und Strecksehnen. </p></td></tr>
  //     </table>
  // </div>

// /////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * title = "Impression"
  * code = $loinc#19005-8 "Radiology Imaging study [Impression] (narrative)"
  * extension[note][+]
    * valueAnnotation
      * id = "impression-note"
      * text = "Beginnende Großzehengrundgelenksarthrose, links mehr als rechts. Z.n. Umstellungsosteotomie des MFK1 links." 
 
  * text
    * status = #generated
    * extension[$textLink][+]
      * extension[htmlid].valueString = "note"
      * extension[data].valueUri = "#impression-note"
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Note:</b></td><td id=\"note\"><p>Beginnende Großzehengrundgelenksarthrose, links mehr als rechts. Z.n. Umstellungsosteotomie des MFK1 links.</p></td></tr></table></div>"

// /////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * title = "Recommendations"
  * code = $loinc#18783-1 "Radiology Study recommendation (narrative)"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Nil Known</div>"
