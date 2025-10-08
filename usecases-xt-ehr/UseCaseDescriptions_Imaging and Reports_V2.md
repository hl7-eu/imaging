

From the story boards as described in the eHDSI Requirements Catalogue (RC) v9.0.0, 4 stories have been chosen. The rationale for these stories is ;
………

These are the stories to support the Xt-EHR Implementation Guides for EHR-systems:

* (RC Story 3) – Stroke, cross-border – Duncan Falconer
* (RC Story 10) – Prostate, cross-border and national – Nuno silva
* (RC Story 2/X-eH D5.4 – Table 5) – Multiple Sclerosis, cross-border and national – Esther Peelen
* (RC Story 7) – Surgery -  ……?
* Sharing on national level
* Sharing only Imaging Report
* Sharing Imaging Study and Related Report with Citizen

These stories/use cases have been chosen with the following rationale;

| **Title** | **Stroke** (Imaging Study and Related Report), UC1 |
| --- | --- |
|  |  |
| **Purpose** |  |
| **Relevance** |  |
| **Domain** | Medical Imaging Studies and Reports |
| **Situation** |  |
| **System function Profile (linked with WP8)** |  |
| **Context** |  |
| **Information** |  |
| **Participants** | **Actors**:  Report creator  Report Repository  Report Reader  Report Consumer  Image Manager/Image Archive  Human participants: |
| **Pre-conditions** |  |
| **Functional process flow** |  |
| **Cross-border considerations** |  |
| **Variations** |  |
| **Example - story** | An Irish female patient visits a hospital for scheduled care in Spain.  The patient is on a long waiting list for surgery in Ireland. It is estimated that she will be waiting for over two years before being offered an appointment to receive the treatment she needs within the Irish health service.  During a regular consultant check-up, the patient is informed that the surgery she requires is available in Spain, where scheduled care waiting lists are minimal.  The patient applies to the health service in Ireland to receive prior permission to avail of the treatment service in Spain as part of her entitlement to seek cross-border healthcare, where similar treatments are available in other member states.  Authorisation is granted and the patient books a surgery appointment in Spain.  The patient informs the clinician in Spain that she has consented to participate in the MyHealth@EU eHealth Cross Border Service and that prior to leaving Ireland, she had a related medical episode which necessitated her being taken by ambulance to the emergency department which resulted in an overnight stay in hospital.  An MRI scan was taken as part of her care during the hospital stay.  The Spanish consultant surgeon also participates in the MyHealth@EU eHealth Cross Border Service.  Upon verification of the patient’s identity, the clinician is able to access the patient’s Medical Imaging Study & Report along with other reports if available, (i.e. Hospital Discharge Report, Laboratory Results, ePrescription and Shared Care record), in Ireland, which are made available through the cross border interoperable service and where relevant medical information particular to the particular treatment to be administered, is reported.  As a result, the consultant in Spain is able to formulate a timely opinion much earlier in the process to provide the level of treatment that this female requires.  Had access to the Medical Imaging Study & Report information not been readily available, the Spanish consultant would have had to order additional unnecessary diagnostic procedures and medical checks in Spain. Having access to the recent Medical Imaging Study & Report, assists the consultant surgeon to form timely opinion to determine suitable treatment regimes of medical intervention action required to treat the patient. |

| **Title** | **Prostate** (Imaging Study and Related Report), UC2 |
| --- | --- |
| **Purpose** |  |
| **Relevance** |  |
| **Domain** | Medical Imaging Studies and Reports (Radiology, cardiology, medical photography, pathology, and many other clinical departments) |
| **Situation** |  |
| **System function Profile (linked with WP8)** |  |
| **Context** |  |
| **Information** |  |
| **Participants** | **Actors**:Report creator  Report Repository  Report Reader  Report Consumer  HIS/RIS/PACS  Human participants: Healthcare Professional |
| **Pre-conditions** |  |
| **Functional process flow** |  |
| **Cross-border considerations** |  |
| **Variations** |  |

| **Title** | Sharing Imaging Study and Related Report (**Multiple Sclerosis**), UC3 |
| --- | --- |
| **Purpose** | To support the processes of querying and retrieving of imaging studies and their related reports at the moment they are  needed. Thus reusing available imaging studies and reports. |
| **Relevance** | This use case supports the secured retrieval of imaging studies and imaging  reports across healthcare facilities. It  provides ambulatory healthcare professionals with secure yet easy online access to patients’ imaging results, as well as to any prior diagnostic examinations from  imaging departments which can be used either for comparison or to avoid  duplicating imaging procedures. This prevents not only economical loss, but also unnecessary harm to the patient because of diagnostic irradiation. |
| **Domain** | Medical Imaging Studies and Reports(Radiology, cardiology, medical photography, pathology, and many other clinical departments) |
| **Situation** | Sharing imaging studies and related reports between EHR systems, nationally or cross-border |
| **System function Profile (linked with WP8)** |  |
| **Context** | Cross-border |
| **Information** | Information on the study, manifest data and report information |
| **Participants** | **Actors**:  Report creator  Report Repository  Report Reader  Report Consumer  Image Manager / Image Archive  Image Document Receiver  Image Document Consumer  Image Document Responder  Image Document Source  Image Storage/Display  HIS/RIS/PACS  Human participants: Healthcare Professional |
| **Pre-conditions** | An Order to perform an imaging study is sent and and imaging studies and related reports are created. Requesting and receiving Healthcare Professional need to be connected via their Healthcare Organisation to MyHealth@EU/NCPeH. |
| **Functional process flow** | Requesting specialist sends the request(s) to list all imaging studies and imaging reports available for  given patient.  As a reply, the list is given, containing information on:  What is in the study (body region if available and protocol name)  Where is the study (country, city, hospital)  Ideally also fast preview of the series available  From the list, specialist can select which studies/series are relevant to the  patient care and ask for their retrieval  This assumes not only the correct classification of imaging modality (MR, CT etc)  but also what body part(s) is/are covered by the examination  The sender(s) send the imaging studies and imaging reports (if available) to the  requesting specialist  Specialist is informed that a study has arrived and is available for viewing using  local PACS system and software he is familiar with (no central browser etc) and is able to use diagnostic software/screens for evaluation of the studies. The reports  can be imported in local HIS/RIS. |
| **Cross-border considerations** | The cross-border exchange of data runs via the NCPeH/MyHealth@EU infrastructure |
| **Variations** | National context:The use case applies but without the NCPeH/MyHealth@EU infrastructure |
| **Example – Multiple Sclerosis Attack** | A patient comes to a hospital in country B (where he works) with acute new symptoms – double vision. He has a known diagnosis of multiple sclerosis with mild weakness of the upper limb. On admission, a neurologist asks for a MRI scan. As the treatment should be fast and depends on the diagnostic criteria involving dissemination in space and time, comparison with previous studies is crucial. The previous radiology report may help confirm which lesions on the previous study were stable. The patient remembers he had previous examinations in his home country, country A. The radiologist queries for both imaging reports and imaging studies of the modality MRI and body part brain and spine. A long list of the examinations is retrieved since the patient had many follow-up studies during his lifespan. The radiologist selects the latest one for retrieval. After comparison of the studies, he decides that he also needs the one-before to make a better clinical decision and retrieves that study as well. The patient gave prior consent with use like this in his home country A before. |

| **Title** | Sharing Imaging Study and Related Report **– national setting** |
| --- | --- |
| **Purpose** |  |
| **Relevance** |  |
| **Domain** | Medical Imaging Studies and Reports |
| **Situation** |  |
| **System function Profile (linked with WP8)** |  |
| **Context** | National |
| **Information** |  |
| **Participants** | **Actors**:  Report creator  Report Repository  Report Reader  Report Consumer  Human participants: |
| **Pre-conditions** |  |
| **Functional process flow** |  |
| **Cross-border considerations** |  |
| **Variations** |  |

| **Title** | **Sharing only Imaging Report** |
| --- | --- |
| **Purpose** | Sending of imaging reports and insight in the workflow, across healthcare  institutions cross-border. In this use case we describe the requesting of the  report by a HCP in country B to a HCP in country A. The HCP in country B sends  the report to the HCP in country A. |
| **Relevance** |  |
| **Domain** | Medical Imaging Studies and Reports |
| **Situation** |  |
| **System function Profile (linked with WP8)** |  |
| **Context** | Cross-border |
| **Information** |  |
| **Participants** | **Actors**:  Report creator  Report Repository  Report Reader  Report Consumer  Human participants: |
| **Pre-conditions** | An Order to perform an imaging study is sent and imaging studies and related reports are created.Requesting and receiving Healthcare Professional need to be connected via their Healthcare Organisation to MyHealth@EU/NCPeH. |
| **Functional process flow** |  |
| **Cross-border considerations** |  |
| **Variations** |  |
| **Example – story** | The Patient is on holiday abroad (country B), where she/he feels sick with the need to visit a HCP in country B.  The HCP in country B needs to check if there are medical Image Reports available for the Patient that can help the HCP to understand what's wrong with the Patient. The HCP requests the list of the available Image Reports regarding that Patient to the country of affiliation (country A). Country of affiliation (Country A) returns a list showing all available imaging reports for that Patient. With the support of the patient, the HCP retrieves the selected Image Report(s) |

| **Title** | **Sharing Imaging Study and Related Report with citizen** |
| --- | --- |
| **Purpose** | Sending of imaging reports and insight in the workflow, across healthcare  institutions cross-border. In this use case we describe the requesting of the  report by a HCP in country B to a HCP in country A. The HCP in country B sends  the report to the HCP in country A. |
| **Relevance** |  |
| **Domain** | Medical Imaging Studies and Reports |
| **Situation** |  |
| **System function Profile (linked with WP8)** |  |
| **Context** | Cross-border |
| **Information** |  |
| **Participants** | **Actors**:  Report creator  Report Repository  Report Reader  Report Consumer  Human participants: |
| **Pre-conditions** | An Order to perform an imaging study is sent and imaging studies and related reports are created.Requesting and receiving Healthcare Professional need to be connected via their Healthcare Organisation to MyHealth@EU/NCPeH. |
| **Functional process flow** |  |
| **Cross-border considerations** |  |
| **Variations** |  |
| **Example – story** | The Patient is on holiday abroad (country B), where she/he feels sick with the need to visit a HCP in country B.  The HCP in country B needs to check if there are medical Image Reports available for the Patient that can help the HCP to understand what's wrong with the Patient. The HCP requests the list of the available Image Reports regarding that Patient to the country of affiliation (country A). Country of affiliation (Country A) returns a list showing all available imaging reports for that Patient. With the support of the patient, the HCP retrieves the selected Image Report(s) |

**References**

To align EU EEHRxF- Imaging report with the work of IHE Radiology on Imaging Diagnostic Report see:

[1:56 IDR Home - Imaging Diagnostic Report v0.0.1-current](https://build.fhir.org/ig/IHE/RAD.IDR/branches/TIDocMigration/index.html)

For definitions of the actors, see above url. In IDR the following actors are defined:

Report creator

Report Repository

Report Reader

Report Consumer

For alignment on terms and definitions with IHE-profiles on sharing imaging studies, see: [Scheduled Workflow.b - IHE Wiki](https://wiki.ihe.net/index.php/Scheduled_Workflow.b)

For IHE International definition of Actors: [Actor Browsing](https://gazelle.ihe.net/GMM/tf/actor/listActors.seam)

**Actors relevant for imaging studies sharing:**

Image Manager / Image Archive: A system that stores and manages imaging data.
Image Deformer, NA?

Imaging Document Consumer: A system that makes use of imaging data.

Imaging Document Receiver: Receives DICOM SOP Instances and image reports.

Imaging Document Responder: The Imaging Document Responder receives query requests from an Imaging Document Consumer and returns imaging study metadata.

Imaging Document Source: Publishes imaging data and makes it available for retrieval

Image Manager: Stores DICOM objects without guarantee of long-term storage.

Imaging Order Filler, NA?

Image Storage/Display: A system responsible for receiving DICOM SOP Instances, storing those SOP Instances, and the ability to present them for viewing to the user.

Importer: A system that imports evidence documents such as images, presentation states, Key Image Notes or Evidence Documents from hardcopy or digital media.

X-eHealth D5.4 Medical Imaging and Imaging Reports guideline and functional specifications:

[D5.4-Medical-Imaging-and-Imaging-Reports-guideline-and-functional-specifications.pdf](https://www.x-ehealth.eu/wp-content/uploads/2022/09/D5.4-Medical-Imaging-and-Imaging-Reports-guideline-and-functional-specifications.pdf)

* For examples of use case descriptions
