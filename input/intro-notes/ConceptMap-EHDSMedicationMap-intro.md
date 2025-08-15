{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSMedication {
  <<XtEHR dataset>>
  identifyingCode[x]
  classification
  productName
  marketingAuthorisationHolder
  marketingAuthorisationHolder.organisationName
  marketingAuthorisationHolder.organisationIdentifier
  doseForm
  packSize
  item
  item.doseForm
  item.ingredient
  item.ingredient.isActive
  item.ingredient.substance
  item.ingredient.strengthInfo
  item.ingredient.strengthInfo.strength
  item.ingredient.strengthInfo.basisOfStrengthSubstance
  item.unitOfPresentation
  item.containedQuantity
  item.amount
  item.packageType
  device
  device.deviceQuantity
  device.device[x]
  characteristic
  characteristic.type
  characteristic.value[x]
  batch
  batch.lotNumber
  batch.expirationDate
}
link EHDSMedication "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedication.html"
class orphan drug{
  <<FHIR>>
  etc.)
}

class 1 creme & 6 pessaries)
EHDSMedication --> orphan drug
EHDSMedication --> 1 creme & 6 pessaries)
```

