{% include variable-definitions.md %}
This CapabilityStatement defines the capabilities for systems providing direct resource
access (beyond document-based exchange) in the EU EHR Exchange Format (EEHRxF) ecosystem.
It inherits patterns from:
- **{{ hl7IPA }} (International Patient Access)**: Resource profiles and search parameter patterns
- **{{ iheQEDm }} (Query for Existing Data for Mobile)**: Clinical Data Source actor capabilities

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

### Providing resource access to FHIR documents

When a imaging report is received as a FHIR document Bundle and the server makes the resources available the following guidelines SHOULD be taken into account:

* Follow the guidance provided in {{ IHEmXDE }}, specifically related to the generation of Provenance resources; when the resources are added, a Provenance resource SHOULD be present providing information on the source of the information.
* When resources are extracted from the FHIR document Bundle and made available as individual resources, follow the {{ IHEmXDE }} guidance for generating Provenance resources. A Provenance resource SHOULD identify the extracted resources and their source document.
* Retain the original DocumentReference and Bundle resource in the server.
