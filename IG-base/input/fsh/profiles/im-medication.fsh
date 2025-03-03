Profile: ImMedication
// TODO align with mpd or eps
Parent: Medication
Id: im-medication
Title: "Medication"
Description: "Based on EPD Medication profile. Reference it once it is published."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* insert MedicationEpCommon
* extension[productName] MS
* code MS
  * insert SetPopulateIfKnown
* ingredient MS
  * insert SetPopulateIfKnown
  * item MS
  * strength[x] MS
// //   * insert ElementMapping( #code, "A.5.2.2 Code", #code, "", #equivalent )
//   * insert ElementMapping( #activeIngredientList, "A.5.2.3 Active ingredient list", #ingredient, "", #equivalent )
//   * insert ElementMapping( #strength, "A.5.2.4 Strength", #ingredient.strength, "", #equivalent )
//   * insert ElementMapping( #pharmaceuticalDoseForm, "A.5.2.5 Pharmaceutical dose form", #doseForm, "", #equivalent )

// SOURCE EPD R5 Build
RuleSet: MedicationEpCommon
* extension contains MedicationProductName named productName 0..1 // productName
* extension[productName] ^short = "Name of the medicinal product. Names of different types (full name, short name, etc) and in different languages can be provided if relevant." 

* extension contains MedicationClassification named classification 0..* // classification
* extension[classification] ^short = "Classifications of the product, e.g ATC, narcotic/psychotropic, orphan drug, etc"

* extension contains MedicationSizeOfItem named sizeOfItem 0..1 // item.containedQuantity
* extension[sizeOfItem] ^short = "Size of one item (for example, in a pack of 5 vials, this would represent the size of 1 vial)"

* extension contains MedicationCharacteristic named characteristic 0..* // characteristic
* extension[characteristic] ^short = "Specifies other descriptive properties of the medication."

* extension contains MedicationUnitOfPresentation named unitOfPresentation 0..1 // item.unitOfPresentation
* extension[unitOfPresentation] ^short = "Unit of presentation of the product (e.g. tablet, vial, ampoule, etc)"

* extension contains PackageType named packageType 0..1
* extension[packageType] ^short = "Type of container. This information is more relevant in cases when the packaging has an impact on administration of the product (e.g. pre-filled syringe)"

* identifier // MS 
  * ^short = "Identifier for the medicinal product, its generic representation, or packaged product." //identifier
* code // MS 
  * ^short = "A terminology-based code for the product" // productCode
* ingredient // MS 
  * ^short = "Ingredient or a part product. For combination packs, each ingredient can be a separate manufactured item with its own ingredients, dose form, and strength" // item
  * isActive // MS // item.ingredient.role




