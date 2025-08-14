{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSAddress {
  <<XtEHR dataset>>
  use
  type
  text
  street
  houseNumber
  postBox
  city
  postalCode
  country
}
link EHDSAddress "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSAddress.html"
class EuAddress{
  <<FHIR>>
  use
  type
  text
  line
  line.extension[streetName]
  line.extension[houseNumber]
  line.extension[postBox]
  city
  postalCode
  country
  country.extension[countryCode]
}

EHDSAddress --> EuAddress
```

