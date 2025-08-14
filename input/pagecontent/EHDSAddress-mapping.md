<!--
  Generated file. Do not edit.
-->

---
title: EHDSAddress Mapping
---

### EHDSAddress

The following table shows the mapping from EHDSAddress logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| city | EuAddress.city |  |
| country | EuAddress.country ; EuAddress.country.extension[countryCode] |  |
| houseNumber | EuAddress.line ; EuAddress.line.extension[houseNumber] |  |
| postBox | EuAddress.line ; EuAddress.line.extension[postBox] |  |
| postalCode | EuAddress.postalCode |  |
| street | EuAddress.line ; EuAddress.line.extension[streetName] |  |
| text | EuAddress.text |  |
| type | EuAddress.type |  |
| use | EuAddress.use |  |

