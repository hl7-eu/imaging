
{% raw %}{% include fsh-link-references.md %}{% endraw %}
{% raw %}{% include variable-definitions.md %}{% endraw %}
{% if isR4 %}
TODO<!--  { include dependency-table.xhtml } -->
{% endif %}
{% if isR5 %}
This page lists external dependencies and global profiles used by this guide.

### Dependencies

{% raw %}{% include dependency-table.xhtml %}{% endraw %}


### Global Profiles

{% raw %}{% include globals-table.xhtml %}{% endraw %}
{% endif %}