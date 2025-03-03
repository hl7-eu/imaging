Instance: A-1-3-HealthInsurenceAndPaymentInformationMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.3 Health Insurance and Payment Information"
* name = "A.1.3"
* title = "A.1.3 Health Insurance and Payment Information mapping"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.3. Health Insurance and Payment Information section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-health-insurance-information"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-coverage" 
  * insert ElementMapping( #providerCode, "A.1.3.1 Health Insurance Provider Code", #insurer, "", #equivalent )
  * insert ElementMapping( #providerName, "A.1.3.2 Health insurance provider name", #insurer, "", #equivalent	 )
  * insert ElementMapping( #providerNumber, "A.1.3.3 Health insurance policy number", #identifier, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-health-insurance-information"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-health-insurance-provider"
  * insert ElementMapping( #providerCode, "A.1.3.1 Health Insurance Provider Code", #identifier, "", #equivalent )
  * insert ElementMapping( #providerName, "A.1.3.2 Health insurance provider name", #name, "", #equivalent )
  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-order"
  * insert ElementMapping( #insuranceAndPayment, "A.1.3 Health insurance", #insurance, "", #equivalent )

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * insert ElementMapping( #insuranceAndPayment, "A.1.3 Health insurance", #section[order].entry[order], "", #equivalent )
  * insert ElementMapping( #insuranceAndPayment, "A.1.3 Health insurance", #section[order].entry[insurance], "", #equivalent )
  * insert ElementMapping( #insuranceAndPayment, "A.1.3 Health insurance", #section[order].entry[insuranceprovider], "", #equivalent )
