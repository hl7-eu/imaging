Profile: ObservationNarrativeReport
Parent: $EuObservation
Title: "Observation: Narrative Report"
Description: "Unstructured narrative text in an imaging report."

* insert SetFmmAndStatusRule( 1, draft )

{{R4}}* obeys im-narrative-value-1

* code = $loinc#18782-3
  // * insert SliceCodeableConceptWithRequiredCode( narrative-report, $loinc, #18782-3 )
// * code contains narrative-report 1..1
// * code[narrative-report] = $loinc#18782-3 "Radiology Study observation (narrative)"


* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains ServiceRequestOrderEuImagingaccession 0..*
* insert BasedOnServiceRequestOrderEuImagingReference( ServiceRequestOrderEuImagingaccession )

* value[x] 0..1
* value[x] ^short = "Unstructured narrative imaging report"
* value[x] ^definition = "This element represents unstructured narrative text in an imaging report, 
as it was entered by the reporting clinician or an automated system."
{{R5}}* value[x] only string or Attachment
// {{R4}}* value[x] only string
// {{R4}}* valueString.extension contains $rendering-xhtml-url named renderingXhtml 0..1 and 
// {{R4}}  $rendering-markdown-url named renderingMarkdown 0..1 and 
// {{R4}}  $CrossVersion-Observation.value named valueAttachment 0..1

{{R4}}* value[x] only string
{{R4}}* value[x] ^short = "Unstructured narrative imaging report as string"
* value[x].extension contains $rendering-xhtml-url named renderingXhtml 0..1  and
  $rendering-markdown-url named renderingMarkdown 0..1
{{R4}}  and $CrossVersion-Observation.value named valueAttachment 0..1
{{R4}}* value[x].extension[valueAttachment] ^short = "Narrative report as an Attachment, conveyed via the R5 cross-version extension"
{{R4}}* value[x].extension[valueAttachment].value[x] 1..1
{{R4}}* value[x].extension[valueAttachment].value[x] only Attachment
{{R4}}* value[x].extension[renderingXhtml] ^short = "XHTML rendering of the narrative value"
{{R4}}* value[x].extension[renderingMarkdown] ^short = "Markdown rendering of the narrative value"

{% if isR4 %}
Invariant: im-narrative-value-1
Description: "Either the narrative value (valueString) or its Attachment cross-version extension (value.extension) SHALL be present."
Severity: #error
Expression: "value.exists() or value.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.value').exists()"
{% endif %}
