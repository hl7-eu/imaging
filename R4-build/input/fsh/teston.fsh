Instance: DianosticoReporto
InstanceOf: DiagnosticReport
Usage: #example
* status = #registered
* code
  * text = "CT of head and neck"
* imagingStudy = Reference(ImagingStudy/example)
//R5* study = Reference(ImagingStudy/example)
