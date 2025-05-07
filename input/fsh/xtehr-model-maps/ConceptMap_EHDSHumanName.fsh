////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSHumanNameMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSHumanName"
Description: "Map for EHDSHumanName"
* status = #draft
* experimental = true
* title = "EHDSHumanName Mapping"
* name = "EHDSHumanNameMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHumanName"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHumanName"
  * target = $EuHumanNameUrl
  * element[+]
    * code = #use
    * target[+]
      * code = #use
      * display = "C.27.1 - Use"
      * relationship = #equivalent
  * element[+]
    * code = #text
    * target[+]
      * code = #text
      * display = "C.27.2 - Text"
      * relationship = #equivalent
  * element[+]
    * code = #family
    * target[+]
      * code = #family
      * comment = "Concatenation of family names."
      * display = "C.27.3 - Family"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #given
    * target[+]
      * code = #given
      * display = "C.27.4 - Given"
      * relationship = #equivalent
  * element[+]
    * code = #prefix
    * target[+]
      * code = #prefix
      * display = "C.27.5 - Prefix"
      * relationship = #equivalent
  * element[+]
    * code = #suffix
    * target[+]
      * code = #suffix
      * display = "C.27.6 - Suffix"
      * relationship = #equivalent

////////////////////////////////////////////////////
