---
name: jira-sectioned-ticket-report
description: 'Analyze Jira tickets in the jira directory and generate a markdown report grouped by related section, falling back to related artifact fields, with sorted tickets and a fixed cutoff that excludes tickets created before March 30, 2026. Use for governance preparation, backlog review, and status overviews from local jira/FHIR-* markdown files.'
argument-hint: '--cutoff 03/30/2026 --section-by related-section --output jira/jira-ticket-sections.md'
---

# Jira Sectioned Ticket Report

Analyze local Jira ticket markdown files under `jira/FHIR-*` and produce one consolidated markdown report in the `jira/` directory. The report groups tickets into sections from related-section metadata, sorts tickets inside each section, and excludes tickets created before the cutoff date.

Default behavior:
- Cutoff date: March 30, 2026 (fixed)
- Included tickets: `Created >= cutoff`
- Section key: `Related section` (fallback: `Related Artifact`, `Related URL`, `Specification Location`)
- Output file: `jira/jira-ticket-sections.md`

## When To Use

- You need a single, readable ticket digest for workgroup calls.
- You want tickets grouped by the related section metadata, with fallback to related artifact metadata.
- You need to exclude older tickets and focus only on recent submissions.
- You need a repeatable workflow that can be rerun after ticket sync updates.

## Inputs

- Source directory: `jira/`
- Ticket files: `jira/FHIR-*/FHIR-*.md`
- Required ticket fields:
  - `Key`
  - `Summary`
  - `Issue Type`
  - `Status`
  - `Created`
  - `Related section` (preferred)
  - `Related Artifact` or `Related Artifacts` (fallback)

## Procedure

### From Terminal

Run the report generation script from the workspace root:

```bash
cd /path/to/imaging
node .github/skills/jira-sectioned-ticket-report/scripts/generate-report.js
```

Or use the bash wrapper:

```bash
bash .github/skills/jira-sectioned-ticket-report/scripts/generate-report.sh
```

The script will:

1. **Discover ticket files**
   - Scan `jira/FHIR-*` directories
   - Include files matching `FHIR-*.md`
   - Exclude generated resolution files (`*-resolution.md`)

2. **Parse metadata from each ticket file**
   - Read the `## Metadata` section
   - Extract `Key`, `Summary`, `Issue Type`, `Status`, `Created`, `Related section`, `Related Artifact`, and `Related Artifacts`
   - If `Created` is missing or unparseable, place ticket in a data-quality bucket and exclude from main grouped output

3. **Apply date filter**
   - Convert `Created` to a comparable date (supports M/D/YY, M/D/YYYY, ISO formats)
   - Keep ticket only if `Created` is on or after 2026-03-30
   - Exclude tickets before cutoff

4. **Choose section strategy**
   - Section title is selected in this order:
     - `Related section`
     - `Related Artifact`
     - `Related Artifacts`
     - `Related Artififact` (typo-compatible fallback)
     - `Unknown Section` (if all are missing)

5. **Sort tickets**
   - Sort section names alphabetically, with `Unknown Section` last
   - Sort tickets inside each section by:
     - `Created` descending (newest first)
     - then `Key` ascending for deterministic ordering

6. **Generate markdown report in `jira/`**
   - Write report header with generation timestamp, fixed cutoff date, section strategy, and totals
   - Include table of contents listing section names and counts
   - For each section, include a markdown table:
     - Key
     - Summary
     - Status
     - Issue Type
     - Created
     - Proposal
     - Implementation
     - Result
   - Populate companion columns from ticket directory files:
     - `Proposal`: link to `*-resolution.md` / `*proposal*.md` when present
     - `Implementation`: link to `*implementation*.md` when present
     - `Result`: if explicit result file exists use that; otherwise derive from `**Recommended disposition:**` in proposal/resolution file

7. **Add data-quality appendix**
   - List skipped tickets with missing/invalid `Created`
   - List skipped non-matching files if relevant

## Script Files

The skill includes two implementation files:

- [generate-report.js](./scripts/generate-report.js) — Node.js main implementation
  - Parses ticket files
  - Extracts and validates metadata
  - Groups and sorts tickets
  - Generates markdown output

- [generate-report.sh](./scripts/generate-report.sh) — Bash wrapper
  - Simplifies invocation from terminal
  - Handles path resolution
  - Passes arguments to Node.js script

## Output Format

```markdown
# Jira Ticket Sections Report

- Generated: 2026-05-07
- Source: jira/FHIR-*/FHIR-*.md
- Cutoff: 2026-03-30 (inclusive)
- Section strategy: related section -> related artifact fallback
- Included tickets: 42
- Excluded by date: 187
- Excluded for data quality: 3

## Sections
- Composition: Imaging Report (10)
- ValueSet: Imaging Procedure Type (15)
- Unknown Section (5)

## Composition: Imaging Report (10)

| Key | Summary | Status | Issue Type | Created | Path |
|-----|---------|--------|------------|---------|------|
| [FHIR-56772](https://jira.hl7.org/browse/FHIR-56772) | Editorial: ... | Submitted | Technical Correction | 4/30/26 | [proposal](./open/FHIR-56772/FHIR-56772-resolution.md) |  | Pending (recommended: B) |
```

Note: The generated file is the canonical `jira/jira-ticket-sections.md` used by governance workflows and must preserve the same table schema and section structure.

## Decision Points

- Cutoff date is fixed to 2026-03-30 (inclusive).
- Section definition is fixed to metadata fallback order:
  - `Related section`
  - `Related Artifact`
  - `Related Artifacts`
  - `Related Artififact`
  - `Unknown Section`
- Date parsing ambiguity:
  - Prefer `M/D/YY`, fallback to `M/D/YYYY`.
  - Any date that cannot be parsed is excluded from primary output and listed in appendix.

## Completion Checks

- Output file exists in `jira/`.
- Every included ticket has `Created >= cutoff`.
- No `*-resolution.md` files are included as source tickets.
- Every included ticket is assigned to a section using the defined fallback order.
- Section totals add up to the included-ticket total.
- Tickets are sorted correctly inside each section.
- Report includes metadata header and data-quality appendix.

## Suggested Invocation Prompts

- "Generate the Jira sectioned report using related section, with related artifact fallback, and cutoff 03/30/2026."
- "Build jira/jira-ticket-sections.md with fixed cutoff 03/30/2026 and group by related section metadata."
- "Create the Jira report grouped by related section or related artifacts, newest first inside each section."
