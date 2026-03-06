Instance: ComeBackNextYearServiceRequest
InstanceOf: ServiceRequest
Title: "ServiceRequest: structured report recommendation"
Description: "Order to come back next year"
Usage: #example
* status = #active
* intent = #proposal
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
* code = $loinc#18107-3 "Cardiac echo study Procedure stress method"
* occurrencePeriod
  * start = "2004-06-01"
  * end = "2004-06-01"
* requester.reference = "urn:uuid:11111111-2222-4333-8444-000000000005"
* basedOn // order
  * type = #ServiceRequest
  * identifier
    * type
      * coding[+] = $v2-0203#ACSN 
      * coding[+] = $dcm#121022
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "87654321" // invented - not there in the report
