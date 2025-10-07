ValueSet: ImImagingReportTypesEuVS
Title: "Radiology Report Types"
Description: "The set of radiology types as defined by LOINC."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false

* include codes from system $loinc where STATUS = "ACTIVE" and SCALE_TYP = "Doc" and CLASS = "RAD"
// * include codes from system $loinc where concept is-a #18726-0


// TODO refer to manifest?
ValueSet:   XdsClassCodeVs
Id:	        im-xds-class-code-valueset
Title:	    "XDS Class Codes"
Description:   """
A list of XDS class codes that can be used for filtering manifests (zie [XDS_classCode_MetaData_Coding_System](https://wiki.ihe.net/index.php/XDS_classCode_Metadata_Coding_System)).
**Note**: a IHE needs to make a formal FHIR CodeSystem for this.
"""
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value  = "urn:oid:1.3.6.1.4.1.19376.1.2.6.1.1"
* ^identifier[0].assigner.display  = "IHE"
* $xds-class-code#REPORTS	    //"Reports"	"Reports are the result of an inquiry or investigation by a licensed professional"
* $xds-class-code#SUMMARIES	    //"Summaries"	"A record of the most salient facts known at a point in time by a licenses health professional"
* $xds-class-code#IMAGES	    //"Images"	"An artifact that depicts or records visual perception for a subject"
* $xds-class-code#PRESCRIPTIONS	//"Prescribed Treatments and Diagnoses"	"Description of any treatment or order for a diagnosis for a patient"
* $xds-class-code#DISPENSATIONS	//"Dispensations"	"Acts performed by a health professional delivering a treatment"
* $xds-class-code#PLANS	        //"Treatment Plan or Protocol"	"A set of intended treatments informing a team of health professionals about the goals, type of services,service intensity and progress indicators that are designed to reach a clinical objective"
* $xds-class-code#HEALTH	    //"Health Certificates and Notifications"	"Health information produced by health professionals for specific use outside of healthcare"
* $xds-class-code#PATIENT	    //"Patient Expression and Preferences"	"Statements produced by the patient expressing information/data about own health, preferences for care or any directive provided by patients in the handling of their health information."
* $xds-class-code#WORKFLOWS	    //"Workflow Management"	"Information related to the tracking and coordination process in care delivery
// TODO - do we need OTHER?
