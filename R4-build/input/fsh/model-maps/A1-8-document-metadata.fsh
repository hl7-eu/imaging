Instance: A-1-8-DocumentMetadataMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.8 Document Metadata"

// setting the target to im-diagnostic-report
* name = "A.1.8"
* title = "A.1.8 Document Metadata"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.8 Document Metadata section and the FHIR profiles."

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"
  
  * insert ElementMapping( #documentType, "A.1.8.1 Document type", #diagnosticReport.code, "", #equivalent )
  * insert ElementMapping( #accessionNumber, "A.1.8.11 Accession number", #diagnosticReport.basedOn:imorderaccession, "", #equivalent )
  * insert ElementMapping( #documentStatus, "A.1.8.2 Document status", #diagnosticReport.status, "", #equivalent )
  * insert ElementMapping( #reportDateTime, "A.1.8.3 Report date and time", #diagnosticReport.issued, "", #equivalent )
  * insert ElementMapping( #imagingProcedure, "A.1.8.5 Imaging procedure", #diagnosticReport.supportingInfo:procedure, "", #equivalent )
  * insert ElementMapping( #confidentiality, "A.1.8.7 Confidentiality", #diagnosticReport.meta.security, "", #equivalent )
  * insert ElementMapping( #language, "A.1.8.8 Language", #diagnosticReport.language, "", #equivalent )
  * insert ElementMapping( #version, "A.1.8.9 Version", #diagnosticReport.extension.artifactVersion, "", #equivalent )

// setting the target to im-composition
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"
  
  * insert ElementMapping( #documentType, "A.1.8.1 Document type", #composition.type, "", #equivalent )
  * insert ElementMapping( #documentStatus, "A.1.8.2 Document status", #composition.status, "", #equivalent )
  * insert ElementMapping( #reportDateTime, "A.1.8.3 Report date and time", #composition.date, "", #equivalent )
  * insert ElementMapping( #documentTitle, "A.1.8.4 Document title", #composition.title, "", #equivalent )
  * insert ElementMapping( #reportCustodian, "A.1.8.4 Document Custodian", #composition.custodian, "", #equivalent )
  * insert ElementMapping( #confidentiality, "A.1.8.7 Confidentiality", #composition.meta.security, "", #equivalent )
  * insert ElementMapping( #language, "A.1.8.7 Language", #composition.language, "", #equivalent )
  * insert ElementMapping( #version, "A.1.8.9 Version", #composition.extension.artifactVersion, "", #equivalent )

// setting the target to im-imaging-study
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-imagingstudy"
  
  * insert ElementMapping( #studyInstanceUID, "A.1.8.10 Legal Study Instance UID", #identifier:studyUID, "", #equivalent )

// setting the target to im-order
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-order"
  
  * insert ElementMapping( #accessionNumber, "A.1.8.11 Accession number", #order.identifier:accessionNumber, "", #equivalent )