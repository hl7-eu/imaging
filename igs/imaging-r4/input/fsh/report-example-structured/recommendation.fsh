Instance: ComeBackNextYearServiceRequest
InstanceOf: ServiceRequest
Title: "ServiceRequest: structured report recommendation"
Description: "Order to come back next year"
Usage: #example
* status = #active
* intent = #proposal
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
* code = http://www.ama-assn.org/go/cpt#93351 "Real time transthoracic echocardiography with 2-dimensional (2D) image documentation during rest and cardiovascular stress test using treadmill, bicycle exercise and pharmacologically induced stress, with interpretation and report, including performance of continuous electrocardiographic monitoring, with physician supervision"
* occurrencePeriod
  * start = "2004-06-01"
  * end = "2004-06-01"
* requester.reference = "urn:uuid:11111111-2222-4333-8444-000000000005"