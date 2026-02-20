{% include profile-references.md %}

### Obligations

Systems are expected to handle specific data elements according to the role (actor) they play in the EHDS Imaging Report ecosystem. In this specification, these expectations are defined as [FHIR Implementation Obligations]({% if isR5 %}https://hl7.org/fhir/R5/obligations.html{% else %}https://hl7.org/fhir/extensions/ValueSet-obligation.html{% endif %}), following [EHDS shared practices](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/branches/new-pages/obligations.html) and are listed in the [Artifacts](artifacts-obligations.html) section.

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>At present, these obligations are defined directly in this IG. In the future, they are expected to be defined in the Xt-EHR logical models and inherited by this IG’s resources and elements.
   </p>
 </blockquote>
</div>

Following this guidance, for {{ProducerActor}}s `SHALL/SHOULD/MAY:able-to-populate` obligations are added indicating the required capability of the Producer to populate a field. For {{ConsumerActor}}s `SHALL/SHOULD/MAY:process` obligations are used to express what fields a {{ConsumerActor}} is required to process. Note that no display related obligations are used as the variety of {{ConsumerActor}}s makes it very difficult if not impossible to determine a generic rule for this.
