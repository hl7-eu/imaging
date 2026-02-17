## Use cases based on actors
A set of actors and use cases has been identified as the minimum functional scope needed to support the EHDS Imaging Report specification. These use cases are shown in the figure below.

The diagram also shows how these use-case actors relate to the system actors described on the [actors-and-transactions.html](actors-and-transactions.html) page. Note that the displayer and processor roles are grouped into a single consumer actor, because user-interface display requirements and constraints are highly implementation-specific. Without a more detailed categorization of system types, no generic obligations can be defined for those roles.

<figure>
  {% include ehds-actors-usecases.svg %}
  <figcaption>Figure: EHDS Imaging Report Functional Use Cases</figcaption>
</figure>
<br clear="all"/>

### Use-cases details

#### Producer use cases
- **Create report:** needs to verify patient and date/time context, use available source data (including DICOM header information when applicable), consider the clinical question/reason, produce the report in the assigned system and make it available to the EHDS ecosystem.

#### Accessor use cases
- **Search reports:** search for reports using patient and report criteria in both patient and healthcare-professional workflows. Most search parameters are shared, but patients are limited to their own studies, while healthcare professionals can search across patients using identification parameters.

#### Processor use cases
- **Extract & process data:** process structured findings, impressions, and other coded data; optionally analyze narrative text (for example registries, AI tools, decision support). Displaying the report on a user interface is not required.

#### Displayer use cases
- **Render static report:** display pre-rendered report formats (for example PDF, HTML).
- **Populate dynamic UI:** extract and present report narrative and coded sections, findings, and measurements in local UI components.
