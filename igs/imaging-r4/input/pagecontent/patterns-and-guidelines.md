
#### Representing unstructured text (dictated notes)

These are stored in DiagnosticReport.note and in Composition.section.extension[note]. Based on this content the section.text and DiagnosticReport.text and Composition.text are populated.

#### Inclusion of tables

The annotations are entered as markdown which allows inclusion of tables

#### Support of IHE-RAD-IMR

TBD

#### Supporting links findings and prior studies from the narrative

These links can be included in the text (Narrative) using text-link extensions. Referring them from the unstructured text is TBD.

#### What terminology use in the report

The specification focusses first on the infrastructural aspects and marks the terminology related this as extensible. We are conservative in placing terminology requirements on findings and interpretations are there currently is not a widespread consensus on what terminology is used.

#### Support for addendum documents

These are separate documents; separate imaging reports. TBD: in what way link these in this report.

#### Relation with DICOM-SR reports

DICOM-SR reports can be accessed and referred using ImagingSelections as they are stored as instances in the PACS. In the case that the report is a DICOM-SR report,

#### Can there be multiple reports on a single study and can a report report on multiple studies?

Yes, there can be multiple reports referring the same study. A study can refer tmore than one study. See semi-structured example.

#### Include links from the narrative included annotations (GSPS) and key images (instances/KIN/KO/IMA)

This can be done using text-link extensions.

TBD – can we this from the Narrative as well.

#### Inclusion of images/drawings that are not stored in DICOM objects

These can be included as Media in R4 and DocumentReference in R5 and are referred from the Composition.section[finding] and DiagnosticReport.media

#### Support for digital pathology

Currently not in scope

#### Link with IHE-RAD-IDR

The team is in regular contact with IHE-RAD and strives for the situation where an IDR report can be an imaging report and vice versa.

#### Link with IHE-RAD-IMR

TBD

#### Link with IHE-AIResults

AI results are stored as DICOM-SR documents which can be accessed as DICOM instances using the manifest. Optionally, the source system has the option to reflect the content of these DICOM-SR documents in FHIR using the DICOM-SR-2-FHIR IG. When elements from the AIR reports are included in the imaging report, it is RECOMMENDED to use the format specified in DICOM-SR-2-FHIR.