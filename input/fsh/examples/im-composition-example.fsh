Instance: ImComposition-example
InstanceOf: ImComposition
Title: "Brain MRI example"
Description: "This is an example of a EU Imaging IG Composition for a Brain MRI report."
* status = #final
* language = #en
* subject = Reference(ImPatient-example)
* extension[diagnosticreport-reference].valueReference = Reference(ImDiagnosticReport-example)
* extension[basedOn].valueReference = Reference(ImOrder-example)
* extension[informationRecipient].valueReference = Reference(ImInformationRecipient-example)
* extension[artifactVersion].valueString = "0.1.0"
* identifier
  * system = "http://example.org/composition"
  * value = "123456"
* type = $loinc#18726-0
* date = "2021-01-01T00:00:00Z"
* author[author] = Reference(ImAuthor-example)
* author[authoring-device] = Reference(ImAuthoringDevice-example)
* title = "Brain MRI pre and post contrast"
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].party = Reference(ImLegalAuthenticator-example)
* attester[resultValidator].mode = #professional
* attester[resultValidator].party = Reference(ImResultValidator-example)
* custodian = Reference(ImOrganization-example)

// Imaging Study Section
* section[imagingstudy].title = "Brain MRI pre and post contrast"
* section[imagingstudy].code = $loinc#18726-0
* section[imagingstudy].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Study</h3>
 <p>MRI Brain with and without contrast.</p>
</div>
"""
* section[imagingstudy].entry[0] = Reference(ImImagingStudy-example)

// Order Section
* section[order].title = "Order"
* section[order].code = $loinc#55115-0 "Order"
* section[order].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Order</h3>
 <ul>
 <li><strong>Accession #:</strong> 123456789</li>
 <li><strong>Referring Physician:</strong> Dr. John Doe, Neurology Associates</li>
 <li><strong>Indication:</strong> Persistent headaches and recent onset of visual disturbances.</li>
 <li><strong>Clinical Question:</strong> Rule out intracranial mass or demyelinating disease.</li>
 </ul>
</div>
"""
* section[order].entry[0] = Reference(ImOrder-example)

// History Section
* section[history].title = "History"
* section[history].code = $loinc#11329-0 "History"
* section[history].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Patient History</h3>
 <ul>
 <li>52-year-old female with a history of hypertension and type 2 diabetes mellitus.</li>
 <li>No known prior history of intracranial pathology.</li>
 <li>Reports progressive headaches over the past three months, unresponsive to NSAIDs.</li>
 <li>Recent onset of blurred vision in the left eye.</li>
 <li>No prior intracranial surgeries or significant head trauma.</li>
 </ul>
</div>
"""
* section[history].entry[0] = Reference(ImImpression-example)

// Procedure Section
* section[procedure].title = "Procedure"
* section[procedure].code = $loinc#55111-9 "Procedure"
* section[procedure].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Procedure and Materials</h3>
 <ul>
 <li>MRI of the brain was performed on <strong>[DATE]</strong> using a 3T scanner.</li>
 <li>Sequences obtained: Axial T1, T2, FLAIR, DWI, ADC, GRE, and post-contrast T1-weighted imaging.</li>
 <li>Contrast: 10 mL of gadobutrol (Gadavist) was administered intravenously without immediate complications.</li>
 <li>No motion artifacts noted. Image quality was diagnostic.</li>
 </ul>
</div>
"""
// tbd if other entries are needed
* section[procedure].entry[0] = Reference(ImProcedure-example)

// Comparison Section
* section[comparison].title = "Comparison"
* section[comparison].code = $loinc#18834-2 "Comparison"
* section[comparison].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Comparison</h3>
 <ul>
 <li>No prior brain MRI available for direct comparison.</li>
 <li>Most recent head CT (dated <strong>[DATE]</strong>) reviewed for correlation.</li>
 </ul>
</div>
"""
* section[comparison].entry[0] = Reference(ImImagingStudy-example)

// Findings Section
* section[findings].title = "Findings"
* section[findings].code = $loinc#59776-5 "Findings"
* section[findings].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Findings</h3>
 <ul>
 <li><strong>Gray and White Matter:</strong> No acute infarct, mass, or significant cortical atrophy.</li>
 <li><strong>Ventricular System and CSF Spaces:</strong> Normal in size and configuration without evidence of hydrocephalus or midline shift.</li>
 <li><strong>Basal Ganglia and Thalami:</strong> No abnormal signal or mass effect.</li>
 <li><strong>Brainstem and Cerebellum:</strong> No focal lesions.</li>
 <li><strong>Vascular Structures:</strong> No evidence of abnormal flow voids or vascular malformations.</li>
 <li><strong>Post-Contrast Imaging:</strong> No abnormal enhancement to suggest neoplasm, infection, or active demyelination.</li>
 <li><strong>Incidental Findings:</strong> Mild chronic small vessel ischemic changes within the periventricular white matter, consistent with the patient’s age and vascular risk factors.</li>
 </ul>
</div>
"""
* section[findings].entry[0] = Reference(ImFinding-example)
* section[findings].entry[+] = Reference(ImKeyImagesSelection-example)

// Impression Section
* section[impression].title = "Impressions"
* section[impression].code = $loinc#19005-8 "Impression"
* section[impression].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Impression</h3>
 <ol>
 <li>No acute intracranial pathology identified.</li>
 <li>No evidence of mass, hemorrhage, or demyelinating disease.</li>
 <li>Mild chronic small vessel ischemic changes, likely secondary to hypertension and diabetes.</li>
 <li>Consider clinical correlation for non-structural causes of headaches and visual disturbances. Neurology follow-up recommended.</li>
 </ol>
</div>
"""
* section[impression].entry[0] = Reference(ImImpression-example)
* section[impression].entry[+] = Reference(ImKeyImagesSelection-example)

// Recommendation Section
* section[recommendation].title = "Recommendations"
* section[recommendation].code = $loinc#18783-1 "Recommendation"
* section[recommendation].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Communication</h3>
 <ul>
 <li><strong>Critical findings:</strong> None.</li>
 <li>Routine results conveyed to the referring physician, Dr. John Doe, via electronic medical record at <strong>[TIME]</strong> on <strong>[DATE]</strong>.</li>
 <li>No urgent follow-up required. The patient will be advised to follow up with their neurologist for further management.</li>
 </ul>
</div>
"""
* section[recommendation].entry[0] = Reference(ImRecommendedCarePlan-example)

// Communication Section
* section[communication].title = "Communications"
* section[communication].code = $loinc#18783-1 "Communication"
* section[communication].text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Communication</h3>
 <ul>
 <li><strong>Critical findings:</strong> None.</li>
 <li>Routine results conveyed to the referring physician, Dr. John Doe, via electronic medical record at 17:50 on 10/10.</li>
 <li>No urgent follow-up required. The patient will be advised to follow up with their neurologist for further management.</li>
 </ul>
</div>
"""
// TBD communication resource reference if needed
//* section[communication].entry[0] = Reference(ImCommunication-example)