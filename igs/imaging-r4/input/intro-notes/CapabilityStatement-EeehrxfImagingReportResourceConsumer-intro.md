This CapabilityStatement defines the requirements for systems consuming direct resource
access (beyond document-based exchange) in the EU EHR Exchange Format (EEHRxF) ecosystem.
It inherits patterns from:
- **IPA (International Patient Access)**: Resource profiles and search parameter patterns
- **IHE QEDm (Query for Existing Data for Mobile)**: Clinical Data Consumer actor capabilities

### Resource Flexibility (IPA Alignment)

Following IPA's approach, clients are not required to consume all clinical resources listed
below. Clients MAY choose which resources to query based on their needs and the server's
declared capabilities. The only required capability is Patient lookup. This flexibility
allows clients to implement targeted use cases without requiring support for all resource types.

**Required**: Patient (for lookup context)
**Optional (request based on needs and server support)**:
- Practitioner, Organization: Reference resolution
- Condition, AllergyIntolerance: Patient safety data
- Observation, DiagnosticReport: Clinical results
- MedicationRequest, MedicationDispense: Medication data
- Encounter: Visit context

Clients should check the server's CapabilityStatement to discover which resources are available.

### Security

Systems SHALL support SMART Backend Services authorization for all transactions.

### Profile Inheritance

Consumers SHOULD expect resources conforming to EU Core profiles where available.