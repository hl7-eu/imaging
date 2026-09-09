{% include variable-definitions.md %}
### Imaging report and related specifications

#### IHE Imaging Diagnostic Report ({{iheIDR}})

The {{iheIDR}} is a technical framework developed by the IHE Radiology Technical Committee. It aims to standardize the reporting of imaging studies and is based on the FHIR (HL7® FHIR® Standard) model, targeting the upcoming FHIR R6 release. The main target of this specification is to ease the inclusion of structured data and allow for reuse of structured data from previous reports.

The intent of this specification is to align with {{iheIDR}} so that an instance that conforms to this specification also conforms to the {{iheIDR}} specification. But as both specifications are still under development, slight non-conformities are inevitable. In order to mitigate these, the team working on the HL7eu Imaging Report is in regular contact with IHE-RAD to resolve any incompatibilities.

#### Imaging Manifest ({{iheMADO}})
 
The European imaging specifications consist of the imaging manifest and the imaging report. The report represents the report as is written by the clinician. The manifest ({{iheMADO}}) provides a summary of the data available in the DICOM study. It is represented as a FHIR Bundle simultaneously to the imaging report. This allows it to be distributed in the same ({{iheMHD}}) infrastructure as is defined by {{euridiceAPI}}.

The sequence diagram presented below presents a typical use case in which both specifications are used. It corresponds to the report-driven retrieval use case published in {{iheMADO}} Volume 1.

<figure>
  {% include mado-volume1-eu2-report-driven-retrieval.svg %}
  <figcaption>Figure 1: Use case describing report and manifest use</figcaption>
</figure>
<br clear="all"/>

The Clinician searches for imaging reports, selects the report to inspect and retrieves it.

After reviewing the report and determining that image access is needed, the Clinician searches for the study manifest related to the report, retrieves it and determines which images/series to view.

Using the {{iheXcWado}} URL provided by the manifest, the Clinician downloads the relevant DICOM images and renders them.

#### Bidirectional lookup between report and manifest

The same linkage model supports both directions:
* **Report to manifest**: start from an imaging report and query for the associated manifest.
* **Manifest to report**: start from a manifest and query for the associated report(s).

The primary anchors for this linkage are:
* **StudyInstanceUID** (study-level relation);
* **accession-number** (order/request-level relation).
