Instance: DiagnosticReportSemiStructured
InstanceOf: ImDiagnosticReport
Title: "DiagnosticReport for the left/right foot study"
Description: "Example of a ImDiagnosticReport showing the report for the left/right foot study"
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
    * type   = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "123456789" // invented - not there in the report
* code = $loinc#24802-1 "MR Knee"
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"
* subject = Reference( PatientSemiStructuredReport)
* study[+] = Reference( ImagingStudySemiStructuredReport1 )
* study[+] = Reference( ImagingStudySemiStructuredReport2 )
* performer[organization] = Reference(OrganizationSemiStructuredReport)
* resultsInterpreter[author] = Reference(PractitionerRoleSemiStructuredReportAuthor)
* composition = Reference(CompositionSemiStructured)
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
  * text = """
Linker Fuß:
  Allenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte
  Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des
  Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative
  Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.
"""
* note[+]
  * extension[annotation-type].valueCodeableConcept = $loinc#59776-5 "Procedure findings Narrative"
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
  * pages = 1
  * url = "./Binary/semi-structured-pdf"

Instance: BinarySemiStructuredReport
InstanceOf: Binary
Title: "Binary: Semi-structured report pdf"
* id = "semi-structured-pdf"
* contentType = #application/pdf
// * data = "ig-loader-9df9cc92-0f09-4dbb-8d5d-e74bd9eaac3a.pdf"
* data = "ig-loader-9df9cc92-0f09-4dbb-8d5d-e74bd9eaac3a.pdf"
