ValueSet:      SiteLateralityEuVs
Id:	       siteLaterality-eu
Title:	       "Body Structure Laterality"
Description:   "Body Structure site laterality qualifier. It indicates - for example - the body site laterality from which a laboratory specimen is collected. (based on SNOMED CT)"
* insert SNOMEDCopyrightForVS
* insert SetFmmandStatusRule (2, trial-use)
* $sct#7771000	"Left (qualifier value)"
* $sct#24028007 "Right (qualifier value)"
* $sct#51440002 "Right and left (qualifier value)" // = bilateral, not sure how bilateral in context of lab order/report could be used
//* $sct#261183002 "Upper (qualifier value)"
//* $sct#261122009 "Lower (qualifier value)"
//* $sct#255561001 "Medial (qualifier value)"
