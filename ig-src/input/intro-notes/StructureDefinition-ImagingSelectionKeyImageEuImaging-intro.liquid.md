{% raw %}{% include variable-definitions.md %}{% endraw %}
{% raw %}{% include profile-references.md %}{% endraw %}

{% raw %}{% include key-image-representation.md %}{% endraw %}

## Performer Requirements

The profile distinguishes up to two performer entries for a key image:

* `pracRole` (0..1) identifies the practitioner role that selected the key image. Its `function` is fixed to [`PRF` (Performer)](http://hl7.org/fhir/ValueSet/series-performer-function#PRF), and its `actor` references a [[[EuPractitionerRole]]].
* `device` (0..1) identifies the device used for the key image. Its `function` is fixed to [`DEV` (Device)](http://hl7.org/fhir/ValueSet/series-performer-function#DEV), and its `actor` references a [[[DeviceEuImaging]]].

These slices and their function-to-actor correlation are enforced in R5. R4 is intended to apply the equivalent constraints through the cross-version performer extension.

{% if isR4 %}
{% raw %}{% include worknote.html text="The R4 <code>performer</code> extension cannot yet be resliced into practitioner-role and device slices because of a <a href='https://jira.hl7.org/browse/FHIR-57776'>SUSHI tooling issue</a>. The slicing will be added once the tooling issue has been resolved." %}{% endraw %}
{% endif %}