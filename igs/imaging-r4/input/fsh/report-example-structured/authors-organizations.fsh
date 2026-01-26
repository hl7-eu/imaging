//////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: PractitionerRoleStructuredReportAuthor
InstanceOf: PractitionerRoleEu
Title: "PractitionerRole: structured report"
Description: "Role of the report author."
Usage: #example
* practitioner = Reference(PractitionerSemiStructuredReportAuthor)
* organization = Reference(OrganizationSemiStructuredReport)
* code = $sct#394579002 "Cardiology"

Instance: PractitionerStructuredReportAuthor
InstanceOf: PractitionerEu
Title: "Practitioner: structured report"
Description: "The report author."
Usage: #example
* name
  * use = #official
  * text = "Ph.D. Philips van de JOCHEMSEN, Prof."
  * prefix = "Ph.D."
  * family = "van de Jochemsen"
  * given = "Philips"
  * suffix = "Prof."

Instance: OrganizationStructuredReport
InstanceOf: OrganizationEu
Title: "Organization: structured report"
Description: "Organization of the report author."
Usage: #example
* name = "Ultrasound centrum"
* contact
  * address
    * use = #work
    * line[+] = "Geluidsstraat 2"
      * extension[+]
        * url = $street-name-url
        * valueString = "Geluidsstraat"
      * extension[+]
        * url = $house-number-url 
        * valueString = "2"
    * postalCode = "999XS"
    * city = "VeelGeluid"
    * country = "Nederland"
