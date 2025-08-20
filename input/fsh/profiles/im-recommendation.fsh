Profile: ImRecommendation
Parent: $EuServiceRequest
Title: "ServiceRequest: Recommendation"
Description: "Recommendations made in the context of an Imaging Report, encodeded as a ServiceRequest"

* insert SetFmmAndStatusRule( 1, draft )

* intent from RecommendationServiceRequestIntentVS (required)

* reason only CodeableReference(ImFinding or $EuCondition)

// copied from IHE IDR
ValueSet: RecommendationServiceRequestIntentVS
Id: recommendation-servicerequest-intent-vs
Title: "Recommendation Imaging ServiceRequest intent Value Set"
Description: "Codes representing the recommendation intent for a ServiceRequest."
* $FHIRIntent#plan "Plan"
* $FHIRIntent#proposal "Proposal"