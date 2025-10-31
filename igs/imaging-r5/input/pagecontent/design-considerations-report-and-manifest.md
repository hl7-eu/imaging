### Report and Manifest

The imaging specification has to provide access to both imaging study information and reports.

#### Information from the IHE cross-border-working group

**Challenges associated with having a distinct manifest versus embedding manifest information in a report.**

Background: Today in MCWG Recommendations, the approach to imaging study and report linkages is
* to use a linkage  with metadata attributes such as Study UID, Accession Numbers (with registration ID), etc
* The Manifest Metadata includes: One Study UID, one or more Accession # and one or more Order Placer #.  Report contains One or more Study UID, one or more Accession # and one or more Order Placer #. 
* As a result of this approach, one may:
* Query/Search by Study UID returns all reports associated to a given Study.
* Query/Search by Accession # returns all reports and studies associated to an given (RIS) imaging request. 
* Query/Search by Order Placer # returns all reports and studies associated to a given order.


Proposed Resolution of Issue: the information about the images being reported included in the report makes **clinical traceability sense**.  However, we should not confuse **identification** of these images (Study UID/Series UID/Instance UID) and the **referencing by location**.

So far MCWG has tried to avoid inclusion of a Manifest (with locations) in a report.  Why ?

#### Analysis:

Given that the Study manifest (that includes location of image data) **always exists and is distinct from report**, should we in addition allow the manifest content (especially the location information) to be copied within the report:

**Pros**  (for only a separate Manifest document and no location information within the imaging report) :

1. A Study may exist without a related report (creating an “empty report is not a clean approach”).  So having a manifest only in that case makes sense.
2. A report may interpret one or more imaging studies (in some countries it may not be allowed).  Multiple Reports on the same imaging study.  It could be accommodated but adds to the complexity in case of location updates.
3. The imaging study may evolve in some cases, so updates are simpler to update only the manifest (otherwise report signature becomes challenging)
4. One shall include in the report the ability to reference image instances (without location) so that there is traceability and if “policies” allow for shared image deletion, the imaging report may include references to image instance(s) that are no longer accessible with the updated manifest.
*Note: the use of an “IOCM object” to virtually delete the pointed image objects should be possible, but is not explicitly required.  See plazn to create a CP on this)*
5. The production of the imaging study (Modality/PACS) involves different technology/systems than the production of the imaging report (RIS).

**Cons** (for only a separate Manifest document and no location information within the imaging report):

1. In the case a report and a study are shared, accessing the report (that includes the manifest) support access in a single step.  If location is only in Manifest it would require a second step to access the manifest (only if the goal is to retrieve the DICOM Instances, otherwise a server-side URL would give a single step for viewing the images).
2. It would require some alignment in term of access rights between the report and the manifest (It seems that some countries have aligned this for policy reasons and clinical use cases).


**The Pros clearly outweigh the Cons.**

#### Additional considerations

The study information is represented in an imaging-manifest. It represents the information that is stored in a PACS. The report is typically stored in the RIS and/or EHR. Separating the two concepts allows both systems to appropriately represent the data they have without being forced to include information they typically do not have access to.

In order to access the data, the URL's of the WADO/viewer endpoints are needed that provide access to the content, These URL's might change depending on the scope in which the data is accessed (within the healthcare provider, from outside the healthcare provider or cross border). During the life-cycle of an imaging study, it typically moves between different system. Starting in the main PACS and moving in and out of long term storage depending on the need. If we include the data access URL's in the report, each change might break the report signature. Placing these in the manifest prevents this and also allows for the situation where the same study data can be accessed from multiple locations.

#### Conclusion

**Decision:** There will be a imaging-manifest documenting the information typically stored in a PACS that holds the Endpoint resources with the URL's that allow access to the content, this manifest is defined in {{manifest}}.

**Decision:** There will be a imaging report documenting the radiology report which is not required to include the URL's to access the content.
