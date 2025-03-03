Instance: A-5.1-ImagingProcedureDescriptionMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.5.1 Imaging Procedure Description"
Description: """
The procedure information is expected to be part of the `ImProcedure` profile and not on `ImagingStudy.procedure` as there is a large overlap in information that is to be presented.
"""
* name = "A.5.1"
* title = "A.5.1 Imaging Procedure Description"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.3 Order Reason section and the FHIR profiles. The rationale related to representing procedure phases can be found in [Design consideration: Procedure Phases](design-considerations.html#procedure-phases)."
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-procedure" 
  * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurenceDateTime, "As a single time", #equivalent )
  * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurencePeriod, "As a time period", #equivalent )
  * insert ElementMapping( #procedureText, "A.5.1.3 Procedure text", #note, "", #equivalent )
  * insert ElementMapping( #procedureCode, "A.5.1.4 Procedure code", #code, "", #equivalent )
  * insert ElementMapping( #procedureName, "A.5.1.5 Procedure name", #code.display, "Name of procedure in coding standard.", #equivalent )
  // * insert ElementMapping( #anatomicalFocus, "A.5.1.6 Anatomical focus", #equivalent, "Anatomical focus", #equivalent )
  * insert ElementMapping( #bodyLocation, "A.5.1.6.1 Body location", #bodySite, "", #equivalent )
  // * insert ElementMapping( #laterality, "A.5.1.6.2 Laterality", #equivalent, "Laterality", #equivalent )
  * insert ElementMapping( #deviceId, "A.5.1.7 Device ID", #performer[imaging-device], "Performer representing the imaging device.", #equivalent )
  * insert ElementMapping( #performer, "A.5.1.8 Performer", #performer[performer], "The healthcare professional performing the study.", #equivalent )
  * insert ElementMapping( #performerId, "A.5.1.8.1 Performer Id", ##performer[performer].actor.practitioner.id, "", #equivalent )
  * insert ElementMapping( #performerName, "A.5.1.8.2 Performer Name", #performer[performer].actor.practitioner.name, "", #equivalent )
  * insert ElementMapping( #performerOrganization, "A.5.1.8.3 Performer Organisation", #performer[performer].actor.organization., "", #equivalent )
  * insert ElementMapping( #additionalProcedureDetails, "A.5.1.9 Additional procedure details", #note, "Uncoded information", #equivalent )
  // * insert ElementMapping( #additionalProcedureDetails, "A.5.1.9 Additional procedure details", #note, "Uncoded information", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-imagingstudy"
  * insert ElementMapping( #modality, "A.5.1 Imaging Procedure Description", #partOf[imagingstudy], "", #equivalent )
  * insert ElementMapping( #modality, "A.5.1.1 Modality", #modality, "", #equivalent )
  * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #started, "", #equivalent )
  // * insert ElementMapping( #procedureText, "A.5.1.3 Procedure text", #equivalent, "Procedure text", #equivalent )
  // * insert ElementMapping( #procedureCode, "A.5.1.4 Procedure code", #equivalent, "Procedure code", #equivalent )
  // * insert ElementMapping( #procedureName, "A.5.1.5 Procedure name", #equivalent, "Procedure name", #equivalent )
  * insert ElementMapping( #anatomicalFocus, "A.5.1.6 Anatomical focus", #series.bodySite, "Include code and when required reference to body site or structure.", #equivalent )
  * insert ElementMapping( #bodyLocation, "A.5.1.6.1 Body location", #series.bodySite, "", #equivalent )
  * insert ElementMapping( #laterality, "A.5.1.6.2 Laterality", #series.laterality, "", #equivalent )
  // * insert ElementMapping( #deviceId, "A.5.1.7 Device ID", #equivalent, "Device ID", #equivalent )
  // * insert ElementMapping( #performer, "A.5.1.8 Performer", #equivalent, "Performer", #equivalent )
  // * insert ElementMapping( #performerId, "A.5.1.8.1 Performer Id", #equivalent, "Performer Id", #equivalent )
  // * insert ElementMapping( #performerName, "A.5.1.8.2 Performer Name", #equivalent, "Performer Name", #equivalent )
  // * insert ElementMapping( #performerOrganization, "A.5.1.8.3 Performer Organization", #equivalent, "Performer Organization", #equivalent )
  // * insert ElementMapping( #additionalProcedureDetails, "A.5.1.9 Additional procedure details", #equivalent, "Additional procedure details", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-performer"
  * insert ElementMapping( #performerId, "A.5.1.8.1 Performer Id", #practitioner.identifier, "", #equivalent )
  * insert ElementMapping( #performerName, "A.5.1.8.2 Performer Name", #practitioner.name, "", #equivalent )
  * insert ElementMapping( #performerOrganization, "A.5.1.8.3 Performer Organisation", #organization, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  * insert ElementMapping( #performerId, "A.5.1.8.1 Performer Id", #identifier, "", #equivalent )
  * insert ElementMapping( #performerName, "A.5.1.8.2 Performer Name", #name, "", #equivalent )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-body-structure" 
  // * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurrenceDateTime, "As a single time", #equivalent )
  // * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurrencePeriod, "As a time period", #equivalent )
  // * insert ElementMapping( #procedureText, "A.5.1.3 Procedure text", #note, "", #equivalent )
  // * insert ElementMapping( #procedureCode, "A.5.1.4 Procedure code", #code, "", #equivalent )
  // * insert ElementMapping( #procedureName, "A.5.1.5 Procedure name", #code.display, "Name of procedure in coding standard.", #equivalent )
  // * insert ElementMapping( #anatomicalFocus, "A.5.1.6 Anatomical focus", #equivalent, "Anatomical focus", #equivalent )
  * insert ElementMapping( #bodyLocation, "A.5.1.6.1 Body location", #morphology, "", #equivalent )
  * insert ElementMapping( #bodyLocation, "A.5.1.6.1 Body location", #includedStructure, "", #equivalent )
  * insert ElementMapping( #bodyLocation, "A.5.1.6.1 Body location", #excludedStructure, "", #equivalent )
  * insert ElementMapping( #laterality, "A.5.1.6.2 Laterality", #includedStructure.laterality, "", #equivalent )
  // * insert ElementMapping( #deviceId, "A.5.1.7 Device ID", #equivalent, "Device ID", #equivalent )
  // * insert ElementMapping( #performer, "A.5.1.8 Performer", #equivalent, "Performer", #equivalent )
  // * insert ElementMapping( #performerId, "A.5.1.8.1 Performer Id", #equivalent, "Performer Id", #equivalent )
  // * insert ElementMapping( #performerName, "A.5.1.8.2 Performer Name", #equivalent, "Performer Name", #equivalent )
  // * insert ElementMapping( #performerOrganization, "A.5.1.8.3 Performer Organization", #equivalent, "Performer Organization", #equivalent )
  // * insert ElementMapping( #additionalProcedureDetails, "A.5.1.9 Additional procedure details", #equivalent, "Additional procedure details", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-imaging-device" 
  // * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurrenceDateTime, "As a single time", #equivalent )
  // * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurrencePeriod, "As a time period", #equivalent )
  // * insert ElementMapping( #procedureText, "A.5.1.3 Procedure text", #note, "", #equivalent )
  // * insert ElementMapping( #procedureCode, "A.5.1.4 Procedure code", #code, "", #equivalent )
  // * insert ElementMapping( #procedureName, "A.5.1.5 Procedure name", #code.display, "Name of procedure in coding standard.", #equivalent )
  // * insert ElementMapping( #anatomicalFocus, "A.5.1.6 Anatomical focus", #equivalent, "Anatomical focus", #equivalent )
  // * insert ElementMapping( #bodyLocation, "A.5.1.6.1 Body location", #bodySite, "", #equivalent )
  // * insert ElementMapping( #laterality, "A.5.1.6.2 Laterality", #equivalent, "Laterality", #equivalent )
  * insert ElementMapping( #deviceId, "A.5.1.7 Device ID", #equivalent, "Device ID", #equivalent )
  // * insert ElementMapping( #performer, "A.5.1.8 Performer", #equivalent, "Performer", #equivalent )
  // * insert ElementMapping( #performerId, "A.5.1.8.1 Performer Id", #equivalent, "Performer Id", #equivalent )
  // * insert ElementMapping( #performerName, "A.5.1.8.2 Performer Name", #equivalent, "Performer Name", #equivalent )
  // * insert ElementMapping( #performerOrganization, "A.5.1.8.3 Performer Organization", #equivalent, "Performer Organization", #equivalent )
  // * insert ElementMapping( #additionalProcedureDetails, "A.5.1.9 Additional procedure details", #equivalent, "Additional procedure details", #equivalent )


* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport-imaging-proc-description"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-imaging-study-phase" 
  // * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurrenceDateTime, "As a single time", #equivalent )
  // * insert ElementMapping( #procedureDate, "A.5.1.2 Procedure date", #occurrencePeriod, "As a time period", #equivalent )
  // * insert ElementMapping( #procedureText, "A.5.1.3 Procedure text", #note, "", #equivalent )
  // * insert ElementMapping( #procedureCode, "A.5.1.4 Procedure code", #code, "", #equivalent )
  // * insert ElementMapping( #procedureName, "A.5.1.5 Procedure name", #code.display, "Name of procedure in coding standard.", #equivalent )
  // * insert ElementMapping( #anatomicalFocus, "A.5.1.6 Anatomical focus", #equivalent, "Anatomical focus", #equivalent )
  // * insert ElementMapping( #bodyLocation, "A.5.1.6.1 Body location", #bodySite, "", #equivalent )
  // * insert ElementMapping( #laterality, "A.5.1.6.2 Laterality", #equivalent, "Laterality", #equivalent )
  // * insert ElementMapping( #deviceId, "A.5.1.7 Device ID", #equivalent, "Device ID", #equivalent )
  // * insert ElementMapping( #performer, "A.5.1.8 Performer", #equivalent, "Performer", #equivalent )
  // * insert ElementMapping( #performerId, "A.5.1.8.1 Performer Id", #equivalent, "Performer Id", #equivalent )
  // * insert ElementMapping( #performerName, "A.5.1.8.2 Performer Name", #equivalent, "Performer Name", #equivalent )
  // * insert ElementMapping( #performerOrganization, "A.5.1.8.3 Performer Organisation", #equivalent, "Performer Organisation", #equivalent )
  * insert ElementMapping( #additionalProcedureDetails, "A.5.1.9 Additional procedure details", #category, "marks it as a phase", #equivalent )
  

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #imagingProcedureDescription, "A.5.1 Imaging procedure description", #section[procedure].entry[procedure], "", #source-is-broader-than-target )
  * insert ElementMapping( #imagingProcedureDescription, "A.5.1 Imaging procedure description", #section[procedure].entry[performer], "", #source-is-broader-than-target )
  * insert ElementMapping( #imagingProcedureDescription, "A.5.1 Imaging procedure description", #section[procedure].entry[imaging-device], "", #source-is-broader-than-target )
  * insert ElementMapping( #imagingProcedureDescription, "A.5.1 Imaging procedure description", #section[procedure].entry[imaging-phase], "", #source-is-broader-than-target )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-examreport"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
  * insert ElementMapping( #orderInformation, "A.2 Order Information", #supportingInfo[procedure], "", #equivalent )

