---
name: search-related-igs
description: 'Find and verify Implementation Guide content related to a Jira ticket or requirement across ig-src and preprocessed/rendered IGs (igs/imaging-r4 and igs/imaging-r5). Use when preparing ticket resolutions, validating implementation evidence, or tracing where a concept appears in source vs generated outputs.'
argument-hint: 'FHIR-XXXXX or keyword phrase (for example: FHIR-56306 "IHE MADO")'
---

# Search Related IGs

Locate ticket-relevant specification content across source templates and generated IG outputs, then produce a traceable evidence set you can reuse in governance proposals, implementation notes, and review discussions.

This skill is workspace-scoped for the HL7 EU Imaging repository and assumes these directories exist:
- `ig-src/`
- `igs/imaging-r4/`
- `igs/imaging-r5/`
- `jira/`

Related IGs to use as canonical external evidence sources:
- `https://build.fhir.org/ig/hl7-eu/base/`
- `https://build.fhir.org/ig/hl7-eu/base-r5/`
- `https://build.fhir.org/ig/hl7-eu/eps/`
- `https://build.fhir.org/ig/hl7-eu/extensions/`
- `https://build.fhir.org/ig/hl7-eu/laboratory/`
- `https://build.fhir.org/ig/hl7-eu/mpd/`
- `https://build.fhir.org/ig/hl7-eu/mpd-r5/`
- `https://build.fhir.org/ig/IHE/RAD.MADO/`
- `https://build.fhir.org/ig/euridice-org/eu-health-data-api/en/`

## When To Use

- You are preparing a Jira resolution and need concrete evidence from the IG.
- You need to map a ticket request to exact source and rendered files.
- You need to confirm whether a requested change is already implemented in R4 and R5 outputs.
- You need to collect links/snippets for workgroup governance review.

## Inputs

- Primary argument: ticket key (`FHIR-XXXXX`) or plain query text.
- Optional terms from ticket content:
  - Summary terms
  - Resource names (for example `ImagingStudy`, `DiagnosticReport`)
  - Section labels (for example `Use Cases`, `Design Considerations`)
  - External references (for example `IHE MADO`, `EU Imaging Manifest`)
- Dependency-derived IG URLs discovered from project configuration (see Procedure step 2).

## Procedure

### 1. Build Search Terms

If input is a ticket key:
1. Read `jira/open/FHIR-XXXXX/FHIR-XXXXX.md` first.
2. If not found, read `jira/closed/FHIR-XXXXX/FHIR-XXXXX.md`.
3. Extract high-signal terms from:
   - `Summary`
   - `Description`
   - metadata fields like `Related section`, `Related Artifact`, `Grouping`

If input is free text:
1. Normalize into 3-8 focused search terms.
2. Include likely variants and abbreviations (for example `MADO`, `Manifest`, `IHE`).

### 2. Discover Dependency IGs

Before running content searches, discover additional related IGs from dependency declarations.

Dependency discovery sources (when present):
1. `sushi-config.yaml`
2. `ig-src/sushi-config.liquid.yaml`
3. `igs/imaging-r4/sushi-config.yaml`
4. `igs/imaging-r5/sushi-config.yaml`
5. `ig.ini` and `ig-src/ig.liquid.ini`

Normalize discovered dependencies to canonical IG URLs when possible:
- Prefer the published/build URL if explicitly available.
- If dependency is a package id only, keep the package id and mark URL as unresolved.

Add discovered dependency IG URLs to the external related IG set for the current run.

### 3. Search Source and Generated IGs

Search in this order:
1. `ig-src/input/` and `ig-src/ig-template/` (authoring source)
2. `igs/imaging-r4/input/` and `igs/imaging-r4/output/`
3. `igs/imaging-r5/input/` and `igs/imaging-r5/output/`
4. Related external IGs listed above (build.fhir.org)
5. Related IGs discovered from dependencies

Preferred search strategy:
- Start with exact term search.
- Expand with alternates/synonyms only if no hits.
- Prioritize pagecontent, markdown, liquid templates, and generated HTML/markdown artifacts.
- For external IGs, prioritize page sections that define scope, cross-IG boundaries, profiles, value sets, and implementation guidance.
- For external IG pages, assume each `.html` has a corresponding `.md` page and prefer the `.md` form for AI analysis.
- If both are available, cite `.md` as primary evidence and keep `.html` only as a secondary reference.

### 4. Classify Match Type

For each hit, classify into one of:
- `Source template` (under `ig-src/`)
- `Preprocessed input` (under `igs/imaging-r4/input/` or `igs/imaging-r5/input/`)
- `Rendered output` (under `igs/imaging-r4/output/` or `igs/imaging-r5/output/`)
- `Ticket artifact` (under `jira/`)
- `Related external IG` (one of the configured build.fhir.org IG URLs)

### 5. Establish Evidence Traceability

For each meaningful finding, capture:
- Path
- Short snippet or sentence showing relevance
- Version coverage:
  - `R4 only`
  - `R5 only`
  - `Both R4 and R5`
- Evidence intent:
  - `Already implemented`
  - `Partially implemented`
  - `Not found`
- External IG provenance when applicable:
  - Exact IG base URL
  - Relative page path
  - Source of IG inclusion: `canonical-list` or `dependency`
  - Preferred content form: `md` (and optional paired `html` reference)

### 6. Decision Logic

Use this branching to determine outcome:

- If found in `ig-src` and both rendered outputs:
  - classify as `Implemented across source + R4/R5 outputs`.
- If found in `ig-src` but missing in one rendered output:
  - classify as `Preprocess/render parity gap`.
- If found only in rendered output but not in source:
  - classify as `Generated-only artifact; verify source ownership`.
- If found in related external IGs but not in local source/output:
  - classify as `External precedent only; local implementation missing`.
- If not found anywhere:
  - classify as `No implementation evidence found` and recommend explicit spec update.

### 7. Produce a Compact Evidence Report

Return a concise report with:
- Search terms used
- Dependency IG discovery summary (resolved URLs and unresolved package ids)
- Top matched files grouped by match type
- Top matched related IG pages grouped by IG URL
- R4/R5 coverage summary
- Final classification (`implemented`, `partial`, `missing`)
- Suggested next action for ticket disposition

## Output Template

```markdown
## Related IG Search Result

- Input: FHIR-XXXXX / <query>
- Terms: term1, term2, term3
- Classification: Implemented across source + R4/R5 outputs

### Source Template Hits
- path: reason/snippet

### R4 Hits
- path: reason/snippet

### R5 Hits
- path: reason/snippet

### Gaps
- Missing in R4 output: <path or concept>

### Related External IG Hits
- <IG base URL><relative-page>: reason/snippet
- Prefer format: `<relative-page>.md` (paired `<relative-page>.html` optional)

### Dependency IG Discovery
- Resolved URL: <url> (from <config-file>)
- Unresolved package id: <package-id> (from <config-file>)

### Recommendation
- Use Disposition A/B/C because ...
```

## Completion Checks

- At least one search was run in each scope: source, R4, R5.
- At least one related external IG URL was checked (or explicitly documented as no hit).
- Dependency declarations were checked in available config files and findings were documented.
- For external IG evidence, `.md` pages were used when available (with `.html` only as secondary/contextual reference).
- Findings include explicit file paths, not only summaries.
- Coverage statement clearly says `R4`, `R5`, or `both`.
- Outcome is classified as implemented, partial, or missing.
- Result includes a clear next action for governance/ticket resolution.

## Suggested Invocation Prompts

- "Search related IGs for FHIR-56306 and summarize source vs R4/R5 evidence."
- "Find where IHE MADO relationship text appears in ig-src, imaging-r4, and imaging-r5."
- "For FHIR-56317, collect evidence across source templates and rendered outputs and classify implementation status."
