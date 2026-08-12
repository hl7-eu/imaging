<div class="alert alert-info" style="font-size: 95%; margin-top:1em;">
  <div>
    <strong>At a glance – HL7 Europe Base and Core IG</strong>
    <ul>
      <li><strong>Layered approach:</strong> Base profiles (flexible foundation) → Core profiles (essential constraints) → Scoped IGs (domain-specific use).</li>
      <li><strong>Alignment:</strong> Supports the European Health Data Space (EHDS) and stays consistent with international standards such as IPS.</li>
      <li><strong>Reuse:</strong> Core profiles are the main reference point for most HL7 Europe Implementation Guides.</li>
      <li><strong>Goal:</strong> Enable cross-border <em>consistency</em>, <em>interoperability</em>, and <em>reuse</em> across national and EU-level initiatives.</li>
    </ul>
  </div>
</div>


### European Base and Core Profiles

The HL7 Europe Base and Core Implementation Guide uses a **layered approach to FHIR interoperability** in Europe.

**Base profiles** define common concepts in a flexible way; while **Core profiles** specify essential constraints and extensions that can be reused across many use cases and are directly referenced by most HL7 Europe IGs. When Base profiles are defined, Core profiles are derived from them.

Together with **extensions** and **scoped HL7 EU IGs**, they form a consistent framework that supports the **European Health Data Space (EHDS)** while maintaining alignment with **international standards** such as the IPS.

<div>
  <p> </p>
  <figure>
    <img src="home-1.png" alt="Relationships between Base, Core, EHDS and IPS" width="65%"/>
    <figcaption><strong>Fig. 1 – HL7 Europe profiling layers: extensions, Base, Core, and their reuse in scoped HL7 EU IGs.</strong></figcaption>
  </figure>
  <p> </p>
</div>


* **Extensions**
  * Provide additional elements not in core FHIR, capturing information relevant in Europe but absent from base resources or the UV FHIR Extensions package.
* **Base profiles** define common healthcare concepts in a flexible way.
  * Act as the **baseline definitions** of commonly used concepts in Europe.
  * **Loosely constrained**, offering flexibility.
  * **Rarely used as-is**, but serve as the foundation for Core and derived profiles.
* **Core profiles**
  * Introduce **essential constraints and extensions** that cut across many use cases.
  * Serve as the **first reference point** for most HL7 Europe FHIR Implementation Guides.
  * Can often be used **directly as-is**, without further refinement.
  * Realize the **common EHDS logical models** and pursue **alignment with IPS** where relevant.
* **Scoped HL7 EU IGs** (e.g., **Patient Summary, Laboratory Report, Hospital Discharge Report**)
  * Reuse Core profiles to ensure **consistency and interoperability** across Europe.
  * Add domain-specific constraints and implementation details while staying grounded in the Base and Core artifacts.


### Understanding the Relationships with Base and Core Profiles

The HL7 Europe Base and Core profiles align with the **European Health Data Space (EHDS)** and the wider international standards landscape.

* **EHDS logical models** are realized through Core profiles, ensuring alignment with the EHDS framework.
* **International Patient Summary (IPS)** alignment is pursued within Core profiles to maintain global consistency.

<div>
<p> </p>
  <figure>
    <img src="home-2.png" alt="Relationship between Base, Core, EHDS and IPS" width="65%">
    <figcaption><strong>Fig. 2 – Relationship between Base profiles, Core profiles, EHDS logical models, and IPS.</strong></figcaption>
  </figure>
  <p> </p>
</div>

### EHDS Compatibility

The profiles support the **European Health Data Space (EHDS)** by operationalizing its **common logical models**. While informed by **eHealth Network guidelines**, variations across national and EU-level specifications are considered, keeping the profiles:

* **General enough** for reuse across multiple initiatives.
* **Precise enough** to guarantee consistent, practical interoperability.
