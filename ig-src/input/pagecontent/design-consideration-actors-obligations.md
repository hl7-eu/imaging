
### Actor requirements and obligations

This section describes the approach taken in the specification related to obligations placed on the different actors.

The specification recognizes the following actors:

* BundleReportEuImagingCreator - creates the imaging studies report.
* BundleReportEuImagingProvider - provides the imaging studies report.

#### Provider obligations
The BundleReportEuImagingProvider provides the information. In this case this means that it has to provide the information defined in the eHN Guidelines that are further refined by Xt-EHR in the Xt-EHR logical model.

All data elements in the Xt-EHR model are mapped onto one or more FHIR elements (see the mapping section in the spec). In order to ensure that the provider populates these data elements, a requirement/obligation is placed on each FHIR element referred to in the mapping.

The obligation used has the following fields:

| Field | Value |
|-------|-------|
| code	| SHALL:populate-if-known |
| actor |	BundleReportEuImagingCreator or BundleReportEuImagingProvider |
| documentation | list of XtEHR paths that map on this obligation |

This means that the provider SHALL populate these fields it has the information.


#### Using obligations in resources
The obligation extensions will be placed in the profiles. In order to make the profiles clear and concise, for each profile with obligations, sub-profiles will be created.

The main profile will have the structural constraints. The actor specific sub-profile will only hold the obligations placed on the actors.

For BundleReportEuImagingProvider based profiles, the obligations will in the 'documentation' field, indicate the source Xt-EHR requirement the obligation was derived from.