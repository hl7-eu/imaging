<!--
  Generated file. Do not edit.
-->

#### EHDSAddress

The following table shows the mapping from EHDSAddress logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| use | EuAddress.use |  |
| type | EuAddress.type |  |
| text | EuAddress.text |  |
| street | EuAddress.line ; EuAddress.line.extension[streetName] |  |
| houseNumber | EuAddress.line ; EuAddress.line.extension[houseNumber] |  |
| postBox | EuAddress.line ; EuAddress.line.extension[postBox] |  |
| city | EuAddress.city |  |
| postalCode | EuAddress.postalCode |  |
| country | EuAddress.country ; EuAddress.country.extension[countryCode] |  |

