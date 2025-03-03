{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
    class HealthInsuranceAndPayment{
        <<eHN DataSet>>
        providerCode
        providerName
        provideNumber
    }
    class ImCoverage{
        <<Coverage>>
        identifier
        insurer
    }
    class ImHealthInsurerProvider{
        <<Organization>>
        name
        insurer
    }
    class ImOrder{
        <<ServiceRequest>>
        insurance
    }
    class ImComposition{
        <<Composition>>
        section[order].entry[order]
        section[order].entry[insurance]
        section[order].entry[insuranceprovider]
    }
    HealthInsuranceAndPayment --|> ImCoverage
    HealthInsuranceAndPayment --|> ImHealthInsurerProvider
    HealthInsuranceAndPayment --|> ImOrder
    HealthInsuranceAndPayment --|> ImComposition
    
    ImCoverage --> ImHealthInsurerProvider: insurer
    ImOrder --> ImCoverage: insurance
    ImComposition --> ImOrder: section[order].entry[order]
    ImComposition --> ImCoverage: section[order].entry[insurance]
    ImComposition --> ImHealthInsurerProvider: section[order].entry[insuranceprovider]

```

