RuleSet: RequireReadAndSearch
* interaction[+]
  * code = #read
  * insert CapabilityStatement-Expectation( #SHALL )
* interaction[+]
  * code = #search-type
  * insert CapabilityStatement-Expectation( #SHALL )
* updateCreate = false
* conditionalCreate = false
* conditionalUpdate = false
* conditionalDelete = #not-supported
* referencePolicy = #resolves // change identifier references to logical references
* searchRevInclude = "Provenance:target"

RuleSet: CapabilityStatement-Expectation( code )
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * valueCode = {code}

RuleSet: CapabilityStatement-SearchParameter( name, type, requirement )
* searchParam[+]
  * insert CapabilityStatement-Expectation( {requirement} )
  * name = {name}
  * type = #{type}

RuleSet: CapabilityStatement-SearchParameterWithDocumentation( name, type, requirement, documentation )
* searchParam[+]
  * insert CapabilityStatement-Expectation( {requirement} )
  * name = {name}
  * type = #{type}
  * documentation = {documentation}
  