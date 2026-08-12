### Narrative (unstructured) report content encoding

The main objectives on the design of the narrative report content encoding model are:

1. Complete and safe representation of the narrative report content to display by consumer users.
2. Flexibility to allow representation of section templates if available from the source.
3. Encoding of the the content in fixed path for processing by consumer applications. 
4. Traceability of the displayed report content to the source data.

Objectives 1 and 2 are achieved by the `CompositionEuImaging` profile, which allows for the representation of the report content in sections with some degree of flexibility for different section templates, and a fallback section for the cases in which no sections can be derived.

Objectives 3 and 4 are achieved by the `DiagnosticReportEuImaging` profile, which allows for the representation of the report content in a fixed `.result` path, that references the `ObservationNarrativeReport` profile, which allows for the representation of the narrative content.

Note: Encoding the narrative as an `Observation.valueString` referencing it from `DiagnosticReport.result` follows an existing, well-established pattern in US Core:  [chest x-ray findings Observation](https://hl7.org/fhir/us/core/Observation-xray-chest-findings.json.html).