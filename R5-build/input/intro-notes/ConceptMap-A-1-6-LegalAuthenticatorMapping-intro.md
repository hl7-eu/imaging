{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
    class LegalAuthenticator{
        <<eHN DataSet>>
        authenticatorIdentifier
        authenticatorName
        authenticatorOrganization
        authenticatorDateTime
    }
    class ImLegalAuthenticator{
        <<PractitionerRole>>
        identifier
        practitioner
        organization
    }
    class ImPractitioner{
        <<Practitioner>>
        identifier
        name
    }
    class ImOrganization{
        <<Organization>>
        name
    }
    class ImComposition{
        <<Composition>>
        attester[legalauthenticator].party
        attester[legalauthenticator].time
        attester[legalauthenticator].code = #legal
    }
    class ImDiagnosticReport{
        <<Diagnosticreport>>
        issued
    }
    LegalAuthenticator --|> ImLegalAuthenticator
    LegalAuthenticator --|> ImPractitioner
    LegalAuthenticator --|> ImOrganization
    LegalAuthenticator --|> ImComposition
    LegalAuthenticator --|> ImDiagnosticReport
    
    ImComposition --> ImLegalAuthenticator: attester.party    
    ImLegalAuthenticator --> ImPractitioner: practitioner
    ImLegalAuthenticator --> ImOrganization: organization  

```
