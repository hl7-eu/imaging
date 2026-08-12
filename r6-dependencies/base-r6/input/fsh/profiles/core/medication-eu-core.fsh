//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  MedicationEuCore
Parent:   Medication
Id:       medication-eu-core
Title:    "Medication (EU core)"
Description: """This profile introduces essential constraints and extensions for the Medication resource that apply across multiple use cases."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
* batch
  * lotNumber ^short = "Lot Number"
  * expirationDate ^short = "Expiration Date"
// Common R4 R5
* extension contains $ihe-ext-medication-productname named productName 0..1
* extension[productName] ^short = "Current trade name (authorised name) of the medicinal product." 
* extension contains $ihe-ext-medication-classification named classification 0..*
* extension[classification] ^short = "Classifications of the product, e.g ATC, narcotic/psychotropic, orphan drug, etc"
* extension contains $ihe-ext-medication-sizeofitem named sizeOfItem 0..1
* extension[sizeOfItem] ^short = "Size of one item (for example, in a pack of 5 vials, this would represent the size of 1 vial)"
* extension contains $ihe-ext-medication-characteristic named characteristic 0..*
* extension[characteristic] ^short = "Specifies other descriptive properties of the medication."
* extension contains $ihe-ext-medication-unitofpresentation named unitOfPresentation 0..1
* extension[unitOfPresentation] ^short = "Unit of presentation of the product (e.g. tablet, vial, ampoule, etc)"
* extension contains MedicationPackageType named packageType 0..1
* extension[packageType] ^short = "Type of container. This information is more relevant in cases when the packaging has an impact on administration of the product (e.g. pre-filled syringe)"
* extension contains $ihe-ext-medication-device named device 0..*
* extension[device] ^short = "Device, typically an administration device, included in the product."
* extension[device].extension[device].valueCodeableConcept from $eHDSIPackage (example)
* identifier
  * ^short = "Identifier for the medicinal product, its generic representation, or packaged product (e.g. EMA PMS ID on product or package level)" //identifier
* code 
  * ^short = "A terminology-based code for the product (e.g. SNOMED CT code)"
* ingredient
  * ^short = "Ingredient or a part product. For combination packs, each ingredient can be a separate manufactured item with its own ingredients, dose form, and strength" // item
  * isActive ^short = "Active ingredient indicator. By default, only active ingredients are expected - therefore, the default value is true."
// Only R5 rules
//* insert ImposeProfile ( $Medication-ihe , 0)

* totalVolume
  * ^short = "Total volume or number of package items inside a package. This element should not contain overall prescribed amount, but describe the product itself. In case of complex packages, this element could be left empty, and number of different items could be indicated in the nested Medications." //packSize (almost)
* ingredient
  * item only CodeableReference (Substance or MedicationEuCore)
    * ^short = "Substance (Substance resource or concept from terminology) or a medicinal product (Medication resource or concept from terminology). Medicinal product can be an ingredient in case of extemporal medications or combination packs (e.g Creme + 6 tablets)" 

  * item from $substance-codes (example)
    * ^binding.additional.purpose = #preferred
    * ^binding.additional.valueSet = $eHDSISubstance
    * ^binding.additional.documentation = """MyHealth@EU crossborder value set for substances. Based on EMA SPOR SMS.""" 

  * strength[x] ^short = "Amount of substance in product (presentation or concentration strength)"
  * strength[x] ^definition = """Definitional resources should be used for specifying the different types of strengths: presentation, concentration."""
  * strength[x] 
    * extension contains $ihe-ext-medication-strengthsubstance named basisOfStrengthSubstance 0..1 
    * extension[basisOfStrengthSubstance] ^short = "Basis of strength substance - substance for which the strength is provided (this could be different from the precise active ingredient)."

* doseForm
  * ^short = "Dose form. For a branded product, this would most likely be authorised dose form, but it could also be administrable dose form. For package items, it could be item's individual dose form." // doseForm
  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = $eHDSIDoseForm
  * ^binding.additional.documentation = """MyHealth@EU crossborder value set for dose forms. Based on EDQM Standard Terms.""" 

* marketingAuthorizationHolder ^short = "Marketing authorisation holder of the medicinal product. If the product does not have a marketing authorisation, the manufactured information may be used. It is sufficient to populate only name and optionally an identifier of the organisation."

// Only R4 rules
