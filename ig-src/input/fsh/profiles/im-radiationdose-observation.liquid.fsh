Profile: ObservationRadiationDoseEuImaging
Parent: $EuObservation
Title: "Observation: Radiation Dose"
Description: """
A record for the radiation dose the subject has been exposed to during an imaging procedure.
E.g. based on information from https://dicom.nema.org/medical/dicom/current/output/html/part16.html and https://build.fhir.org/ig/HL7/fhir-radiation-dose-summary-ig/index.html
"""
* insert SetFmmAndStatusRule( 1, draft )

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains ServiceRequestOrderEuImagingaccession 0..1
* insert BasedOnServiceRequestOrderEuImagingReference( ServiceRequestOrderEuImagingaccession )

* identifier 0..*
  * insert SliceElement( #value, type )
* identifier contains radiation-sr-instance-uid 0..1
* identifier[radiation-sr-instance-uid]
  * type = MissingDicomTerminology#00083010 // "Irradiation Event UID"

* partOf 1..*
  * insert SliceElement( #profile, $this )
* partOf contains study 1..1
* partOf[study] only Reference( ImagingStudyEuImaging )

{{R4}}* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.derivedFrom named derivedFrom 1..*
{{R4}}* extension[derivedFrom] contains srImagingSelection 1..* 
{{R4}}* extension[derivedFrom][srImagingSelection].value[x] only Reference( SrInstanceImagingSelectionEuImaging )

{{R5}}* derivedFrom
{{R5}}  * insert SliceElement( #profile, $this )
{{R5}}* derivedFrom contains dicomSrInstance 1..1
{{R5}}* derivedFrom[dicomSrInstance] only Reference( SrInstanceImagingSelectionEuImaging )

* code
  * coding 1..*
    * insert SliceElement( #value, $this )
  * coding contains radiation-dose 1..1
  * coding[radiation-dose] = $loinc#73569-6 // "Radiation exposure and protection information [Description] Document Diagnostic imaging"

* subject 1..1
* subject only Reference( $EuPatient )

// value
* value[x] 1..1 
* value[x] only string
* valueString ^short = "Dose Summary text."
* valueString ^comment = "Textual representation of the dose summary based computed by the Dose Management system. Based on a locally defined template, definition of which is out of scope of this IG."

// Performing irradiation device
* device 
* device only Reference(DeviceEuImaging)
* device ^short = "Irradiating modality"

// dose measurements
* component
  * insert SliceElement( #value, code )
* component contains 
    doseAreaProductTotal 0..* and fluorDoseAreaProductTotal 0..* and doseAreaProduct 0..* and
    CTDoseLengthProductTotal 0..* and DLP 0..* and DLPAlertValue 0..* and AccumulatedDLPForwardEstimate 0..* and DLPNotificationValue 0..* and DLPForwardEstimate 0..* and CRDoseLengthProductSubTotal 0..* and
    CTEffectiveDoseTotal 0..* and EffectiveDose 0..*

* component[doseAreaProductTotal]
  * code = $dcm#113722 // "Dose Area Product Total"
  * value[x] only Quantity
  * valueQuantity from GraySquareUnitsEuImaging
* component[fluorDoseAreaProductTotal]
  * code = $dcm#113726 // "Fluoro Dose Area Product Total"
  * value[x] only Quantity
  * valueQuantity from GraySquareUnitsEuImaging
* component[doseAreaProduct]
  * code = $dcm#122130 // "Dose Area Product"
  * value[x] only Quantity
  * valueQuantity from GraySquareUnitsEuImaging

* component[CTDoseLengthProductTotal]
  * code = $dcm#113813 // "CT Dose Length Product Total"
  * value[x] only Quantity
  * valueQuantity from DoseLengthUnitsEuImaging
* component[DLP]
  * code = $dcm#113838 // "DLP"
  * value[x] only Quantity
  * valueQuantity from DoseLengthUnitsEuImaging
* component[DLPAlertValue]
  * code = $dcm#113903 // "DLP Alert Value"
  * value[x] only Quantity
  * valueQuantity from DoseLengthUnitsEuImaging
* component[AccumulatedDLPForwardEstimate]  
  * code = $dcm#113905 // "Accumulated DLP Forward Estimate"
  * value[x] only Quantity
  * valueQuantity from DoseLengthUnitsEuImaging
* component[DLPNotificationValue]
  * code = $dcm#113911 // "DLP Notification Value"
  * value[x] only Quantity
  * valueQuantity from DoseLengthUnitsEuImaging
* component[DLPForwardEstimate]
  * code = $dcm#113913 // "DLP Forward Estimate"
  * value[x] only Quantity
  * valueQuantity from DoseLengthUnitsEuImaging
* component[CRDoseLengthProductSubTotal]
  * code = $dcm#130745 // "CT Dose Length Product Sub-Total"
  * value[x] only Quantity
  * valueQuantity from DoseLengthUnitsEuImaging

* component[CTEffectiveDoseTotal]
  * code = $dcm#113814 // "CT Effective Dose Total"
  * value[x] only Quantity
  * valueQuantity from EffectiveDoseUnitsEuImaging
* component[EffectiveDose]
  * code = $dcm#113839 // "Effective Dose"
  * value[x] only Quantity
  * valueQuantity from EffectiveDoseUnitsEuImaging

ValueSet: EffectiveDoseUnitsEuImaging
Id: im-effective-dose-units
Title: "ValueSet: Effective Dose Units"
Description: "Units for Effective Dose."
* insert UCUMCopyrightForVS
* ^experimental = false
* $ucum#Sv        // Effective Dose
* $ucum#mSv       // Effective Dose

ValueSet: DoseLengthUnitsEuImaging
Id: im-dose-length-units
Title: "ValueSet: Dose Length Units"
Description: "Units for Dose Length."
* ^experimental = false
* $ucum#mGy.cm // Dose length product

ValueSet: GraySquareUnitsEuImaging
Id: im-gray-square-units
Title: "ValueSet: Gray Square Units"
Description: "Units for Gray Square."
* ^experimental = false
* $ucum#Gy.m2   // Dose area product
* $ucum#mGy.cm2   // Dose area product