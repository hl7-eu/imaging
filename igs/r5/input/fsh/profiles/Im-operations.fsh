Instance: DiagnosticReport-fhir-report
InstanceOf: OperationDefinition
Title: "OperationDefinition: $document on DiagnosticReport"
Description: "OperationDefinition for creating a document Bundle based on a DiagnosticReport."
Usage: #definition
* name = "document"
* title = "OperationDefinition: create a FHIR report from a DiagnosticReport"
* status = #active
* kind = #operation
* experimental = false 
* date = 2025-01-01
* purpose = "Utility operation to generate a FHIR report from a DiagnosticReport."
* description = """
This operation generates a FHIR report from an DiagnosticReport resource that points to a Composition resource. Its behavior is identical to the [Composition/$document](https://build.fhir.org/composition-operation-document.html) operation but adds the DiagnosticReport and its referenced resources to the Bundle.
"""
* code = #document
* system = false
* type = false
* instance = true
* parameter
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Bundle
  * documentation = "The generated FHIR report."
  * targetProfile = Canonical(ImReport)
