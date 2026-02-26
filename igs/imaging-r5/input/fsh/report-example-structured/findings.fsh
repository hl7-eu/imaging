RuleSet: WMSIObservation( obsCode, obsDisplay, code, display, bodyCode, bodyDisplay ) 
* status = #final
* effectiveDateTime = "2023-06-01"
* code = $loinc#{obsCode} "{obsDisplay}"
* bodySite = $loinc#{bodyCode} "{bodyDisplay}"
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
* valueCodeableConcept = $loinc#{code} "{display}"
* derivedFrom.reference = "urn:uuid:11111111-2222-4333-8444-00000000000c"

Instance: WMSIImage
//R4InstanceOf: Media
//R4Title: "DocumentReference: structured report WMSI image"
InstanceOf: DocumentReference
Title: "Media: structured report WMSI image"
Description: "Shows the WMSI graphs."
Usage: #example

//R4* status = #completed
* status = #current
* subject = Reference( PatientStructuredReport )
//R4* type = http://terminology.hl7.org/CodeSystem/media-type#image 
//R4* content
* content.attachment
  // * contentType = #image/png
  * id = "ig-loader-structured-wmsi.drawio.png"

Instance: RestWmsi01
InstanceOf: Observation
Title: "Observation: WMSI basal anterior at rest - hypokinetic"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA9283-8 , [[Hypokinetic]] , 18121-4 , [[Left ventricular basal anterior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi02
InstanceOf: Observation
Title: "Observation: WMSI basal anterior septum at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18122-2 , [[Left ventricular basal anterior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi03
InstanceOf: Observation
Title: "Observation: WMSI basal inferior septum at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78192-2 , [[Heart ventricle Left basal inferior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi04
InstanceOf: Observation
Title: "Observation: WMSI basal inferior at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18123-0 , [[Left ventricular basal inferior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi05
InstanceOf: Observation
Title: "Observation: WMSI basal inferior lateral at rest - hypokinetic"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA9283-8 , [[Hypokinetic]] , 78193-0 , [[Heart ventricle Left basal inferior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi06
InstanceOf: Observation
Title: "Observation: WMSI basal anterior lateral at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78194-8 , [[Heart.ventricle.left.basal anterior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi07
InstanceOf: Observation
Title: "Observation: WMSI mid anterior at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18129-7 , [[Left ventricular mid anterior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi08
InstanceOf: Observation
Title: "Observation: WMSI mid anterior septum at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18130-5 , [[Left ventricular mid anterior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi09
InstanceOf: Observation
Title: "Observation: WMSI mid inferior septum at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78195-5 , [[Heart ventricle Left mid inferior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi10
InstanceOf: Observation
Title: "Observation: WMSI mid inferior at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18131-3 , [[Left ventricular mid inferior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi11
InstanceOf: Observation
Title: "Observation: WMSI mid inferior lateral at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78196-3 , [[Heart ventricle Left mid inferior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi12
InstanceOf: Observation
Title: "Observation: WMSI mid anterior lateral at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78197-1 , [[Heart ventricle Left mid anterior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi13
InstanceOf: Observation
Title: "Observation: WMSI apical anterior at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18119-8 , [[Left ventricular apical anterior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi14
InstanceOf: Observation
Title: "Observation: WMSI apical septum at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18120-6 , [[Left ventricular apical septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi15
InstanceOf: Observation
Title: "Observation: WMSI apical inferior at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18127-1 , [[Left ventricular inferior apical Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi16
InstanceOf: Observation
Title: "Observation: WMSI apical lateral at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18128-9 , [[Left ventricular lateral apical Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: RestWmsi17
InstanceOf: Observation
Title: "Observation: WMSI apex at rest - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39886-7 , [[NM Heart First pass and Wall motion at rest and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78198-9 , [[Heart ventricle Left apex Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

////// STRESS //////////
Instance: StressWmsi01
InstanceOf: Observation
Title: "Observation: WMSI basal anterior under stress - hypokinetic"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA9283-8 , [[Hypokinetic]] , 18121-4 , [[Left ventricular basal anterior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi02
InstanceOf: Observation
Title: "Observation: WMSI basal anterior septum under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18122-2 , [[Left ventricular basal anterior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi03
InstanceOf: Observation
Title: "Observation: WMSI basal inferior septum under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78192-2 , [[Heart ventricle Left basal inferior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi04
InstanceOf: Observation
Title: "Observation: WMSI basal inferior under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18123-0 , [[Left ventricular basal inferior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi05
InstanceOf: Observation
Title: "Observation: WMSI basal inferior lateral under stress - mildly hypokinetic"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA9282-0 , [[Mildly hypokinetic]] , 78193-0 , [[Heart ventricle Left basal inferior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi06
InstanceOf: Observation
Title: "Observation: WMSI basal anterior lateral under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78194-8 , [[Heart.ventricle.left.basal anterior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi07
InstanceOf: Observation
Title: "Observation: WMSI mid anterior under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18129-7 , [[Left ventricular mid anterior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi08
InstanceOf: Observation
Title: "Observation: WMSI mid anterior septum under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18130-5 , [[Left ventricular mid anterior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi09
InstanceOf: Observation
Title: "Observation: WMSI mid inferior septum under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78195-5 , [[Heart ventricle Left mid inferior septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi10
InstanceOf: Observation
Title: "Observation: WMSI mid inferior under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18131-3 , [[Left ventricular mid inferior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi11
InstanceOf: Observation
Title: "Observation: WMSI mid inferior lateral under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78196-3 , [[Heart ventricle Left mid inferior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi12
InstanceOf: Observation
Title: "Observation: WMSI mid anterior lateral under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78197-1 , [[Heart ventricle Left mid anterior lateral Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi13
InstanceOf: Observation
Title: "Observation: WMSI apical anterior under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18119-8 , [[Left ventricular apical anterior Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi14
InstanceOf: Observation
Title: "Observation: WMSI apical septum under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18120-6 , [[Left ventricular apical septum Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi15
InstanceOf: Observation
Title: "Observation: WMSI apical inferior under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18127-1 , [[Left ventricular inferior apical Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi16
InstanceOf: Observation
Title: "Observation: WMSI apical lateral under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 18128-9 , [[Left ventricular lateral apical Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"

Instance: StressWmsi17
InstanceOf: Observation
Title: "Observation: WMSI apex under stress - normal"
Description: "WMSI measurement."
Usage: #example
* insert WMSIObservation( 39888-3 , [[NM Heart First pass and Wall motion W stress and W radionuclide IV]] , LA24346-1 , [[Normal or hyperkinetic]] , 78198-9 , [[Heart ventricle Left apex Segmental wall motion by US]] )
* performer.reference = "urn:uuid:11111111-2222-4333-8444-000000000006"
