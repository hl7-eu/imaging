### Missing Data

This page provides general rules for handling missing data. Not all of these rules apply to this version of the guide.

The content of this page is adapted from the [HL7 International Patient Summary Implementation Guide (IPS)](https://hl7.org/fhir/uv/ips/).


#### Optional Data Elements (cardinality of 0..1 or 0..\*)

If a content creator does not have data to be included in the resources, the data element is omitted.

Note: a content creator may have no data to be included in the resources, either because there are no data, the data cannot be shared, or the available data are not pertinent within the scope of the context of use.

#### Required Data Elements (cardinality of 1..1 or 1..\*)

If a content creator does not have data to be included in the resources, the reason for the absence SHALL be specified as follows:

1.  For _non-coded_ data elements, use the [Data Absent Reason Extension](http://hl7.org/fhir/R4/extension-data-absent-reason.html) in the data type. 
    Example: Patient resource where the birthDate is not known (note that since birthDate is a date primitive datatype, in JSON the \_birthDate sibling property is used for the extension). Other required properties of Patient resource are omitted (shown by ...) in the simplified example below.

    ```
    {
      "resourceType" : "Patient",
      ...
      "_birthDate": {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
          }
        ]
      },
      ...
    }
    ```

    Example: Procedure resource where the performed value is not known. The performed[x] is a choice type, although any performed[x] choice element can be used to include the data absent reason extension, in this case performedDateTime is Must Support and hence a good choice (note that performedDateTime is a dateTime primitive datatype, in JSON the \_performedDateTime sibling property is used for the extension). Other required properties of Procedure resource are omitted (shown by ...) in the simplified example below.

    ```
    {
      "resourceType" : "Procedure",
      ...
      "_performedDateTime": {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
          }
        ]
      },
      ...
    }
    ```

1.  For _coded_ data elements:
    - _example_, _preferred_, or _extensible_ binding strengths (CodeableConcept datatypes):
      - if the source system has text but no coded data, only the text element is used.
      - if there is neither text nor a code representing actual (i.e., non-exceptional) concepts:
        - use the appropriate exceptional concept code from the element's binding value set, if available; or
        - use the appropriate concept code from the [Data Absent Reason Code System](http://hl7.org/fhir/R4/valueset-data-absent-reason.html).
    - _required_ binding strength (CodeableConcept or code datatypes):
      - use the appropriate exceptional concept code from the element's binding value set

    Example: Observation Results - Laboratory/Pathology resource where the code is not allowed to be shared (e.g. suppressed), the code element contains the data-absent-reason extension. Other required properties of Observation resource are omitted (shown by ...) in the simplified example below.

    ```
    {
      "resourceType" : "Observation",
      ...
      "code": {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/data-absent-reason",
            "code" : "masked"
          }
        ]
      },
      ...
    }
    ```

#### Indicative Date Information: Period of Life Extension

When only indicative temporal information is known (e.g., "during adolescence"), the [**period of life extension**](https://hl7.eu/fhir/extensions/StructureDefinition-periods-of-life.html) can be used to convey this information.

For elements with multiple datatype choices (`[x]`), `dateTime` SHOULD be used as the preferred datatype when representing date/time information.

Example fragment (Immunization): exact occurrence date is unknown, but the period of life is known.

```
{
  "resourceType": "Immunization",
  ...
  "_occurrenceDateTime": {
    "extension": [
      {
        "url": "http://hl7.eu/fhir/base/StructureDefinition/periods-of-life",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "263659003",
              "display": "Adolescence"
            }
          ]
        }
      }
    ]
  },
  ...
}
```
