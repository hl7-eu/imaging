{% include variable-definitions.md %}

When the resource points to a bodysite it:

* SHALL populate the `bodysite` field.
* when additional information on the body site is known (such as laterality), it SHALL reference a `ImBodyStructure` resource referring to the same body site as is coded in the `bodysite` field.
