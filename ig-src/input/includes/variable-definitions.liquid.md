{% if isR5 %}
{{ "{% assign hl7EuBase         = \"[HL7 EU Base](https://build.fhir.org/ig/hl7-eu/base-r5/)\" %}" }}
{{ "{% assign hl7EuMpd          = \"[HL7 EU MPD](https://hl7.eu/fhir/mpd-r5/)\" %}" }}
{% endif %}

{% if isR4 %}
{{ "{% assign hl7EuBase         = \"[HL7 EU Base](https://hl7.eu/fhir/base/)\" %}" }}
{{ "{% assign hl7EuMpd          = \"[HL7 EU MPD](https://hl7.eu/fhir/mpd/)\" %}" }}
{% endif %}

{% raw %}
{% assign ehnImaging        = "[eHN Imaging Studies and Reports](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en)" %}
{% assign ehnImagingGuidelines = "[eHN Imaging Studies and Reports](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en) guidelines" %}
{% assign ehnImagingHtml    = '<a href="https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en">eHN Imaging Studies and Reports</a>' %}
{% assign ehnImagingFull    = "[Guideline on the electronic exchange of health data under Cross-Border Directive 2011/24/EU Medical imaging studies and reports, release 1.1](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en)" %}

{% assign XtEhrImaging      = "[Xt-EHR Imaging Logical Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCaseMedicalImages.html)" %}
{% assign XtEhrImagingHtml  = '<a href="https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCaseMedicalImages.html)">XtEHR Imaging Logical Model</a>' %}

{% assign iheRad            = "[IHE-RAD](https://profiles.ihe.net/RAD/)" %}
{% assign iheIid            = "[IHE-IID](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_IID.pdf)" %}
{% assign iheIDR            = "[IHE-IDR](https://build.fhir.org/ig/IHE/RAD.IDR/)" %}

{% assign hl7EuExtensions   = "[HL7 Europe Extensions](https://hl7.eu/fhir/extensions/)" %}
{% assign hl7EuLabs         = "[HL7 EU Laboratory Reports](https://build.fhir.org/ig/hl7-eu/laboratory/branches/master/index.html)" %}
{% assign hl7EuHdr          = "[HL7 EU Hospital Discharge Reports](https://build.fhir.org/ig/hl7-eu/hdr/index.html)" %}
{% assign hl7EuEps          = "[HL7 Europe Patient Summary](https://build.fhir.org/ig/hl7-eu/eps/)" %}


{% assign ArgImg            = "[Argonaut Imaging](https://github.com/sync-for-science/imaging)" %}

{% assign DICOMwebWado      = "[DICOMweb-WADO](https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri/)" %}
{% assign DICOMpart18       = "[DICOM part18](https://dicom.nema.org/medical/dicom/current/output/html/part18.html)" %}
 
{% assign usCore            = "[US core v7.0.0](https://hl7.org/fhir/us/core/STU7/)" %}
{% assign dicomSr2fhir      = "[DICOM-SR-2-FHIR](https://build.fhir.org/ig/HL7/dicom-sr/)" %}

{% assign manifest          = "[Imaging Manifest](https://build.fhir.org/ig/hl7-eu/imaging-manifest/)" %}

{% include fhir-resources.md %}

{% endraw %}

