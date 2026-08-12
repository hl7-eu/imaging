ValueSet:      SiteQualifierEuVs
Id:	           siteQualifier-eu
Title:	       "Body Structure Qualifier"
Description:   "Body Structure site qualifier. It indicates - for example - the body site qualifier from which a laboratory specimen is collected. (based on SNOMED CT)"
// * ^experimental = false
// * ^publisher = "HL7 Europe"
// * ^copyright = "HL7 Europe"
* insert SNOMEDCopyrightForVS
* insert SetFmmandStatusRule (2, trial-use)
//* include codes from valueset $BodystructureLocationQualifierR5
//* exclude codes from valueset LabLateralityEuVs
// following codes are associated with aterality, so not mentioned here, see https://jira.hl7.org/browse/FHIR-51391
// * $sct#7771000 "Left (qualifier value)"
// * $sct#24028007 "Right (qualifier value)"
// * $sct#51440002 "Right and left (qualifier value)"
* $sct#46053002 "Distal (qualifier value)"
* $sct#255554000 "Dorsal (qualifier value)"
//* $sct#264147007 "Plantar" inactive concept
* $sct#261183002 "Upper (qualifier value)"
* $sct#261122009 "Lower (qualifier value)"
* $sct#255561001 "Medial (qualifier value)"
* $sct#49370004 "Lateral (qualifier value)"
* $sct#264217000 "Superior (qualifier value)"
* $sct#261089000 "Inferior (qualifier value)"
* $sct#255551008 "Posterior (qualifier value)"
* $sct#351726001 "Below (qualifier value)"
* $sct#352730000 "Supra- (qualifier value)"
* $sct#40415009 "Proximal (qualifier value)"
* $sct#255549009 "Anterior (qualifier value)"
* $sct#26283006 "Superficial (qualifier value)"
* $sct#795002 "Deep (qualifier value)"
* $sct#57195005 "Basal (qualifier value)"
* $sct#3583002 "Caudal (qualifier value)"
* $sct#66787007 "Cephalic (qualifier value)"
* $sct#255481003 "Left upper quadrant (qualifier value)"
* $sct#255497008 "Right upper quadrant (qualifier value)"
* $sct#255480002 "Left lower quadrant (qualifier value)"
* $sct#255495000 "Right lower quadrant (qualifier value)"