{% include fsh-link-references.md %}
{% include variable-definitions.md %}

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>This is an early draft of the specification that is still under rapid development. It is intended as a starting point of discussions and does not represent any final decisions.
   </p>
   <p>The source of this IG is stored on github (<a href="https://github.com/hl7-eu/imaging">https://github.com/hl7-eu/imaging</a>).
   </p>
   <p> The content of this implementation guide is discussed HL7 EU calls (<a href="https://confluence.hl7.org/spaces/HEU/pages/321160129/Imaging+meetings">HL7-eu imaging on Confluence</a>).
   </p>
   <p> This initial version is based on FHIR R5. Once the model stabilizes, the FHIR R4 version will be derived from it.  
   </p>
 </blockquote>
</div>

### Scope

This implementation guide specifies how to represent imaging reports and studies in the **European** context as required by {{ehnImaging}} and as defined within and as defined within the Xt-EHR work package *D7.2 Medical images and reports: EEHRxF, requirements and specifications for EHR systems* (see {{XtEhrWorkPackages}}).

The IG is developed in close cooperation with {{IHEeu}}, {{IHE-RAD}}, and {{HL7-FHIR-II}} as they are working on overlapping specifications (IHE-IDR and IDS). The development has been done in close collaboration with the dedicated FHIR Imaging Report team that sits under the Xt-EHR project in Task 7.2 Medical Imaging Studies and Related Reports.

This way the EU FHIR Imaging report aims to comply to EHDS requirements for the prioritized category of medical imaging studies and related reports.

It defines:
* The structure and contents of a FHIR imaging studies and reports.
* Different options for publishing and searching for such studies and reports.
* Discovery of available mechanisms to access the imaging data.

The specification is to be used in a variety of deployment models, which includes the EHDS use cases: exchange data within nations/regions and cross border information exchange, both on the national level as on cross border exchange. It is also important that it can fit into an existing ecosystem.

Current approaches within Europe use two different approaches to information exchange:
* **Document based exchange**, the document is represented as a FHIR Document Bundle.
* **REST API based access to document**s, a {{Composition}} and {{DiagnosticReport}} for each document including instances of the referred resources
* **REST API based access to resources**, documents are provided ({{Composition}} + {{DiagnosticReport}}), the resources in the documents are aligned, i.e. they all point to the same {{Patient}} resource

The specification will be designed in such a way that it can be used in all these deployment scenarios.

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>Timeline:</p>
   <ul>
   <li>Feb 2025, kick-off during HL7-EU WGM.</li>
   <li>May 2025, first planned ballot to be tested during May 2025 HL7 WGM in Madrid.</li>
   <li>June 2025, testing in IHE-EU plug-a-thon in Vienna</li>
   <li>August 2025, first version</li>
   </ul>
 </blockquote>
</div>

### Purpose

The goal of this Implementation Guide is to define an European standard for the Imaging Study Report to facilitate the harmonization among the national initiatives and prepare the ground for the European EHR eXchange Format (E-EHRxF).

The development of this implementation guide is promoted by HL7 Europe, but realized in collaboration with several other European and national organizations and projects. The aspiration of this guide is that of being used as basis for European National Guides, the European EHRxF and - consequently - by MyHealth@EU for the EU cross-border services.

### References

This specification defines the representation of the data sets required by {{ehnImagingFull}}".

Besides the requirements defined in the {{ehnImagingGuidelines}}, it also uses input  from other related activities:

* Related activities in other Standard Development Organizations (SDO):

  * {{IHE-RAD}}
  * {{HL7-FHIR-II}}

* Related specifications:
  * IHE-IDR, draft version as discussed on Jan 19 2025
    * {{iheRad}} is working on a machine readable specification for diagnostic reports of (common) radiology procedures. The draft results of this activity have been taken along in the definition of this IG.
  * {{hl7EuLabs}}
    * This specification has adopted many of the design patterns defined in this IG.
  * {{hl7EuHdr}}
    * This specification has adopted many of the design patterns defined in this IG.
  * {{ArgImg}}
  
### Dependencies

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### IP statements

{% include ip-statements.xhtml %}

### Authors and Contributors

Please refer to the [Authors and Contributors](contributors.html) page.
