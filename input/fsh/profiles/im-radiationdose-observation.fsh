Profile: ImRadiationDoseObservation
Parent: $EuObservation
Title: "Radiation Dose Observation"
Description: """
A record for the radiation dose the subject has been exposed to during an imaging procedure.
E.g. based on information from https://dicom.nema.org/medical/dicom/current/output/html/part16.html and https://build.fhir.org/ig/HL7/fhir-radiation-dose-summary-ig/index.html
"""
* insert SetFmmAndStatusRule( 1, draft )

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1
* insert BasedOnImOrderReference( imorderaccession )

* identifier 0..*
  * insert SliceElement( #value, type )
* identifier contains radiation-sr-instance-uid 0..1
* identifier[radiation-sr-instance-uid]
  * type = MissingDicomTerminology#00083010

* partOf 1..*
  * insert SliceElement( #profile, $this )
* partOf contains study 1..1
* partOf[study] only Reference( ImImagingStudy )

* derivedFrom 1..*
  * insert SliceElement( #profile, $this )
* derivedFrom contains dicomInstance 1..1
* derivedFrom[dicomInstance] only Reference( ImSrInstanceImagingSelection )

* code
  * coding 1..*
    * insert SliceElement( #value, $this )
  * coding contains radiation-dose 1..1
  * coding[radiation-dose] = $loinc#73569-6

* subject 1..1
* subject only Reference( $EuPatient )

// value
* value[x] 1..1 
* value[x] only string
* valueString ^short = "Dose Summary text."
* valueString ^comment = "Textual representation of the dose summary based computed by the Dose Management system. Based on a locally defined template, definition of which is out of scope of this IG."

// Performing irradiation device
* device 
* device only Reference(ImImagingDevice)
* device ^short = "Irradiating modality"

// dose measurements
* component
  * insert SliceElement( #value, code )
* component contains 
    doseAreaProductTotal 0..* and fluorDoseAreaProductTotal 0..* and doseAreaProduct 0..* and
    CTDoseLengthProductTotal 0..* and DLP 0..* and DLPAlertValue 0..* and AccumulatedDLPForwardEstimate 0..* and DLPNotificationValue 0..* and DLPForwardEstimate 0..* and CRDoseLengthProductSubTotal 0..* and
    CTEffectiveDoseTotal 0..* and EffectiveDose 0..*

* component[doseAreaProductTotal]
  * code = $dcm#113722
  * value[x] only QuantityEu
  * valueQuantity from ImGraySquareUnits
* component[fluorDoseAreaProductTotal]
  * code = $dcm#113726
  * value[x] only QuantityEu
  * valueQuantity from ImGraySquareUnits
* component[doseAreaProduct]
  * code = $dcm#122130
  * value[x] only QuantityEu
  * valueQuantity from ImGraySquareUnits

* component[CTDoseLengthProductTotal]
  * code = $dcm#113813
  * value[x] only QuantityEu
  * valueQuantity from ImDoseLengthUnits
* component[DLP]
  * code = $dcm#113838
  * value[x] only QuantityEu
  * valueQuantity from ImDoseLengthUnits
* component[DLPAlertValue]
  * code = $dcm#113903
  * value[x] only QuantityEu
  * valueQuantity from ImDoseLengthUnits
* component[AccumulatedDLPForwardEstimate]  
  * code = $dcm#113905
  * value[x] only QuantityEu
  * valueQuantity from ImDoseLengthUnits
* component[DLPNotificationValue]
  * code = $dcm#113911
  * value[x] only QuantityEu
  * valueQuantity from ImDoseLengthUnits
* component[DLPForwardEstimate]
  * code = $dcm#113913
  * value[x] only QuantityEu
  * valueQuantity from ImDoseLengthUnits
* component[CRDoseLengthProductSubTotal]
  * code = $dcm#130745
  * value[x] only QuantityEu
  * valueQuantity from ImDoseLengthUnits

* component[CTEffectiveDoseTotal]
  * code = $dcm#113814
  * value[x] only QuantityEu
  * valueQuantity from ImEffectiveDoseUnits
* component[EffectiveDose]
  * code = $dcm#113839
  * value[x] only QuantityEu
  * valueQuantity from ImEffectiveDoseUnits

ValueSet: ImEffectiveDoseUnits
Id: im-effective-dose-units
Title: "Effective Dose Units"
Description: "Units for Effective Dose."
* insert UCUMCopyrightForVS
* ^experimental = false
* $ucum#Sv        // Effective Dose
* $ucum#mSv       // Effective Dose

ValueSet: ImDoseLengthUnits
Id: im-dose-length-units
Title: "Dose Length Units"
Description: "Units for Dose Length."
* ^experimental = false
* $ucum#mGy.cm // Dose length product

ValueSet: ImGraySquareUnits
Id: im-gray-square-units
Title: "Gray Square Units"
Description: "Units for Gray Square."
* ^experimental = false
* $ucum#Gy.m2   // Dose area product
* $ucum#mGy.cm2   // Dose area product