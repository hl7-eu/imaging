RuleSet: SetFmmAndStatusRule ( fmm, status )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}

RuleSet: SetObligation( code, actor, source, documentation )
* ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = {code}
* ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical({actor})
* ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "Source: {source}, {documentation}"

RuleSet: SetObligationWithPath( path, code, actor, source, documentation )
* {path}
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = {code}
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical({actor})
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "{documentation}"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "Source: {source}, {documentation}"


// RuleSet: SetPopulateIfKnown
// * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
// * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)

// RuleSet: SetHandleCorrectly
// * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:correctly-handle
// * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)

RuleSet: ExtensionContext(path)
// copied by mCode
* ^context[+].type = #element
* ^context[=].expression = "{path}"

RuleSet: ElementMapping( code, display, targetCode, targetDisplay, relationship )
* element[+]
  * code = {code}
  * display = {display}
  * target 
    * code = {targetCode}
    * display = {targetDisplay}
    * relationship = {relationship}

RuleSet: SliceElement( type, path )
* ^slicing.discriminator.type = {type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open
* ^slicing.ordered = false

RuleSet: SliceElementWithDescription( type, path, description )
* ^slicing.discriminator.type = {type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open
* ^slicing.description = "{description}"
* ^slicing.ordered = false

// RuleSet: MandateLanguageAndSecurity
// * meta
//   * security 0..* MS
// * language 0..1 MS
