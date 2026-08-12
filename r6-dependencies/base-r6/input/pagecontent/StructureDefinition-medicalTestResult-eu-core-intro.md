### Relationship to Laboratory Test Results

Laboratory test results are a specialization of medical test results. This profile serves as the common base for all medical test observations. For laboratory-specific contexts, the [Observation Results: laboratory](https://hl7.eu/fhir/laboratory/StructureDefinition-Observation-resultslab-eu-lab.html) — which derives from this profile — SHOULD be used instead, as it adds constraints and elements specific to the laboratory domain (e.g., specimen, reference ranges, and laboratory-specific coding).

### Scope and Domains

This profile encompasses several key clinical areas where measurements and observations are captured:

- **Laboratory Test Results:** Clinical laboratory observations from pathology and hematology (e.g., blood counts, chemistry panels, microbiology cultures). For laboratory-specific use cases with detailed specimen and reference range information, the specialized Laboratory Observation profile SHALL be used.
- **MDR Device Measurements:** Data from medical devices such as blood gas analyzers, glucose meters, pulse oximeters, and ECG devices.
- **Minimally Invasive & Non-Invasive Tests:** Includes venous blood draws, finger-prick tests, swab sampling, and non-invasive measurements from saliva, sweat, or tears.
- **Vital Signs & Morphometry:** Standard metrics such as heart rate, blood pressure, BMI, and respiratory rate.
- **Clinical Scores:** Formal assessments like APGAR and the Glasgow Coma Scale (GCS).

### Data Types and Values (`Observation.value[x]`)

Depending on the specific test, this profile allows various FHIR data types to ensure clinical accuracy:

- **Quantity:** For vitals and physical measurements (e.g., body temperature, SpO₂).
- **CodeableConcept:** For qualitative coded results (e.g., blood type, microbiological culture findings, rapid test result as positive/negative SNOMED concept).
- **SampledData:** For continuous waveforms like ECG or EEG traces.
- **Attachment:** For device-generated reports or PDF strips (e.g., spirometry reports).
- **boolean:** Used for simple alerts (arrhythmia detected).
