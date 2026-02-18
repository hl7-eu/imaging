{% include variable-definitions.md %}
### Imaging report and relaed specifications

#### IHE Imaging Diagnostic Report ({{iheIDR}})

The {{iheIDR}} is a technical framework developed by the IHE Radiology Technical Committee. It aims to standardize the reporting of imaging studies and is based on the FHIR (HL7® FHIR® Standard) model, targeting the upcoming FHIR R6 release. The main target of this specification is to ease the inclusion of structured data and allow for reuse of structured data from previous reports.

THe intent of this specification is to align with {{iheIDR}} so a instance that conforms to this specification also conforms to the {{iheIDR}} specification. But as both specifications are still under development slight unconformities are inevitable. In order to mitigate these, the team working on the HL7eu Imaging Report is in regular contact with with IHE-RAD to resolve any incompatibilities.

#### Imaging Manifest ({{iheMADO}})
 
The European imaging specifications consist of the imaging manifest and the imaging report. The report represents the report as is written by the clinician. The manifest ({{iheMADO}}) provides a summary of the data available in the DICOM study. It is represented as a FHIR Bundle simultaneously to the imaging report. This allows it to be distributed in a same ({{iheMHD}}) infrastructure as is defined by {{euridiceAPI}}.

The sequence diagram presented below presents a typical use case in which both specifications are used.

<figure>
  {% include report-and-mado-usecase.svg %}
  <figcaption>Figure: Use case describing report and manifest use</figcaption>
</figure>
<br clear="all"/>

The Clinician searches for documents. Select the document to inspect and downloads it.

After inspection of the document, it searches for the manifest related to the report, downloads it and determines which image/serie to view.

Using the {{iheXcWado}} URL, the Clinician download the relevant DICOM images and renders them.
