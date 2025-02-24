### Linking to body-sites

THe {{ehnImagingGuidelines}} requires that information is added that defines the body site of the imaging procedure (section A.5.1.6). This information consists of a set of different data elements:

- body location
- laterality

In FHIR body locations can be represented in two ways: as a coded value or as a reference to a `BodyStructure` resource. The coded value is used when a code is sufficient. The `BodyStructure` is used when more information is needed such as laterality or to indicate morphology. Additionally, as is specified in {{dicomSr2fhir}} the information such as the DICOM tracking id (see [DICOM-SR-2-FHIR body structure](https://hl7.org/fhir/uv/dicom-sr/2024Sep/StructureDefinition-dicom-sr-tracking-identifiers.html)). The DICOM tracking id is used to track similar features across DICOM studies and reports.

References to a body site are used in `ImOrder` (what part of the body is to be studied), `ImProcedure` (the body site the procedure is performed on) and `ImagingStudy.series` (the body site the series is imaging). In FHIR R5 both `ImOrder` and `ImagingStudy` allow references to `BodyStructure`. `Procedure` only supports a coded value.

In the specification there are different approaches that can be taken towards representing body sites:

1. Use code when code is sufficient, `BodyStructure` when additional information is required,
2. Prefer `BodyStructure` over body site.
3. Always include both, if allowed

The first option might cause issues with searching as in some situations, the code resides on the source resource and when a reference to BodyStructure is used, on BodyStructure. These are covered by two search parameters and would require more complex search operations.

The second option is not feasible in all cases as both options are not supported on all resources.

The third option is allows for searched but does allow to specify further information if needed. But does require definition of resources that are not providing additional information.

**CHOICE:**: when referring to a body site on a resource that allows both a reference and a coded value, always populate the coded value.

**CHOICE:**: when referring to a body site and more information is available (such as tracking id or laterality), include both a code as well as a reference.
