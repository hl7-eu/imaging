// based on https://drive.google.com/file/d/1nSxNX8MpVmhU2JfZIPK-k4ovI0AYHJyk/view?usp=drive_link

Instance: Example2-ImagingStudyManifest
InstanceOf: ImImagingStudyManifest
Title: "Example ImagingStudy Manifest"
Description: "Example ImagingStudy Manifest"
Usage: #example
* type = #searchset
* timestamp = 1993-11-29T12:36:56+00:00
* entry[+]
  * fullUrl = "ImagingStudy/1"
  * resource = Example2-ImagingStudy
* entry[+]
  * fullUrl = "Patient/patient"
  * resource = Example2-Patient
// if in KOS
//   (0008,0054) "Retrieve AET" (not present in DICOM KOS spec but mandatory in IHE KOS spec) is specified a mapping would have to exist in order to resolve the URL for WADO.
//   (0040,E011) "Retrieve Location UID" (not present in DICOM KOS spec but mandatory in IHE KOS spec) is specified this UID could be directly used for RAD-69 request. However for WADO a proper resolution would be required
//   (0008,1190) "Retrieve URL" (not present in DICOM KOS spec and IHE KOS spec) is specified it could be directly used as WADO base URL
// * entry[+]
//   * fullUrl = "Endpoint/endpoint"
//   * resource = Example2-WadoEndpoint
* entry[+]
  * fullUrl = "Practitioner/referrer"
  * resource = Example2-referrer

Instance: Example2-ImagingStudy
InstanceOf: ImImagingStudy
Usage: #inline
* id = "1"
* identifier
  * type = MissingDicomTerminology#0020000D "Study Instance UID"
  * system = "urn:dicom:uid"
  * value  =  "1.2.840.113674.1115.261.200.20240111.163748.100" // (0020,000D)
* status = #available
* subject = Reference( Example2-Patient )
* started = 2024-01-11T16:37:48+01:00 //(0008,0020)+(0008,0030)
* basedOn.identifier
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
  * system = "1.2.840.10008.2.16.4.999" // example
  * value = "123445678" //(0008,0050)
* referrer = Reference( Example2-referrer )
* endpoint = Reference( Example-WadoEndpoint )
* series[+]
  * uid = "1.3.6.1.4.1.40771.77902411457117259815679070341354945427" //(0020,000E)
  * number = 1 //(0020,0011)
  * modality = http://dicom.nema.org/resources/ontology/DCM#KO "Key Object Selection" // (0008,0060)
  * instance[+] // further mapping depends on resolution of https://github.com/hl7-eu/imaging/issues/49
    * uid = "999.999.133.1996.1.1800.1.6.9"
    * sopClass = urn:ietf:rfc:3986#1.2.840.10008.5.1.4.1.1.6.1
    * number = 8

Instance: Example2-Patient
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

Instance: Example2-referrer
InstanceOf: PractitionerEu
Title: "Example Performer"
Usage: #inline
* id = "referrer"
* name[+] // (0008,0090)
  * family = "Bloemkool"
  * given[0] = "Broccoli"