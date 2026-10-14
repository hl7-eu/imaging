{% raw %}{% include variable-definitions.md %}{% endraw %}
{% raw %}{% include profile-references.md %}{% endraw %}

{% raw %}{% include key-image-representation.md %}{% endraw %}

{% if isR4 %}
## Required Imaging Study Reference

The profile SHALL contain the `derivedFrom[study]` slice exactly once. The slice SHALL reference the `ImagingStudyEuImaging` profile:

* `extension[derivedFrom][study].value[x]` SHALL be a reference to `ImagingStudyEuImaging`.

## Performer Requirements

When performer information is present, the profile SHALL distinguish it using the following slices:

* `performer[pracRole]` MAY occur once. When present, its `function` SHALL be fixed to [`PRF` (Performer)](http://hl7.org/fhir/ValueSet/series-performer-function#PRF), and its `actor` SHALL reference [[[EuPractitionerRole]]].
* `performer[device]` MAY occur once. When present, its `function` SHALL be fixed to [`DEV` (Device)](http://hl7.org/fhir/ValueSet/series-performer-function#DEV), and its `actor` SHALL reference [[[DeviceEuImaging]]].

These slices and their function-to-actor correlation are enforced in R5. R4 retains the aggregate cross-version performer constraints until the required publisher and validator support is available.

{% raw %}{% include imaging-selection-cross-version-worknote.md %}{% endraw %}
{% endif %}