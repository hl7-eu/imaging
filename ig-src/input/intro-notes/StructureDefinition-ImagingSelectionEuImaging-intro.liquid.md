{% raw %}{% include variable-definitions.md %}{% endraw %}
{% raw %}{% include profile-references.md %}{% endraw %}

{% if isR4 %}
## Required Imaging Study Reference

The profile SHALL contain the `derivedFrom[study]` slice exactly once. The slice SHALL reference the `ImagingStudyEuImaging` profile:

* `extension[derivedFrom][study].value[x]` SHALL be a reference to `ImagingStudyEuImaging`.

The `subject` element SHALL reference the applicable EU Patient profile. The study reference identifies the imaging study from which the selection was derived.

{% raw %}{% include imaging-selection-cross-version-worknote.md %}{% endraw %}
{% endif %}
