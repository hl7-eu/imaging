Gestational age is the age (duration) of a pregnancy, usually measured from the first day of the pregnant person's last menstrual period (LMP) and expressed in completed weeks and/or days. It is a key clinical parameter for dating a pregnancy, assessing fetal growth, and interpreting imaging findings during the antenatal period.

This profile is aligned with the equivalent European Patient Summary (EPS) profile. See the current build version of the EPS profile: [Observation: Pregnancy - Gestational Age (EPS)](https://build.fhir.org/ig/hl7-eu/eps/branches/master/StructureDefinition-observation-pregnancy-gestationalAge-eu-eps.html).

The value is bound (required) to the FHIR `units-of-time` value set. In addition, a preferred additional binding points to the `ValueSetGestationalAgeTimeUnitsEuImaging` value set, which lists the UCUM units most commonly used for gestational age: month (`mo`) and week (`wk`).

{% include worknote.html text="Updated for <a href='https://jira.hl7.org/browse/FHIR-59663'>FHIR-59663</a>: the valueQuantity binding uses FHIR units-of-time, with months and weeks as preferred gestational-age units. Examples demonstrate gestational age in weeks and days." %}
