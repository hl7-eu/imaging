Instance: A-6-KeyImagesMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.6 Key images associated with this report"
Description: """Maps the A.6 Key Images section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "A.6"
* title = "A.6 Key images associated with this report"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN A.6 Key images associated with this report section and the FHIR profiles. \n
\n
A key choice in modelling this dataset is the resources to use, the model is based on the design consideration on [key image representation](http://130.145.232.202:8081/design-considerations.html#representation-of-key-images), both the DocumentReference and ImagingSelection resources are used to represent the key images. 
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order-media"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order-media"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-keyimages-document-reference" 
  * insert ElementMapping( #view, "A.6.1 View",                                               #description, "Described in text.", #equivalent )
  * insert ElementMapping( #view, "A.6.1 View",                                               #content.attachment.title, "Described in text.", #equivalent )
  * insert ElementMapping( #bodyLocation, "A.6.2 Body location",                              #bodysite, "", #equivalent )
  * insert ElementMapping( #mediaType, "A.6.3 Media type",                                    #attachment.contentType, "", #equivalent )
  * insert ElementMapping( #modality, "A.6.4 Modality",                                       #modality, "", #equivalent )
  * insert ElementMapping( #device, "A.6.5 Device",                                           #content.attachment.contentType, "", #equivalent )
  * insert ElementMapping( #format, "A.6.6 Format",                                           #content.attachment.width, "", #source-is-broader-than-target )
  * insert ElementMapping( #format, "A.6.6 Format",                                           #content.attachment.heigth, "", #source-is-broader-than-target )
  * insert ElementMapping( #format, "A.6.6 Format",                                           #content.attachment.frames, "", #source-is-broader-than-target )
  * insert ElementMapping( #duration, "A.6.7 Duration",                                       #content.attachment.duration, "", #equivalent )
  * insert ElementMapping( #performer, "A.6.8 Performer",                                     #author, "", #equivalent )
  * insert ElementMapping( #performerId, "A.6.8.1 Performer Id",                              #author.practitioner.id, "", #equivalent )
  * insert ElementMapping( #performerName, "A.6.8.2 Performer Name",                          #author.practitioner.naem, "", #equivalent )
  * insert ElementMapping( #performerType, "A.6.8.3 Performer Type",                          #author, "", #equivalent ) // TODO 
  * insert ElementMapping( #performerMedicalSpecialty, "A.6.8.4 Performer Medical Specialty", #author.practitioner.speciality, "", #equivalent )
  * insert ElementMapping( #performerOrganization, "A.6.8.5 Performer Organisation",          #author.organization, "", #equivalent )
  * insert ElementMapping( #performerContactDetails, "A.6.8.6 Performer Contact Details",     #author.practitioner.address, "", #equivalent )
  * insert ElementMapping( #performerContactDetails, "A.6.8.6 Performer Contact Details",     #author.practitioner.telecom, "", #equivalent )
  * insert ElementMapping( #comment, "A.6.9 Comment",                                         #description, "", #equivalent )
  * insert ElementMapping( #content, "A.6.10 Content",                                        #attachement.url, "", #equivalent )

  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-order-media"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-keyimages-imaging-selection" 
  * insert ElementMapping( #view, "A.6.1 View",                                               #extension[artifact-title], "", #equivalent )
  * insert ElementMapping( #bodyLocation, "A.6.2 Body location",                              #bodySite, "", #equivalent )
  * insert ElementMapping( #mediaType, "A.6.3 Media type",                                    #endpoint->DICOM, "The media type can be selected when retrieving the image through WADO.", #equivalent )
  * insert ElementMapping( #modality, "A.6.4 Modality",                                       #derivedFrom[study]->series.modality, "Can be retrieved from the ImagingStudy resource.", #equivalent )
  * insert ElementMapping( #device, "A.6.5 Device",                                           #derivedFrom[study]->#performer[device].actor, "", #equivalent )
  * insert ElementMapping( #format, "A.6.6 Format",                                           #endpoint->DICOM, "The information can be selected when retrieving the image through WADO.", #equivalent )
  * insert ElementMapping( #duration, "A.6.7 Duration",                                       #endpoint->DICOM, "The information can be selected when retrieving the image through WADO.", #equivalent )
  * insert ElementMapping( #performer, "A.6.8 Performer",                                     #performer.actor, "", #equivalent )
  * insert ElementMapping( #performerId, "A.6.8.1 Performer Id",                              #performer.practitioner.id, "", #equivalent )
  * insert ElementMapping( #performerName, "A.6.8.2 Performer Name",                          #performer.practitioner.naem, "", #equivalent )
  * insert ElementMapping( #performerType, "A.6.8.3 Performer Type",                          #performer, "", #equivalent ) // TODO 
  * insert ElementMapping( #performerMedicalSpecialty, "A.6.8.4 Performer Medical Specialty", #performer.practitioner.speciality, "", #equivalent )
  * insert ElementMapping( #performerOrganization, "A.6.8.5 Performer Organisation",          #performer.organization, "", #equivalent )
  * insert ElementMapping( #performerContactDetails, "A.6.8.6 Performer Contact Details",     #performer.practitioner.address, "", #equivalent )
  * insert ElementMapping( #performerContactDetails, "A.6.8.6 Performer Contact Details",     #performer.practitioner.telecom, "", #equivalent )
  * insert ElementMapping( #comment, "A.6.9 Comment",                                         #extension[artifact-description], "", #equivalent )
  * insert ElementMapping( #content, "A.6.10 Content",                                        ##endpoint->DICOM, "", #equivalent )
  

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition" 
  * insert ElementMapping( #media, "A.6 Key images associated with this report", #section[finding].entry[keyimage], "Inserted with findings that use them.", #equivalent )
  * insert ElementMapping( #media, "A.6 Key images associated with this report", #section[recommendation].entry[keyimage], "Inserted with findings that use them.", #equivalent )
  
// * group[+]
//  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report"
//   * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report" 
