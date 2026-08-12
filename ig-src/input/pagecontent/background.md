This page summarizes the policy and implementation context for this implementation guide.

### EHDS

The European Health Data Space (EHDS) defines a common policy and legal framework for the use and exchange of electronic health data across Europe. In this context, interoperability specifications are needed so health data can be shared consistently between systems, regions, and countries. Imaging is defined as one of the priority categories to be exchanged together with laboratory reports, medication, hospital discharge reports, and patient summaries. This implementation guide contributes to that objective by defining a computable FHIR specification for exchanging imaging study reports. Access to imaging data is defined in an independent specification called Manifest-based Access to DICOM Objects (MADO).

### Xt-EHR context

Xt-EHR was a European EU Commission funded joint action project that develops common specifications and implementation assets to operationalize EHDS priorities. The EHDS Imaging Report specification was included in the Xt-EHR work deliverables as a key component of the clinical content and interoperability layer. The guide is aligned with the [logical models](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/en/overview-medicalimages.html) defined in the Xt-EHR Clinical Content and Interoperability Specification (CCIS) and maps them to FHIR artifacts for implementation. For more details on the Xt-EHR work, see [the Xt-EHR Website](https://www.xt-ehr.eu/work-packages/). The Xt-EHR deliverables, including D5.1, D5.2, and D8.1, are available on the [Xt-EHR deliverables page](https://www.xt-ehr.eu/deliverables/).

### HL7 Europe and IHE collaboration

This specification is developed under HL7 Europe and IHE-Europe governance, with active collaboration between the two organizations. Regular communication and joint decision-making between HL7 Europe and IHE-Europe ensure that the guide meets both clinical and technical requirements for imaging report exchange in Europe.

In this sense, the guide acts as a bridge between policy-level requirements (EHDS), program-level harmonization (Xt-EHR), and implementation-level interoperability (HL7 FHIR and IHE-aligned workflows).