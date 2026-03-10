{% raw %}{% include fsh-link-references.md %}{% endraw %}
{% raw %}{% include variable-definitions.md %}{% endraw %}

  <!-- Horizontal banner -->
<div style="border: 2px solid #003366; border-radius: 8px; padding: 1em; margin: 1.5em 0; background-color: #f9f9ff; display: flex; flex-direction: column; align-items: flex-start;">
  
  <!-- Logo -->
  <div style="margin-bottom: 1em;">
    <img src="xtehr-logo.png" alt="XTEHR Logo" style="max-width: 100%; height: 40px;" />
  </div>

  <!-- Acknowledgment text -->
  <div style="text-align: left; width: 100%;">
    <strong>Acknowledgment</strong><br/>
    The development of this Implementation Guide version has been supported by the 
    <strong>Xt-EHR Joint Action</strong>.  
    Xt-EHR provided expertise, alignment with European health policy priorities, 
    and validation of specifications to enable consistency with EHDS requirements.
  </div>
</div>
{% if isR5 %}
<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>This is the 0.2.1 STU1 ballot version of the specification to be used by WP 7.2 of Xt-EHR for public consultation.
   </p>
   <p> The content of this implementation guide is discussed HL7 EU calls (<a href="https://confluence.hl7.org/spaces/HEU/pages/321160129/Imaging+meetings">HL7-eu imaging on Confluence</a>).
   </p>
   <p> This IG is available in FHIR version 4.0.1 and 5.0.0, and built from a single source repository on GitHub (<a href="https://github.com/hl7-eu/imaging">https://github.com/hl7-eu/imaging</a>)
   </p>
 </blockquote>
</div>

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note"> 
   <p> This ballot requests feedback from the community on the following topic <a href="https://jira.hl7.org/browse/FHIR-56038">FHIR-56038</a>. Which proposes a solution to an error in this R5 version due to and inconsistency between this model and an invariant in DiagnosticReport in FHIR R5.
   </p>
 </blockquote>
</div>
{% endif %}
{% if isR4 %}
<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>This is the 0.2.1 STU1 ballot version of the specification to be used by WP 7.2 of Xt-EHR for public consultation.
   </p>
   <p> The content of this implementation guide is discussed HL7 EU calls (<a href="https://confluence.hl7.org/spaces/HEU/pages/321160129/Imaging+meetings">HL7-eu imaging on Confluence</a>).
   </p>
   <p> This IG is available in FHIR version 4.0.1 and 5.0.0, and built from a single source repository on GitHub (<a href="https://github.com/hl7-eu/imaging">https://github.com/hl7-eu/imaging</a>)
   </p>
 </blockquote>
</div>
{% endif %}

### Scope

This implementation guide specifies imaging study report data in the **European** context, as defined in {{ehnImaging}} and refined by {{XtEhrImaging}}, as a FHIR model. It defines:
* The structure and contents of a FHIR imaging study reports.
* Mapping between this IG and the Xt-EHR logical models for imaging reports, as functional requirements.
* Example implementations of the defined models for Imaging Study Reports.
* relation of this specification with the existing ecosystem, including IHE MADO, IHE RAD, and EHDS API specifications.

The specification is to be used in a variety of deployment models, which includes the EHDS use cases: exchange data within healthcare organizations, across nations/regions and cross border information exchange. In all of these use cases it is important that it is compatible with the existing ecosystem.

Current approaches within Europe use different approaches to information exchange:
* **Document based exchange**, the document is represented as a FHIR Document Bundle.
* **REST API based access to documents**, a {{Composition}} and {{DiagnosticReport}} for each document including instances of the referred resources
* **REST API based access to resources**, as the previous but the (important) resources are *harmonized*, meaning that all documents point to the same {{Patient}}, {{Organization}} and other resources.

The specification is being designed in such a way that it can be used in all of these deployment scenarios.

### Purpose

The goal of this Implementation Guide is to define an European standard for the Imaging Report to facilitate the harmonization among the national initiatives and prepare the ground for the European EHR eXchange Format (E-EHRxF).

The development of this implementation guide is promoted by HL7 Europe, but realized in collaboration with several other European and national organizations and projects. The aspiration of this guide is to be used as basis for European National Guides, the European EHRxF ,and - consequently - by MyHealth@EU for the EU cross-border services.

### FHIR specific Dependencies

{% raw %}{% include dependency-table-en.xhtml %}{% endraw %}

### Cross Version Analysis

{% raw %}{% include cross-version-analysis-en.xhtml %}{% endraw %}

### Global Profiles

{% raw %}{% include globals-table-en.xhtml %}{% endraw %}

### IP statements

{% raw %}{% include ip-statements-en.xhtml %}{% endraw %}