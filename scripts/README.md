
# XtEHR scripts

## Scope

This directory contains a set of scripts used to manage the mapping to XtEHR and the derivative assets such as:
* ConceptMaps
* ConceptMap intro's
* Obligations
* Narrative requirements in Composition.

## Update XtEHR mapping

The XtEHR source files are stored in XtEHR-models. This section explains the process to generate the input spreadsheet for mapping

### Download and extract logical model

Updating these files is done using the following process.

The published EHDS Logical Information Models are downloaded as a FHIR package
and the base StructureDefinitions (excluding the `*Obligations` profiles) are
extracted into `XtEHR-models`. From the `scripts` directory run:

> ./dowloadXtEhr.sh

This downloads `https://www.xt-ehr.eu/fhir/models/1.0.0/package.tgz` (EHDS
Logical Information Models v1.0.0) and refreshes the model files in
`XtEHR-models`.

To pull a different published release, change the version in the
`https://www.xt-ehr.eu/fhir/models/<version>/package.tgz` URL in
`dowloadXtEhr.sh`.

### Create xtehr-model.csv file

In the `scripts` directory run:
> node parseLogicalModels.js XtEHR-models xtehr-model.csv

This will store the data of the source model in xtehr-model.csv.

The file starts with a header row and has the following columns:
`Resource; Field; Cardinality; Definition; Type; Binding; Short; Producer Obligation; Consumer Obligation`.
The two obligation columns are populated from the published `*Obligations`
profiles (downloaded by `dowloadXtEhr.sh` into `XtEHR-models/obligations/`), so
each element carries its producer/consumer obligations (e.g.
`SHALL:able-to-populate` / `SHOULD:process`) directly in the spreadsheet source.

### Edit mapping

The content of `xtehr-mode.csv` is copied into a [Google spreadsheet](https://docs.google.com/spreadsheets/d/1OFkLP0XK-GQTVPRzXvlZX_Ix0Hi_eE-eHhDmYu4Vc-8/edit?usp=sharing) (authorization is required and can be requested). If this an update, copy it into a new tab and align the existing content with the new model, remove the old tab.
This is the master file for the mapping and is read when generating the result files.

## Update the mapping related fields in the IG

Edit the mappings defined in the Google spreadsheet.

First download the Google spreadsheet as a tab-separated-file (.tsv). This can be done by going to File > Download > Tab-separated values (.tsv) and saving it as `xtehr-model-mapping.tsv`.

### Run script

Run `xtehr-mapping.sh`, which will read the `xtehr-mode-mapping.tsv` file and generate the files in the input directory.

> ./xtehr-mapping.sh

*Note*: The script generates Obligations files, which will no longer be required by this IG, but still provide the functionality of validating FHIR compliance of the mapped paths.

#### Xt-EHR obligation columns

Before generating, `xtehr-mapping.sh` runs `injectObligationsIntoTsv.js`, which
inserts two columns into `xtehr-model-mapping.tsv` between `Xt-EHR source` and
`R5 Mapped Resource`:

* `Xt-EHR Producer Obligation`
* `Xt-EHR Consumer Obligation`

These are populated per element from the published `*Obligations` profiles
(in `XtEHR-models/obligations/`), grouped by actor. The step is idempotent (it
skips if the columns already exist). Because the Google spreadsheet is the master
source, add these two columns to the spreadsheet as well if you want them to
survive the next `.tsv` download; otherwise they are re-injected locally on each
`xtehr-mapping.sh` run.

### Test mapping

Run `sushi` to check the mapping.

> sushi .

Note: The script generates Obligations files, which will no longer be required by this IG, but still provide the functionality of validating FHIR compliance of the mapped paths.

## Obligations (MS ⇒ obligation convention)

This IG follows an **MS ⇒ obligation** convention (FHIR-56773): every Must-Support (MS) element
carries an obligation. Where the Xt-EHR (EHDS) logical model defines an obligation for the mapped
source element, that obligation is used; otherwise the IG defines its own using codes from the
[FHIR obligation code system](https://hl7.org/fhir/extensions/CodeSystem-obligation.html). Every
mandatory (`1..1`) element carries a `SHALL:populate` obligation. Obligations are **not reduced**
below the level defined by the Xt-EHR model.

Obligations are stored in dedicated `<Resource>ObligationEuImaging` profiles, generated from
`xtehr-model-mapping.tsv` by `generateDataBasedOnModel.js`. When several source elements map to the
same target element, the **strongest** obligation applies (`SHALL` > `SHOULD` > `MAY`).

### Obligations table + consistency check

`updateEuImagingObligations.js` builds `eu-imaging-obligations.csv` — all fields of all EU Imaging
profiles with their EHDS / R5 / R4 obligations, MS flag, cardinality, and the contributing EHDS
source paths. Run:

> node updateEuImagingObligations.js --check

This regenerates the table and reports, against the Xt-EHR mapping:

* `eu-imaging-obligations-mismatches.csv` — **missing EHDS-sourced obligations** and
  **level-reducing overrides** (IG obligation weaker than EHDS).
* `eu-imaging-obligations-gaps.csv` — MS fields without an obligation, and mandatory `1..1` fields
  not at `SHALL:populate`.

With `--check` the process exits non-zero when mismatches exist. See the
`obligation-consistency-check` skill for details.
