<!--
  Generated file. Do not edit.
-->

#### EHDSAddress

The following table shows the mapping from EHDSAddress logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSAddress.use | EuAddress.use |  |
| EHDSAddress.type | EuAddress.type |  |
| EHDSAddress.text | EuAddress.text |  |
| EHDSAddress.street | EuAddress.line ; EuAddress.line.extension[streetName] |  |
| EHDSAddress.houseNumber | EuAddress.line ; EuAddress.line.extension[houseNumber] |  |
| EHDSAddress.postBox | EuAddress.line ; EuAddress.line.extension[postBox] |  |
| EHDSAddress.city | EuAddress.city |  |
| EHDSAddress.postalCode | EuAddress.postalCode |  |
| EHDSAddress.country | EuAddress.country ; EuAddress.country.extension[countryCode] |  |

