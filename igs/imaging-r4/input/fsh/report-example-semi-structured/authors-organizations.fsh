//////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: PractitionerRoleSemiStructuredReportAuthor
InstanceOf: PractitionerRoleEu
Title: "PractitionerRole: semi-structured"
Description: "The role the author has in the organization."
Usage: #example
* practitioner = Reference(PractitionerSemiStructuredReportAuthor)
* organization = Reference(OrganizationSemiStructuredReport)
* code = $sct#66862007 "Radiologist"

Instance: PractitionerSemiStructuredReportAuthor
InstanceOf: PractitionerEu
Title: "Practitioner: semi-structured report."
Description: "The author details"
Usage: #example
* name
  * use = #official
  * text = "Dr. Lucas Gasenzer"
  * family = "Gasenzer"
  * given = "Lucas"

Instance: OrganizationSemiStructuredReport
InstanceOf: OrganizationEu
Title: "Organization: semi-structured"
Description: "The organization employing the report author."
Usage: #example
* name = "Radiology Zentrum Bremen"
* contact
  * telecom
    * system = #phone
    * value = "+49 421 1234567"
    * use = #work
  * address
    * use = #work
    * line[+] = "Schwachhauser Heerstraße 54"
      * extension[+]
        * url = $street-name-url
        * valueString = "Schwachhauser Heerstraße"
      * extension[+]
        * url = $house-number-url 
        * valueString = "54"
    * postalCode = "28209"
    * city = "Bremen"
    * country = "Germany"
