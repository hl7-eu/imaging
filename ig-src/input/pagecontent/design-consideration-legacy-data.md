
### Support for Legacy Data

It is anticipated that regulatory authorities may specify requirements for conformance to this implementation guide from a particular date.

Systems implementing this specification **SHOULD**  ensure that regulatory requirements regarding conformance are met from the specified implementation date forward, by which the fully structured report model described in this IG is the expected representation of the newly created imaging diagnostic reports

Record holders **MAY** surface historical data (created before the implementatio ndate) that they believe is clinically relevant, even if it does not conform to the profiles specified in this guide. This approach is taken so that:

* Promotes patient safety by ensuring that all potentially relevant clinical data remains available to healthcare providers
* Reduces the burden on healthcare organizations to convert or manually remediate large volumes of legacy data
* Aligns with FHIR's broader guidance that servers may return results beyond what a client specified in their request, if deemed clinically relevant
