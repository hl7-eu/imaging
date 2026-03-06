Instance: DiagnosticReportSemiStructured
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: semi-structured report"
Description: "Example of a DiagnosticReportEuImaging showing the report for the left/right foot study"
Usage: #example
// * extension[artifactVersion].valueString = "1.0.0" // invented - not there in the report
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "o32u4js8492ff" // invented - not there in the report* 
* status = #final
* effectiveDateTime = "2025-05-08"
* language = #de-DE
* basedOn // order
  * type = #ServiceRequest
  * identifier
    * type
      * coding[+] = $v2-0203#ACSN 
      * coding[+] = http://dicom.nema.org/resources/ontology/DCM#121022
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "123456789" // invented - not there in the report
* code = $loinc#24802-1
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"
* subject.reference = "urn:uuid:907c9bcf-94b5-4243-88ba-6f85ffec4bc8"
* imagingStudy[+].reference = "urn:uuid:b710ae7d-c8d7-4861-a01e-b1e34031de4f"
//R5* study[+].reference = "urn:uuid:b710ae7d-c8d7-4861-a01e-b1e34031de4f"
* imagingStudy[+].reference = "urn:uuid:118f57b8-a3ec-4b3e-90f7-47a7f5563218"
//R5* study[+].reference = "urn:uuid:118f57b8-a3ec-4b3e-90f7-47a7f5563218"
* performer[organization].reference = "urn:uuid:d6f6db53-9e8b-4b5a-9ccc-b06ad4b62d4b"
* resultsInterpreter[author].reference = "urn:uuid:cc78737c-f9a7-4253-b932-ccdb13f745cd"

* extension[composition].valueReference.reference = "urn:uuid:4f37ad0a-11f8-4389-88bb-78118d8f84db"
//R5* composition.reference = "urn:uuid:4f37ad0a-11f8-4389-88bb-78118d8f84db"

* extension[note][+].valueAnnotation
//R5* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5
  * text = """
Linker Fuß:
  Allenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte
  Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des
  Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative
  Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.
"""
* extension[note][+].valueAnnotation
//R5* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5
  * text = """
Rechter Fuß:
  Analog zur Gegenseite zeigt sich eine allenfalls geringe Abflachung des Fußgewölbes und unauffällige
  Plantarfaszie. Normale Artikulation im Rückfuß, Mittelfußes und Vorfußes. Im Seitenvergleich rechts
  geringere degenerative Veränderungen des Großzehengrundgelenkes. Keine Signalauffälligkeiten an den
  Beuge- und Strecksehnen.
"""
* conclusion = "Beginnende Großzehengrundgelenksarthrose, links mehr als rechts. Z.n. Umstellungsosteotomie des MFK1 links."

* presentedForm
  * contentType = #application/pdf
  * language = #de-DE
//R5  * pages = 1
  * url = "urn:uuid:f7f11c74-2c5b-4d56-b00e-c66f8e56da67"

// Instance: BinarySemiStructuredReport
// InstanceOf: Binary
// Title: "Binary: semi-structured report"
// Description: "Binary resource holding the report pdf."
// Usage: #example
// * id = "semi-structured-pdf"
// * contentType = #application/pdf
// * data = "ig-loader-semistructured_report.pdf"
