Profile: ImImagingSelection
Parent: ImagingSelection
Title: "Represents the part of an imaging study."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* status MS
* subject 1..1 MS
  * insert SetPopulateIfKnown
* category MS
* code MS
  
Profile: ImImagingStudyPhase
Parent: ImImagingSelection
Id: im-imaging-study-phase
Title: "Imaging results from Procedure Phase"
Description: "Represents the part of an imaging study that relates to a procedure phase such as e.g., without contrast, arterial phase, venous 
phase, delayed phase. Only some types of studies have phases."
* insert SetFmmAndStatusRule( 1, draft )

* category
  * insert SliceElement( #value, "coding" )
* category contains phase 1..1 MS
* category[phase]
  * coding 1..1 MS
  * coding = $sct#128954007 "Procedure phase"  