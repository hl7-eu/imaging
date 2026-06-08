### Adverse reaction (Adverse reactions manifested during imaging investigation.)

Dataset A5.3 relates to the register of adverse events that occurred during or due to imaging procedures. This includes both allergy-caused reactions as well as non-allergic ones.

Three resource types can be used to encode the required data: `AdverseEvent`, `AllergyIntolerance`, and `Condition`.
In this IG, adverse reactions are recorded using the `AdverseEvent` resource. If the reaction is due to an allergy, it is also recorded using the `AllergyIntolerance` resource. Consumer systems will likely use this resource type to populate the allergy flags.

* Model
{% if isR5 %}
```mermaid
classDiagram
  class ImAdverseReaction {
    <<AdverseEvent>>
    code
    category
    resultingEffect
    seriousness
    occurrence
    suspectEntity.causality.entityRelatedness
    suspectedEntity.instance
    contributingFactor.item
    note
    extension.ImAdverseEventCriticality
  }

  class AllergicReaction{
    <<AllergyIntolerance>>
    verificationStatus
    criticality
    reaction.extension.allergyCertainty
    reaction.substance
    reaction.manifestation
    reaction.severity 
    reaction.onset
    type
    note
  }

  class ProcedureEuImaging{
    <<Procedure>>
  }

  ImAdverseReaction --> ProcedureEuImaging: suspectEntity.instanceReference
  ImAdverseReaction --> AllergicReaction: contributingFactor.item
```
{% endif %}

{% if isR4 %}
```mermaid
classDiagram
  class ImAdverseReaction {
    <<AdverseEvent>>
    code
    category
    resultingEffect
    seriousness
    occurrence
    suspectEntity.causality.entityRelatedness
    suspectedEntity.instance
    contributingFactor.item
    note
    extension.ImAdverseEventCriticality
  }

  class AllergicReaction{
    <<AllergyIntolerance>>
    verificationStatus 
    criticality
    reaction.extension.allergyCertainty
    reaction.substance
    reaction.manifestation
    reaction.severity
    reaction.onset
    type
    note
  }

  class ProcedureEuImaging{
    <<Procedure>>
  }

  ImAdverseReaction --> ProcedureEuImaging: suspectEntity.instance
  ImAdverseReaction --> AllergicReaction: subjectMedicalHistory
```
{% endif %}

#### Design Rationale and Resource Selection

The following section explains why the combination of AdverseEvent and AllergyIntolerance was selected as the recommended approach for adverse reaction modeling in this IG. While other FHIR resources could theoretically encode adverse reactions, this combination was chosen to best balance clinical semantics, resource alignment, and implementer usability. The analysis below demonstrates the design considerations and explains why alternative approaches were not selected.

##### AdverseEvent resource

The recommended modeling choice in this IG to represent adverse reactions.

* Pros:
  * it can point to a Procedure. It represents widely both types of reactions (allergic and non-allergic).
  * It can point to an AllergyIntolerance resource, for the cases in which that pathogenic mechanisms is suspected or confirmed.
* Cons:
  * it lacks some of the allergy-specific elements required (i.e. `criticality`, `verification status`).
  * The resource focuses mainly on the registration and monitoring of adverse events.
  * The link to the rest of the model is done through AdverseEvent.SuspectedEntity.ProcedureEuImaging, which is probably not the best way of referencing it, as it needs a reverse include to query adverse events happened in a given procedure.
  * A custom extension is required to encode the `criticality` data point.

##### AllergyIntolerance resource

The recommended companion modeling choice in this IG to represent allergic conditions associated with adverse reactions.

* Pros:
  * This resource provides off-the-shelf data elements to convey `severity`, `criticality`, `propensity` and a [standard extension](http://hl7.org/fhir/StructureDefinition/allergyintolerance-certainty) is available for the `certainty` element.
* Cons:
  * Although it has a `.reaction` element, the focus of the resource is on establishing allergic states, not on capturing events.
  * There is not a straightforward way to reference to or from a `Procedure` resource, so it cannot be directly linked to the main model. It could be achieved through `.encounter`, but that resource might not be exchanged in the Bundle, thus the reference would be lost.

##### Condition resource – Not Recommended

While the Condition resource was considered as an alternative approach, it was **not selected** for adverse reaction modeling in this IG. The following analysis explains why:

* Pros:
  * It can be linked directly to a Procedure resource through `Procedure.complication`.
* Cons:
  * It encompasses all types of conditions, thus it defines too broadly the kind of event that this use case requires.
  * The semantic focus of Condition is on persistent or evolving health states, not on specific clinical events or adverse reactions during procedures.
  * It lacks the event-specific elements required to capture the temporal, causal, and clinical details essential for adverse reaction documentation.

**Conclusion:** The Condition resource is not aligned with the clinical and data modeling requirements for capturing adverse reactions during imaging procedures. Implementers should use AdverseEvent and AllergyIntolerance as specified above.