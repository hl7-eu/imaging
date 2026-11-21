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

<div class="model-map-block">
 <div class="callout-wrapper">
 <div class="callout-box">
 <strong>This is a ballot preview version:</strong>
 this Implementation Guide is published for <b>review and discussion purposes only.</b>
			 <p>The content is subject to change and is provided <b>as-is</b>, without warranty of any kind and <b>without liability for its use</b>.</p>
 </div>
 </div>
</div>

<div xmlns="http://www.w3.org/1999/xhtml"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note"> 
 <p>This is the 1.0.0-ballot version of the specification to be used by WP 7.2 of Xt-EHR for public consultation.
 </p>
 <p> The content of this implementation guide is discussed HL7 EU calls (<a href="https://confluence.hl7.org/spaces/HEU/pages/321160129/Imaging+meetings">HL7-eu imaging on Confluence</a>).
 </p>
 <p> This IG is available in FHIR version 4.0.1 and 5.0.0, and built from a single source repository on GitHub (<a href="https://github.com/hl7-eu/imaging">https://github.com/hl7-eu/imaging</a>)
 </p>
 <p> This STU-ballot specification will be reviewed and updated, where needed, when the European Commission publishes and finalizes the revised EHDS implementing-act requirements, including relevant Art. 15 details.
 </p>
 </blockquote>
</div>

### Purpose

The goal of this Implementation Guide is to define an European standard for the Imaging Report to facilitate the harmonization among the national initiatives and prepare the ground for the European EHR eXchange Format (E-EHRxF).

The development of this implementation guide is promoted by HL7 Europe, but realized in collaboration with several other European and national organizations and projects. The aspiration of this guide is to be used as basis for European National Guides, the European EHRxF ,and - consequently - by MyHealth@EU for the EU cross-border services.

### Scope

This implementation guide specifies imaging study report data in the **European** context, as defined in {% raw %}{{ehnImaging}}{% endraw %} and refined by {% raw %}{{XtEhrImaging}}{% endraw %}, as a FHIR model. It defines:
* The structure and contents of a FHIR imaging study report.
* Mapping between this IG and the Xt-EHR logical models for imaging reports, as functional requirements.
* Example implementations of the defined models for Imaging Study Reports.
* Relation of this specification with the existing ecosystem, including IHE MADO, IHE RAD, and EHDS API specifications.

 This IG currently addresses imaging-based reports; inclusion of an object in the functional scope does not establish conformance guidance for waveform-based reporting. More implementation experience is needed before this IG can address ECG and other waveform-based reports in its profiles and examples.

### Relationship and scope boundaries

This guide is part of the broader European EHDS-aligned interoperability landscape. It complements other EHDS ecosystem guides and established IHE workflows, including {% raw %}{{iheMADO}}{% endraw %} where the imaging manifest-based access to the medical images is defined. The imaging report and manifest have distinct but linked roles: the report carries the clinician's interpretation and supporting clinical content, while the manifest describes the imaging study and provides context for retrieving its DICOM data. In practice, systems should support finding a manifest from a report and finding related reports from a manifest. Those use cases are described in the [Use cases](use-cases.html) page.

The exchange layer of this imaging report through the {% raw %}{{EuridiceHealthDataAPI}}{% endraw %}, - including report-specific `DocumentReference` profiles, `SearchParameters` and `CapabilityStatements` is published through  {% raw %}{{imagingApiIgName}}{% endraw %} IG. 

See [Related specifications](related-specifications.html) for details on how these, and other imaging specifications fit together.

{% raw %}{% include how-to-read.md %}{% endraw %}