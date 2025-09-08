The DiagnosticReport has been designed in such a way that the relevant information can be easily found.

The table below shows the way the main content elements in a Radiology report are represented in this profile:

{:.grid}
| Report Section   | Report element         | DiagnosticReport                                         | Composition                          |
|------------------|------------------------|----------------------------------------------------------|--------------------------------------|
| header           | patient                | subject                                                  | subject                              |
|                  | source organization    | performer[organization]                                  |                                      |
|                  | author                 | resultsInterpreter[author]                               |                                      |
|                  | attester               | performer[attester], performer[legal-attester]           |                                      |
|                  | custodian              | performer[organization]                                  |                                      |
| imaging study    | study resources        | study                                                    | section[imaging-study].entry         |
|                  | notes                  | note.where(extension[annotationType].value → imagingstudy)| section[imaging-study].extension[note]|
| order            | order resources        | extension[basedOn]                                       | section[order].entry                 |
|                  | notes                  | note.where(extension[annotationType].value → order)      | section[order].extension[note]       |
| history          | resources              | extension[patientHistory]                                | section[history].entry               |
|                  | notes                  | note.where(extension[annotationType].value → history)    | section[patient-history].extension[note]|
| procedure        | resources              | extension[procedure]                                     | section[procedure].entry             |
|                  | notes                  | note.where(extension[annotationType].value → procedure)  | section[procedure].extension[note]   |
| comparison       | resources              | extension[comparison]                                    | section[comparison].entry            |
|                  | notes                  | note.where(extension[annotationType].value → comparison) | section[comparison].extension[note]  |
| findings         | resources              | result                                                   | section[findings].entry              |
|                  |                        | (key images are included as references from observations)  |                                      |
|                  | notes                  | note.where(extension[annotationType].value → findings)   | section[findings].extension[note]    |
| impressions      | resources              | extension[impression]                                    | section[impression].entry            |
|                  | notes                  | conclusion                                               | section[impression].extension[note]  |
| recommendation   | resources              | extension[recommendation]                                | section[recommendation].entry        |
|                  | notes                  | note.where(extension[annotationType].value → recommendation)| section[recommendation].extension[note]|
| communication    | resources              | extension[communication]                                 | section[communication].entry         |
|                  | notes                  | note.where(extension[annotationType].value → communication)| section[communication].extension[note]|

The notes section has an optional `annotation-type` extension. When present it indicates that the note applies to the section identified in the Coding included in the extension.

This profile has been aligned with the IHE-IDR profile which is still under development, parts where we deviate are:
* IDR places unstructured text in DiagnosticReport.text in this profile the `note` field is used. The section the `note` applies to is identified using the `annotation-type` extension.