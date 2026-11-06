{% if site.data.fhir.version == "4.0.1" %}
  {% assign isR4 = true %}
  {% assign isR5 = false %}
{%else%}
  {% assign isR4 = false %}
  {% assign isR5 = true %}
{%endif%}

{% assign ehnImaging        = "[eHN Imaging Studies and Reports](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en)" %}
{% assign ehnImagingGuidelines = "[eHN Imaging Studies and Reports](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en) guidelines" %}
{% assign ehnImagingHtml    = '<a href="https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en">eHN Imaging Studies and Reports</a>' %}
{% assign ehnImagingFull    = "[Guideline on the electronic exchange of health data under Cross-Border Directive 2011/24/EU Medical imaging studies and reports, release 1.1](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en)" %}

{% assign XtEhrImaging      = "[Xt-EHR Imaging Logical Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html)" %}
{% assign XtEhrImagingHtml  = '<a href="https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html">XtEHR Imaging Logical Model</a>' %}

{% assign iheRad            = "[IHE-RAD](https://profiles.ihe.net/RAD/)" %}
{% assign iheIid            = "[IHE-IID](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_IID.pdf)" %}
{% assign iheIDR            = "[IHE-IDR](https://build.fhir.org/ig/IHE/RAD.IDR/)" %}
{% assign iheMADO           = "[IHE-MADO](https://profiles.ihe.net/RAD/MADO)" %}
{% assign iheMHD-R4         = "[IHE-MHD](https://profiles.ihe.net/ITI/MHD/index.html)" %}
{% assign iheMHD-R5         = "[IHE-MHD](https://profiles.ihe.net/ITI/MHD/index.html)" %}
{% if isR5 %}{% assign iheMHD = iheMHD-R5 %}{% else %}{% assign iheMHD = iheMHD-R4 %}{% endif %}
{% assign iheXcWado         = "[IHE-XC-WADO](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD-Suppl_XC-WADO.pdf) %}

{% assign hl7EuBaseR4       = "[HL7 EU Base](https://hl7.eu/fhir/base/2.0.1/)" %}
{% assign hl7EuBaseR5       = "[HL7 EU Base](https://hl7.eu/fhir/base-r5/2.0.1/)" %}
{% assign hl7EuExtensionsR4 = "[HL7 Europe Extensions](https://hl7.eu/fhir/extensions/1.3.1/)" %}
{% assign hl7EuExtensionsR5 = "[HL7 Europe Extensions](https://hl7.eu/fhir/extensions/1.3.1/)" %}
{% assign hl7EuLabs         = "[HL7 EU Laboratory Reports](https://hl7.eu/fhir/laboratory/2.1.0/)" %}
{% assign hl7EuHdr          = "[HL7 EU Hospital Discharge Reports](https://hl7.eu/fhir/hdr/1.0.0/)" %}
{% assign hl7EuEps          = "[HL7 Europe Patient Summary](https://hl7.eu/fhir/eps/1.0.0-ballot/)" %}

{% assign EuridiceHealthDataAPI = "[EU Health Data API](https://build.fhir.org/ig/euridice-org/eu-health-data-api/en/)" %}

{% assign ArgImg            = "[Argonaut Imaging](https://github.com/sync-for-science/imaging)" %}

{% assign DICOMwebWado      = "[DICOMweb-WADO](https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri/)" %}
{% assign DICOM             = "[DICOM](https://dicom.nema.org/medical/dicom/current/output/chtml/part01/PS3.1.html)" %}
{% assign DICOMpart18       = "[DICOM part18](https://dicom.nema.org/medical/dicom/current/output/html/part18.html)" %}
 
{% assign usCore            = "[US core v7.0.0](https://hl7.org/fhir/us/core/STU7/)" %}
{% assign dicomSr2fhir      = "[DICOM-SR-2-FHIR](https://build.fhir.org/ig/HL7/dicom-sr/)" %}

{% assign manifest          = "[Imaging Manifest](https://hl7.eu/fhir/imaging-manifest/1.0.0-ballot/)" %}

{% assign euridiceAPI       = "[EU Health Data API](https://build.fhir.org/ig/euridice-org/jwg-api/branches/main/en/)" %}
