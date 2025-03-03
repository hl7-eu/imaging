Profile: ImAuthoringDevice
Parent: Device
Id: im-authoring-device
Title: "Imaging Authoring Device"
Description: "This profile represents the device used to author the Imaging Diagnostic Report."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* identifier 0..* MS
  * ^definition = """ 
    Authoring device identification number. 
    """
  * insert SetPopulateIfKnown
* status 1..1 MS
* name 0..1 MS
  * ^definition = """ 
    Name of the authoring device.
    """
  * insert SetPopulateIfKnown

Profile: ImImagingDevice
Parent: Device
Id: im-imaging-device
Title: "Imaging Device"
Description: "This profile on Device represents the imaging device."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* udiCarrier 0..* MS
  * ^definition = """ 
    Normalized identifier of the acquisition modality equipment instance such as UDI according to REGULATION (EU) 2017/745.
    """
  * insert SetPopulateIfKnown
  * deviceIdentifier 1..1 MS
    * insert SetPopulateIfKnown
* status 1..1 MS
* name 0..1 MS
  * ^definition = """ 
    Name of the imaging device.
    """
  * insert SetPopulateIfKnown
