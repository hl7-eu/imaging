### Radiation Dose Summary

Background information:
* Background - Radiation Dose Summary for Diagnostic Procedures on FHIR v0.1.0

DICOM - templates (from https://build.fhir.org/ig/HL7/fhir-radiation-dose-summary-ig/background.html#minimal-radiation-information)
* TID 2008 Radiation Exposure and Protection Information
* Radiopharmaceutical Radiation Dose SR IOD Templates 
* X-Ray Radiation Dose SR IOD Templates 
* Radiopharmaceutical Radiation Dose SR IOD Templates 


The radiation dose IG uses two observations, one (Radiation Summary Report - Radiation Dose Summary for Diagnostic Procedures on FHIR v0.1.0) stating a summary of the radiation, the other Indication Observation - Radiation Dose Summary for Diagnostic Procedures on FHIR v0.1.0 holds information on the indication for the radiation. Based on the requirements from XtEHR, only the first is required.

As this Radiation Dose IG is still draft, based on an earlier FHIR specification, and is unlikely to be published in the near future, it cannot be referred to. This mitigated by copying the relevant parts of the IG to this implementation guide.

In this process, also some changes where made in line with FHIR R5, these include:
* The observation identifier referred to the SOPInstanceUID, this is replaced with a reference to ImagingSelection.
* Adding slices on Observation.component for the different numeric values.
