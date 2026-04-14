Instance: ComeBackNextYearServiceRequest
InstanceOf: ServiceRequest
Title: "ServiceRequest: structured report recommendation"
Description: "Order to come back next year"
Usage: #example
* status = #active
* intent = #proposal
* subject = Reference(PatientStructuredReport)
* code = $loinc#18107-3 "Cardiac echo study Procedure stress method"
* occurrencePeriod
  * start = "2004-06-01"
  * end = "2004-06-01"
* requester = Reference(PractitionerRoleStructuredReportAuthor)
* basedOn // order
  * type = #ServiceRequest
  * identifier
    * type
      * coding[+] = $v2-0203#ACSN 
      * coding[+] = http://dicom.nema.org/resources/ontology/DCM#121022 "Accession Number"
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "87654321" // invented - not there in the report
