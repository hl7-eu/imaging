Instance: Example1-ImagingStudyManifest
InstanceOf: ImImagingStudyManifest
Title: "Example ImagingStudy Manifest"
Description: "Example ImagingStudy Manifest"
Usage: #example
* type = #searchset
* timestamp = 1993-11-29T12:36:56+00:00
* entry[+]
  * fullUrl = "ImagingStudy/1"
  * resource = Example1-ImagingStudy
* entry[+]
  * fullUrl = "Patient/patient"
  * resource = Example1-Patient
* entry[+]
  * fullUrl = "Endpoint/endpoint"
  * resource = Example-WadoEndpoint
* entry[+]
  * fullUrl = "Practitioner/referrer"
  * resource = Example1-referrer

Instance: Example1-ImagingStudy
InstanceOf: ImImagingStudy
Usage: #inline
* id = "1"
* identifier
  * type = MissingDicomTerminology#0020000D "Study Instance UID" 
  * system = "urn:dicom:uid"
  * value  =  "999.999.3859744"
* status = #available
* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* subject = Reference( Example1-Patient )
* started = 1993-11-29T12:36:56+00:00
* referrer = Reference( Example1-referrer )
* endpoint = Reference( Example-WadoEndpoint )
* series[+]
  * uid = "999.999.94827453"
  * modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
  * description = "SINUS VAL ANEUR"
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.9"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.6.1
    * number = 8
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.21"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 20
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.7"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 6
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.11"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 10
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.15"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 14
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.17"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 16
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.33"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 32
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.29"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 28
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.23"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 22
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.27"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 26
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.25"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.3.1
    * number = 24
  * instance[+]
    * uid = "999.999.133.1996.1.1800.1.6.37"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.6.1
    * number = 36

Instance: Example1-Patient
InstanceOf: ImPatient
Title: "Example Patient"
Usage: #inline
* id = "patient"
* identifier[0].use = #usual
* identifier[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].type.coding[0].code = #MR
* identifier[0].type.coding[0].display = "Medical Record number"
* identifier[0].system = "DCM4CHEE.22D779C5.54A03542"
* identifier[0].value = "454a8e3b-0669-68bc-c3de-3f51e3b766f5"
* name[0].use = #usual
* name[0].text = "Banaan Aarbei Citroen"
* name[0].family = "Citroen"
* name[0].given[0] = "Banaan"
* name[0].given[1] = "Aardbei"
* gender = #female
* birthDate = 2002-01-01

Instance: Example1-referrer
InstanceOf: PractitionerEu
Title: "Example Performer"
Usage: #inline
* id = "referrer"
* name[+] 
  * family = "Bloemkool"
  * given[0] = "Broccoli"