{% include worknote.html text="One or more DICOM identifier codes used by this profile come from the temporary <code>MissingDicomTerminology</code> CodeSystem and must be replaced with the equivalents defined by the DICOM terminology IG once it is published." %}

This profile represents a finding observed during an imaging procedure.

### Guidance on `identifier:observationUid`

Observation UID (DICOM tag `0040,A171`) is the tag used in DICOM to identify observations. When present, it SHOULD be included in the corresponding observation using the `identifier:observationUid` slice.
