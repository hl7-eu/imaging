Instance: CompositionSemiStructured
InstanceOf: CompositionEuImaging
Title: "Composition: semi-structured"
Description: "Example of a CompositionEuImaging showing the report for the left/right foot study"
Usage: #example
* status = #final
* subject.reference = "urn:uuid:907c9bcf-94b5-4243-88ba-6f85ffec4bc8"
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
* extension[diagnosticreport-reference].valueReference.reference = "urn:uuid:464458ef-b366-4125-b8f2-b2c2716d3608"
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "o32u4js8492ff" // invented - not there in the report
//R4* extension[version].valueString = "1.0.0" // invented - not there in the report
* version = "1.0.0" // invented - not there in the report
* status = #final
* type = $loinc#24802-1 "MR Knee"
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"
* author[author].reference = "urn:uuid:cc78737c-f9a7-4253-b932-ccdb13f745cd"
* author[organization].reference = "urn:uuid:d6f6db53-9e8b-4b5a-9ccc-b06ad4b62d4b"
* title = "Radiology Report for the left/right foot study" // invented - not there in the report
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\">Radiology report composition narrative. See section narratives below.</div>"

///////////////////////////////////////////////////////////////////////
* section[imagingstudy]
  * title = "Imaging Study"
  * text.status = #generated
  // * text.extension[$textLink][+]
  //   * extension[htmlid].valueString = "study1"
  //   * extension[data].valueUri = "#study1-ref"
  // * text.extension[$textLink][+]
  //   * extension[htmlid].valueString = "study2"
  //   * extension[data].valueUri = "#study2-ref"
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\"><table><tr><td><b>ImagingStudy:</b></td><td id=\"study1\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784732; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr><tr><td><b>ImagingStudy:</b></td><td id=\"study2\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784733; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr></table></div>"
    // <div xmlns=\"http://www.w3.org/1999/xhtml\">
    //   <table>
    //     <tr><td><b>ImagingStudy:</b></td><td id=\"study1\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784732; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr>
    //     <tr><td><b>ImagingStudy:</b></td><td id=\"study2\">identifier = Study Instance UID: DUI#urn:oid:1.2.276.2000010.784733; status = available; modality = Magnetic Resonance; started = 2025-04-29</td></tr>
    //   </table>
    // </div>
    
  * code = $loinc#18726-0
  * entry[+].reference = "urn:uuid:b710ae7d-c8d7-4861-a01e-b1e34031de4f"
  * entry[=].id = "study1-ref"
  * entry[+].reference = "urn:uuid:118f57b8-a3ec-4b3e-90f7-47a7f5563218"
  * entry[=].id = "study2-ref"

///////////////////////////////////////////////////////////////////////

* section[order]
  * title = "Order"
  * code = $loinc#55115-0 "Requested imaging studies information Document"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\">Nil known</div>"

///////////////////////////////////////////////////////////////////////
* section[history]
  * title = "History"
  * code = $loinc#11329-0 "History general Narrative - Reported"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\">Nil known</div>"
  
///////////////////////////////////////////////////////////////////////
* section[procedure]
  * title = "Procedure"
  * code = $loinc#55111-9 "Current imaging procedure descriptions Document"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\">Unavailable</div>"
  
///////////////////////////////////////////////////////////////////////
* section[comparison]
  * title = "Comparison"
  * code = $loinc#18834-2 "Radiology Comparison study (narrative)"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\">Unavailable</div>"
  
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
  // * text.extension[$textLink][+]
  //   * extension[htmlid].valueString = "note1"
  //   * extension[data].valueUri = "#finding-note1"
  // * text.extension[$textLink][+]
  //   * extension[htmlid].valueString = "note2"
  //   * extension[data].valueUri = "#finding-note2"
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\"><table><tr><td><b>Note:</b></td><td id=\"note1\">Linker Fuß:<br/>Allenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.</td></tr><tr><td><b>Note:</b></td><td id=\"note2\">Rechter Fuß:<br/>Analog zur Gegenseite zeigt sich eine allenfalls geringe Abflachung des Fußgewölbes und unauffällige Plantarfaszie. Normale Artikulation im Rückfuß, Mittelfußes und Vorfußes. Im Seitenvergleich rechts geringere degenerative Veränderungen des Großzehengrundgelenkes. Keine Signalauffälligkeiten an den Beuge- und Strecksehnen.</td></tr></table></div>"

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
    // * extension[$textLink][+]
    //   * extension[htmlid].valueString = "note"
    //   * extension[data].valueUri = "#impression-note"
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\"><table><tr><td><b>Note:</b></td><td id=\"note\">Beginnende Großzehengrundgelenksarthrose, links mehr als rechts. Z.n. Umstellungsosteotomie des MFK1 links.</td></tr></table></div>"

// /////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * title = "Recommendations"
  * code = $loinc#18783-1 "Radiology Study recommendation (narrative)"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de-DE\" lang=\"de-DE\">Nil Known</div>"
