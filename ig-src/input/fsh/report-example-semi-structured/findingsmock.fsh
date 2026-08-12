Instance: ObservationNarrative
InstanceOf: ObservationNarrativeReport
Usage: #example
Title: "Observation: Semi-structured narrative findings"
Description: "Narrative findings text extracted from the semi-structured report."
* status = #final
* code = $loinc#18782-3 "Radiology Study observation (narrative)"
* valueString = """Linker Fuß:\nAllenfalls geringe Abflachung des Fußgewölbes und normale Dicke der Plantarfaszie. Regelrechte Artikulation im Rückfuß, Mittelfuß und Vorfußes. Im Großzehengrundgelenk deutliche Verschmälerung des Gelenkspaltes und Ausbildung von subchondralen Geröllzysten sowie deutliche postoperative Veränderungen nach Umstellungsosteotomie. Die Beuge- und Strecksehnen sind intakt.\n\nRechter Fuß:\nAnalog zur Gegenseite zeigt sich eine allenfalls geringe Abflachung des Fußgewölbes und unauffällige Plantarfaszie. Normale Artikulation im Rückfuß, Mittelfußes und Vorfußes. Im Seitenvergleich rechts geringere degenerative Veränderungen des Großzehengrundgelenkes. Keine Signalauffälligkeiten an den Beuge- und Strecksehnen."""
* performer[+] = Reference(PractitionerRoleSemiStructuredReportAuthor)
* subject = Reference(PatientSemiStructuredReport)
* effectiveDateTime = "2025-05-08T00:00:00Z"