### Image data access and endpoints

Besides access to the imaging report, the eHN Guidelines also requires access to the imaging data.

Existing (non-FHIR) systems use a variety of mechanisms to support searching for imaging studies. Examples include DICOM DIMSE, DICOMweb QIDO, querying for KOS objects andst the imaging study manifest. Typically they allow for a range of query options such as querying on codes and SOPclass.

The IG will focus on a FHIR based approach to searching for imaging studies.

The specification will not dictate the mechanism to access the imaging data but will focus on describing the available mechanisms and endpoints to retrieve (part of a) study. This will be done by defining profiles for {{Endpoint}} resources.

{{Endpoint}} profiles will be defined for at least the following image access mechanisms:
* DICOMweb WADO
* DIMSE
* Launch a DICOM viewer

The specification assumes that search is done on {{ImagingStudy}} and related resources.

{% include worknote.html text='Further discussion is needed on this topic.' %}
