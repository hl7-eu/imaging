Extension: AnatomicalRegion
Title: "Extension: Anatomical Region"
Description: "The anatomical region in an ImagingStudy instance. This is additional information next to ImagingStudy.series.bodySite."
Context: DiagnosticReport, ImagingStudy
* insert SetFmmAndStatusRule( 1, draft )
* value[x] only CodeableConcept
* valueCodeableConcept from AnatomicalRegionVs (required)
  * coding 1..*

ValueSet:   AnatomicalRegionVs
Id:	        im-anatomical-region-valueset
Title:	    "ValueSet: Anatomical Region"
Description:   """A shortlist of anatomical regions that can be used for searching reports and manifests. When the MADO manifest is implemented, this ValueSet can be replaced with a reference to that ValueSet."""
* ^experimental = false
* $sct#63337009  // Lower trunk Abdominopelvic segment of trunk
* $sct#38266002  // Whole body Entire body as a whole
* $sct#53120007  // Arm Upper limb structure
* $sct#61685007  // Leg Lower limb structure
* $sct#67734004  // Upper trunk Thoracic segment of trunk
* $sct#774007    // Head and neck* Structure of head and/or neck
* $sct#113257007 // Cardiovascular system Structure of cardiovascular system
* $sct#80891009  // Heart Heart
* $sct#76752008  // Breast Breast structure
* $sct#737561001 // Spine* Structure of vertebral column and/or spinal cord
