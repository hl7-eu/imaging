Instance: EuImagingReportConsumer
InstanceOf: ActorDefinition
Title: "ActorDefinition: Imaging Report Consumer"
Description: "The actor responsible for consuming the Imaging Report resources."
Usage: #definition
* name = "EUImagingReportReportConsumer"
* title = "Imaging Report Consumer"
* status = #draft
* description = "Consumes the Imaging Report."
* documentation = """
This actor represents a system that consumes an imaging report. Given that this encompases a wide variety of systems, including displaying pre-rendered reports in a UI, processing for clinical decision report, systems generating metrics, etc., no obligations are defined for this actor as of now. Obligations may be added in the future when specific use cases or subgorups are defined.
"""
* type = #system