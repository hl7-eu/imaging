### Body Site and Laterality

When expressing a body site with laterality, use `BodyStructure.includedStructure`:
the body site code goes into `includedStructure.structure` and the laterality
into `includedStructure.laterality`.

#### Qualifier

Additional positional qualifiers (e.g. "upper", "anterior", "superficial") can be
expressed via `includedStructure.qualifier`. Multiple qualifiers may be provided within the same
`includedStructure` entry.

#### Laterality only (structure unknown or not provided)

In some cases only the laterality is relevant or the specific body structure code is not known
and cannot be populated. In these situations, the
[data-absent-reason](http://hl7.org/fhir/StructureDefinition/data-absent-reason)
extension can be applied to `includedStructure.structure` to satisfy the FHIR
cardinality requirement while making clear that the value is absent, allowing
`includedStructure.laterality` to carry the laterality information on its own. 