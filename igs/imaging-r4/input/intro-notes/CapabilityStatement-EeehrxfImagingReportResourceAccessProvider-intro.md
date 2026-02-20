This CapabilityStatement defines the capabilities for systems providing direct resource
access (beyond document-based exchange) in the EU EHR Exchange Format (EEHRxF) ecosystem.
It inherits patterns from:
- **IPA (International Patient Access)**: Resource profiles and search parameter patterns
- **IHE QEDm (Query for Existing Data for Mobile)**: Clinical Data Source actor capabilities

### Resource Flexibility (IPA Alignment)

Following IPA's approach, servers are not required to support all clinical resources listed
below. Servers MAY choose which resources to implement based on their capabilities and use
cases. The only required resource is Patient (for lookup context). This flexibility
encourages partial implementations, allowing more servers to participate even if they only
support EU Core for certain resource types.

**Required**: Patient (for lookup context)
**Recommended (choose based on capabilities)**:
- Practitioner, Organization: Reference resolution
- Condition, AllergyIntolerance: Patient safety data
- Observation, DiagnosticReport: Clinical results
- MedicationRequest, MedicationDispense: Medication data
- Encounter: Visit context

The server's CapabilityStatement declares which resources are actually supported.

### Security

Systems SHALL support SMART Backend Services authorization for all transactions.

### Profile Inheritance

Resources SHOULD conform to EU Core profiles where available.