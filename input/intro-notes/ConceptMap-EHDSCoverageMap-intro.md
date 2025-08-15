{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSCoverage {
  <<XtEHR dataset>>
  identifier
  type
  patient
  payor
  payor.payorEntity[x]
  payor.subscriberId
}
link EHDSCoverage "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSCoverage.html"
class EuCoverage{
  <<FHIR>>
  identifier
  type
  beneficiary
  kind
  paymentBy.party
  insurer
  subscriberId
}

class EuPatient {
  <<FHIR>>
}
class  EuRelatedPersion {
  <<FHIR>>
}
class  EuOrganization {
  <<FHIR>>
}
class EuOrganization {
  <<FHIR>>
}
EHDSCoverage --> EuCoverage
EuCoverage --> EuPatient : beneficiary
EuCoverage --> EuPatient : paymentBy.party
EuCoverage -->  EuRelatedPersion : paymentBy.party
EuCoverage -->  EuOrganization : paymentBy.party
EuCoverage --> EuOrganization : insurer
```

