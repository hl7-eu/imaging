Logical: MedicalImagingReportOrderEhn
Id: ehn-medical-imaging-report-order
Title: "A.2 Order information"
Description:  "Note: an imaging report could respond to multiple orders."
* insert SetFmmAndStatusRule( 2, informative)
* orderId 0..1 Identifier "A.2.1 Order ID" """
  A unique identifier of the imaging study order.
  """
* orderDateTime 0..1 dateTime "A.2.2 Order date and time" """
  Date and time of the order placement. ISO 8601
  """
* orderPlacerIdentifier 0..1 Identifier "A.2.3 Order placer professional identifier" """
  The health professional identification number. Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the license or registration number.
  """
* orderPlacerName 0..* HumanName "A.2.4 Order placer name" """
  Person name.
  """
* orderPlacerSpecialty 0..1 CodeableConcept "A.2.5 Order placer specialty" """
  Medical specialty of the requester (e.g. Oncology, Neurosurgery, Dermatology, Gastroenterology). SNOMED CT
  """
* orderPlacerContactDetails 0..1 ContactPoint "A.2.6 Order placer contact details" """
  Contact details of order placer (address and telecom details).
  """
* orderPlacerOrganization 0..1 string "A.2.7 Order placer organization" """
  Order placer organization information.
  """
