Instance: A-3-OrderReasonMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.3 Order Reason to FHIR profiles"
* name = "A.3"
* title = "A.3 Order Reason to FHIR profiles"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.3 Order Reason section and the FHIR profiles."
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order-reason"
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order-reason"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-order" 
  * insert ElementMapping( #reason, "A.3.1 Reason", #reason.concept.coding, "When the reason is expressed as a code", #source-is-broader-than-target )
  * insert ElementMapping( #reason, "A.3.1 Reason", #reason.concept.text, "When the reason is expressed as text", #source-is-broader-than-target )
  * insert ElementMapping( #problemDiagnosisCondition, "A.3.2 Problem", #supportingInfo[problem].coding, "When condition is expressed as a code", #equivalent )
  * insert ElementMapping( #problemDiagnosisCondition, "A.3.2 Problem", #supportingInfo[problem], "When condition is expressed as a Condition", #equivalent )
  * insert ElementMapping( #clinicalQuestion, "A.3.3 Clinical question", #reason.concept.coding, "When reason is expressed as code", #equivalent )
  * insert ElementMapping( #clinicalQuestion, "A.3.3 Clinical question", #reason.concept.text, "When reason is expressed as code", #equivalent )
  * insert ElementMapping( #clinicalQuestion, "A.3.3 Clinical question", #reason.concept.reference, "When reason is a reference to a structured element.", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #orderInformation, "A.2 Order Information", #based[ImOrder], "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #orderInformation, "A.2 Order Information", #based[ImOrder], "", #equivalent )

