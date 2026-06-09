---
name: jira-sync-from-excel
description: 'Synchronize Jira ticket markdown subdirectories from the newest Excel file in jira/. Updates existing ticket docs and creates new ones in jira/open, jira/closed, and jira/active (from ActiveTickets.md) by running the repository sync script. Use after updating Jira Excel exports to refresh local ticket markdown.'
argument-hint: '[--force] optional flag to skip modification-time check'
---

# Jira Sync From Excel

Synchronize Jira ticket markdown files from the newest Excel export in the `jira/` directory.

The skill uses the newest `*.xlsx` file in `jira/`, then runs the repository-maintained sync script to generate or update ticket markdown files under status-based directories:
- `jira/open/`
- `jira/closed/`
- `jira/active/` (for keys listed in `jira/ActiveTickets.md`)

Each ticket is written to a subdirectory named after its key:
- `jira/<state>/FHIR-XXXXX/FHIR-XXXXX.md`

## When To Use
- After downloading a new Jira Excel export into `jira/`.
- To refresh ticket metadata in local markdown files.
- To keep local ticket files organized by status (open, closed) and active focus list.

## Procedure
1. From the repository root, run:

```bash
bash ./.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh
```

2. The script will:
   - Locate all `*.xlsx` files in `jira/`
   - Warn if multiple files are present
   - Select the most recent Excel file
   - Compare the Excel mtime against the most recently generated `jira/open/**/FHIR-*.md`, `jira/closed/**/FHIR-*.md`, or `jira/active/**/FHIR-*.md` file
   - Skip sync if no update is needed
   - Run `node jira/sync-jira-tickets.mjs --excel <file> --out jira --prune` when sync is needed

3. Optional: force sync even if timestamps indicate no changes:

```bash
bash ./.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh --force
```

4. If you are already in `jira/`, the same helper can be run as:

```bash
bash ../.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh
```

## Classification Rules

### Closed
Closed currently matches the repository sync implementation and includes tickets whose Jira **Status** is one of:
- Applied
- Duplicate
- Resolved - No Change
- Resolved - change required
- Deferred

### Open
Any ticket whose Jira **Status** is not in the closed set above is written to `jira/open/`.

### Active
Any ticket key listed in `jira/ActiveTickets.md` is also written to `jira/active/` (if the ticket exists in the Excel export).

## Output Format
Each `FHIR-XXXXX.md` file includes:
- Ticket heading with key and summary
- Optional description section
- Metadata section
- Resolution section
- Optional related ticket section

## Notes
- Requires Node.js.
- Requires the `xlsx` dependency installed under `jira/`.
- Existing ticket directories in the wrong state folder are removed and rewritten by the repository sync script when `--prune` is used.
- Root-level `jira/FHIR-XXXXX` directories are migrated into `jira/open/` or `jira/closed/` when encountered.
- `jira/active/` is pruned to match keys listed in `jira/ActiveTickets.md` that are present in the Excel export.
