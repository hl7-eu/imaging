// placeholcer instances
Instance: ImInformationRecipient-example
InstanceOf: ImInformationRecipient
* active = true
* practitioner = Reference(ImPractitioner-example)

Instance: ImOrganization-example
InstanceOf: ImOrganization
* active = true

Instance: ImAuthor-example
InstanceOf: ImAuthor
* active = true
* practitioner = Reference(ImPractitioner-example)


Instance: ImLegalAuthenticator-example
InstanceOf: ImLegalAuthenticator
* active = true
* practitioner = Reference(ImPractitioner-example)


Instance: ImResultValidator-example
InstanceOf: ImResultValidator
* active = true
* practitioner = Reference(ImPractitioner-example)


Instance: ImPractitioner-example
InstanceOf: ImPractitioner
* active = true