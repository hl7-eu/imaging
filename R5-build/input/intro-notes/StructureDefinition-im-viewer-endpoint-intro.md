This {{Endpoint}} represents a viewer supporting {{iheIid}} that can be launched to access imaging data.

References to this resource are typically added to an {{ImagingStudy}} resource. When it appears on `ImagingStudy.endpoint` it signals that the study can be viewed using the viewer. When it appears on `ImagingStudy.serie.endpoint`, it signals that the serie can be viewed using the viewer.

{{iheIid}} defines the query parameters in Table 4.106.4.1.2-2. These parameters are populated according to the following guidelines.

The use case in which this viewer is used maps more naturally on launching the viewer using study-based viewing, in which case the *AccessionNumber* or *StudyInstanceUID* is used to identify the study to be viewed. Note that IID does not allow direct viewing of series. In the case it is present on `ImagingStudy.series.endpoint`, it signals that *at least* the serie it is on can be viewed using the viewer.

A example launch URL for study-based viewing is:

```text
http://<location>/IHEInvokeImageDisplay?requestType=STUDY&studyUID=1.2.840.113883.19.110.4,1.2.840.113883.19.110.5&viewerType=IHE_BIR&diagnosticQuality=true
```

The viewer can also be used for patient-based viewing. This requires passing an identification of the patient as a HL7v2 CX field. The patient is identified by its `identifier`s, the mapping of the `identifier`s to Hl7v2 CX is defined in [HL7v2-to-FHIR CX](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-cx-to-identifier.html). The `identifier.system` maps on `CX.4` and `identifier.value` on `CX.1`.

An example of a launch URL for patient-based viewing is:

```text
http://<location>/IHEInvokeImageDisplay?requestType=PATIENT&patientID=99998410^^^AcmeHospital&mostRecentResults=1
```
