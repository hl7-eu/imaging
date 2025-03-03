Profile: ImRecommendedCarePlan
Parent: CarePlan
Id: im-recommended-careplan
Title: "Recommended CarePlan"
Description: "Recommended care plan for the patient based on the imaging study. 
Contains the narrative containing the plan including proposals, goals, and order requests for monitoring, tracking, or improving the condition of the patient. In the future it is expected that the care plan could be provided in a structured and coded format."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity
* status MS
* intent MS
* title MS
* description MS

* subject MS
* subject only Reference(ImPatient)

* created MS

* contributor MS
* contributor only Reference(ImPractitionerRole)

