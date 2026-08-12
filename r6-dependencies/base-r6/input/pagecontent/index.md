<!-- Horizontal banner -->

<div style="
  /* reserve space for the ToC on the right */
  margin: 0 340px 1.25rem 0;   /* top right bottom left; adjust 340px to your ToC width */
  border: 2px solid #003366;
  border-radius: 8px;
  padding: 1em;
  background-color: #f9f9ff;
  box-sizing: border-box;

  /*optional: pull the banner up a bit to align with the ToC’s top */
  /* margin-top: -0.75rem;  uncomment/tweak if you want tighter vertical alignment*/
">
  <div style="margin-bottom: 1em;">
    <img src="xtehr-logo.png" alt="XTEHR Logo" style="max-width: 100%; height: 40px;" />
  </div>
  <div style="text-align: left;">
    <strong>Acknowledgment</strong><br/>
    The development of this Implementation Guide version has been supported by the
    <strong>Xt-EHR Joint Action</strong>.  
    Xt-EHR provided expertise, alignment with European health policy priorities,
    and validation of specifications to enable consistency with EHDS requirements.
  </div>
</div>



### Scope

This Implementation Guide (IG) brings together **base** and **core** HL7® FHIR® artifacts designed specifically for the European context.

It provides a foundation for interoperability and reusability across national projects, European initiatives, and derived HL7 Europe guides.

The guide supports:

* Developers and implementers who need common building blocks.

* Policymakers and program leads who require consistent definitions for EHDS-aligned projects.

* Standards experts who wish to build on a harmonized European foundation.

### Introduction

The HL7 Europe Base and Core Implementation Guide provides a **layered approach to FHIR interoperability** in the European context; and it aims to support a coherent and reusable set of FHIR specifications across Europe.

It includes:

* **Base profiles.**  Loosely constrained baseline definitions of common European concepts (e.g., Patient, Practitioner). They provide flexibility and serve as the foundation for Core and derived profiles.

* **Core profiles.**  More constrained profiles designed for reuse across most European IGs. They introduce essential constraints, can often be used directly, and pursue alignment with IPS.

See the [**Introduction** page](introduction.html) for detailed explanations of Base and Core profiles, their relationship with Extensions and scoped IGs, and their alignment with EHDS and IPS.

<div>
  <p></p>
  <figure>
    <img src="home-2.png" alt="Base and core profiles" width="50%"/>
    <figcaption><strong>Fig. 1 - European Base and Core profiles</strong></figcaption>
  </figure>
  <p></p>
</div>

### Guide Publication

This guide is published for two HL7 FHIR versions:


* **HL7 FHIR R4 Base IG** (hl7.fhir.eu.base). Published at the [HL7 Europe Base R4 page](https://hl7.eu/fhir/base).
* **HL7 FHIR R5 Base IG** (hl7.fhir.eu.base-r5). This Guide.

Both versions are maintained by HL7 Europe and evolve based on community feedback and EHDS requirements.
