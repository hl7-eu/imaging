ValueSet:   ImImagingStudyPerformerTypeVS
Id:	        im-imaging-study-performer-type
Title:	    "Imaging Study Performer Type Value Set"
Description:   """Imaging Study series performer type codes, it extends on the base set defined in the FHIR specification."""
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* include codes from valueset http://hl7.org/fhir/ValueSet/series-performer-function
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST	"custodian"