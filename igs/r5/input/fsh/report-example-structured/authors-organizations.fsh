//////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: PractitionerRoleStructuredReportAuthor
InstanceOf: PractitionerRoleEu
// Usage: #inline
* practitioner = Reference(PractitionerSemiStructuredReportAuthor)
* organization = Reference(OrganizationSemiStructuredReport)
* code = $sct#394579002 "Cardiology"

Instance: PractitionerStructuredReportAuthor
InstanceOf: PractitionerEu
// Usage: #inline
* name
  * use = #official
  * text = "Ph.D. Philips van de JOCHEMSEN, Prof."
  * prefix = "Ph.D."
  * family = "van de Jochemsen"
  * given = "Philips"
  * suffix = "Prof."

Instance: OrganizationStructuredReport
InstanceOf: OrganizationEu
// Usage: #inline
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
