---
name: ticket-implementation-plan
description: 'Create a structured implementation plan from a Jira ticket resolution, or for Technical Correction tickets from the proposed resolution file. Use for ticket execution planning, impact analysis, and actionable task breakdowns before implementation.'
argument-hint: 'FHIR-XXXXX (for example: FHIR-56763)'
---

# Ticket Implementation Plan

Create a practical, developer-ready implementation plan for one Jira ticket in this repository.

The plan is resolution-driven:
- For most tickets, the source of truth is the `## Resolution` section in `jira/FHIR-XXXXX/FHIR-XXXXX.md`.
- For Technical Correction tickets, the source of truth is `jira/FHIR-XXXXX/FHIR-XXXXX-resolution.md` (proposed resolution file) when present.

Output file:
- `jira/FHIR-XXXXX/FHIR-XXXXX-implementation-plan.md`

## When To Use

- A ticket has an agreed resolution and needs execution planning.
- A Technical Correction ticket has a proposed resolution and needs concrete implementation tasks.
- You need consistent planning artifacts for workgroup review and implementation tracking.

## Inputs

- Ticket key: `FHIR-XXXXX`
- Ticket markdown: `jira/FHIR-XXXXX/FHIR-XXXXX.md`
- Optional proposed resolution markdown: `jira/FHIR-XXXXX/FHIR-XXXXX-resolution.md`
- Local source tree (search for impacted files):
  - `ig-src/`
- Current outputs trees (search for output files):
  - `igs/imaging-r4/output/`
  - `igs/imaging-r5/output/`

## Workflow

### Step 1: Load Ticket Context

1. Read `jira/FHIR-XXXXX/FHIR-XXXXX.md`.
2. Extract metadata:
   - `Issue Type`
   - `Status`
   - `Resolution`
   - `Summary`
   - `Related Sections` (or similar fields)
   - `Created`
3. Capture the ticket description and any explicit requested change.

### Step 2: Select Resolution Source (Branching Rule)

Apply this decision logic in order:

1. If `Issue Type` is `Technical Correction` and `jira/FHIR-XXXXX/FHIR-XXXXX-resolution.md` exists:
   - Use the proposed resolution file as primary source.
   - Prefer its `Recommendation`, `Proposal`, `Source Analysis`, and `Verification Checklist` sections.
2. Otherwise:
   - Use `## Resolution` from `jira/FHIR-XXXXX/FHIR-XXXXX.md` as primary source.
3. If neither source provides actionable change details:
   - Produce a plan with an `Open Questions` section listing missing details.
   - Do not invent implementation specifics.

### Step 3: Determine Implementation Eligibility

Classify whether implementation work is required:

- **Implementation required** for resolution/disposition states such as:
  - `Applied`
  - `Persuasive`
  - `Persuasive with Modification`
  - Proposed dispositions that clearly recommend a concrete change
- **No implementation required** for states such as:
  - `Not Persuasive`
  - `Duplicate`
  - `Withdrawn`
  - `Declined`

If no implementation is required, create a short plan file that records:
- Why no code/spec change should occur
- Any follow-up actions (for example, ticket linkage or documentation note)

### Step 4: Map Resolution to Concrete Change Scope

Translate the approved/proposed resolution into explicit change units:

1. Identify change type:
   - Editorial text update
   - Profile or cardinality change
   - Terminology adjustment
   - Link or reference repair
   - Capability statement alignment
2. Locate candidate files by searching the repository for:
   - Exact terms from resolution text
   - Related section markers and profile names
   - Existing canonical URLs or identifiers
3. Confirm candidate files exist before listing them in the plan.
4. Include both authoring and generated-output implications:
   - Source update location (usually under `ig-src/` or `input/`)
   - Regeneration implications (`igs/imaging-r4/`, `igs/imaging-r5/`)

### Step 5: Build the Structured Plan

Write `jira/FHIR-XXXXX/FHIR-XXXXX-implementation-plan.md` using this format.

```markdown
# Implementation Plan for FHIR-XXXXX

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-XXXXX |
| Issue Type | ... |
| Status | ... |
| Resolution Source | Ticket Resolution \| Proposed Resolution File |
| Resolution/Disposition | ... |
| Summary | ... |

## Resolution Interpretation

{Concise interpretation of what must be implemented. Quote exact resolution language where available.}

## Scope and Impact

### Affected Artifacts
- {Artifact or profile name} — {why impacted}

### Candidate Files
- `path/to/file` — {planned edit}
- `path/to/file` — {planned edit}

### Impact Notes
- R4 impact: {None | Summary}
- R5 impact: {None | Summary}
- Breaking change risk: {Low | Medium | High} with rationale

## Implementation Tasks

1. **{Task title}**
   - File: `path/to/file`
   - Action: {specific change}
   - Acceptance: {what must be true after edit}

2. **{Task title}**
   - File: `path/to/file`
   - Action: {specific change}
   - Acceptance: {what must be true after edit}

## Validation Plan

- [ ] Source files updated in the correct authoring location
- [ ] Preprocess/build completed for both versions
- [ ] Rendered outputs reflect the intended change
- [ ] No unresolved placeholders or broken links introduced
- [ ] Ticket intent is fully covered by implemented edits

## Open Questions

- {Any ambiguities that block implementation; write "None" if clear}
```

### Step 6: Add Repository-Specific Validation Tasks

For implementation-required plans, include execution checks using local build flow:

1. Run preprocessing and verification:
   - `./_preprocessMultiVersion.sh`
   - `./_preProcessAndCheckAll.sh` (when a full validation pass is needed)
2. If the ticket is small/editorial and a faster run is acceptable:
   - `./_genonce.sh`
3. Verify expected changes appear in:
   - `igs/imaging-r4/`
   - `igs/imaging-r5/`

## Quality Criteria

The generated implementation plan is complete only if all are true:

1. Resolution source is explicitly identified and justified.
2. Tasks are file-specific and actionable (no vague "update docs" items).
3. Candidate file paths exist in the repository.
4. Validation includes both source-level and rendered-output checks.
5. Branching outcome is respected:
   - Technical Correction plans prefer `*-resolution.md` when available.
   - Non-implementable resolutions produce a "no-implementation" plan.

## Important Rules

- Do not infer requirements from the original description when it conflicts with the resolution.
- For Technical Correction tickets, prioritize the recommended disposition in `*-resolution.md`.
- Do not invent file paths, profile names, or acceptance criteria.
- Keep tasks atomic: one concrete objective per task.
- If uncertainty remains, capture it under `Open Questions` instead of guessing.

## Suggested Prompts

- `Create an implementation plan for FHIR-56763.`
- `Use the proposed resolution file and generate FHIR-56763 implementation tasks.`
- `Generate a no-implementation plan for FHIR-XXXXX because the resolution is Not Persuasive.`