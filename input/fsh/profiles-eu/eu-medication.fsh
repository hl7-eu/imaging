
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  MedicationEu
Parent:   Medication
Title:    "Medication: EU Medication"
Description: "A medication profile for the EU."
//-------------------------------------------------------------------------------------------

* insert SetFmmAndStatusRule (1, draft)
* ingredient
  * item only CodeableReference ( $EuMedication )
  // * strength[x]
  //   * extension contains $ihe-ext-medication-strengthsubstance named strengthSubstance 0..1 
  //   * extension contains $ihe-ext-medication-strengthtype named strengthType 0..1

// * extension contains $ihe-ext-medication-productname named productName 0..1 // productName
// * extension[productName] ^short = "Name of the medicinal product. Names of different types (full name, short name, etc) and in different languages can be provided if relevant." 

// * extension contains $ihe-ext-medication-classification named classification 0..* // classification
// * extension[classification] ^short = "Classifications of the product, e.g ATC, narcotic/psychotropic, orphan drug, etc"

// * extension contains $ihe-ext-medication-sizeofitem named sizeOfItem 0..1 // item.containedQuantity
// * extension[sizeOfItem] ^short = "Size of one item (for example, in a pack of 5 vials, this would represent the size of 1 vial)"

// * extension contains $ihe-ext-medication-device named device 0..* // device
// * extension[device] ^short = "Device, typically an administration device, included in the product."

// * extension contains $ihe-ext-medication-characteristic named characteristic 0..* // characteristic
// * extension[characteristic] ^short = "Specifies other descriptive properties of the medication."

// * extension contains $ihe-ext-medication-unitofpresentation named unitOfPresentation 0..1 // item.unitOfPresentation
// * extension[unitOfPresentation] ^short = "Unit of presentation of the product (e.g. tablet, vial, ampoule, etc)"


