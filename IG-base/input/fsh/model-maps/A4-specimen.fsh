Instance: A-4-SpecimenMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.4 Specimen"
* name = "A.4"
* title = "A.4 Specimen"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the A.3 Order Reason section and the FHIR profiles.  

The Specimen relates to a different type of information stored in a PACS: digital pathology. This has to analysed in more detail before inclusion in the IG. One of the things that might be impacted is the structure of the report.
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order-reason"
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order-reason"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-imagingstudy" 
  * insert ElementMapping( #specimenIdentifier, "A.4.1 Specimen identifier", #tbd , "To be done", #equivalent )
  * insert ElementMapping( #material, "A.4.2 Material", #tbd , "To be done", #equivalent )
  * insert ElementMapping( #collectionPeriod, "A.4.3 Collection period", #tbd , "To be done", #equivalent )
  * insert ElementMapping( #anatomicLocation, "A.4.4 Anatomic location", #tbd , "To be done", #equivalent )
  * insert ElementMapping( #morphology, "A.4.5 Morphology", #tbd , "To be done", #equivalent )
  * insert ElementMapping( #sourceDevice, "A.4.6 Source Device", #tbd , "To be done", #equivalent )
  * insert ElementMapping( #collectionProcedureMethod, "A.4.7 Collection procedure/method", #tbd , "To be done", #equivalent )
  * insert ElementMapping( #receivedDate, "A.4.8 Received date", #tbd, "To be done", #equivalent )


* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #specimenInformation, "A.4 Specimen information", #tbd , "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #specimenInformation, "A.4 Specimen information", #tbd , "", #equivalent )

