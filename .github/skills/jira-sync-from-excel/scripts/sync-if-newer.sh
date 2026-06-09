#!/bin/bash
# Jira Sync from Excel - Conditional sync using newest Excel file in jira/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
JIRA_DIR="$REPO_ROOT/jira"
REPO_SYNC_SCRIPT="$JIRA_DIR/sync-jira-tickets.mjs"
FORCE_SYNC=false

for arg in "$@"; do
    if [[ "$arg" == "--force" ]]; then
        FORCE_SYNC=true
    fi
done

if [[ ! -d "$JIRA_DIR" ]]; then
    echo "ERROR: jira directory not found: $JIRA_DIR"
    exit 1
fi

if [[ ! -f "$REPO_SYNC_SCRIPT" ]]; then
    echo "ERROR: repository sync script not found: $REPO_SYNC_SCRIPT"
    exit 1
fi

EXCEL_FILES=()
while IFS= read -r file; do
    EXCEL_FILES+=("$file")
done < <(find "$JIRA_DIR" -maxdepth 1 -type f -name "*.xlsx" -printf '%T@ %p\n' | sort -rn | awk '{ $1=""; sub(/^ /, ""); print }')

if [[ ${#EXCEL_FILES[@]} -eq 0 ]]; then
    echo "ERROR: No Excel files found in $JIRA_DIR"
    exit 1
fi

EXCEL_FILE="${EXCEL_FILES[0]}"
if [[ ${#EXCEL_FILES[@]} -gt 1 ]]; then
    echo "WARNING: Found ${#EXCEL_FILES[@]} Excel files in jira/:"
    for file in "${EXCEL_FILES[@]}"; do
        echo "  - $(basename "$file")"
    done
    echo "Using most recent: $(basename "$EXCEL_FILE")"
    echo ""
fi

if ! command -v node >/dev/null 2>&1; then
    echo "ERROR: Node.js is not installed"
    exit 1
fi

EXCEL_MTIME=$(stat -c %Y "$EXCEL_FILE" 2>/dev/null || stat -f %m "$EXCEL_FILE" 2>/dev/null)
EXCEL_DATE=$(stat -c '%y' "$EXCEL_FILE" 2>/dev/null | cut -d. -f1 || stat -f '%Sm -t %Y-%m-%d\ %H:%M:%S' "$EXCEL_FILE" 2>/dev/null)

echo "Excel file: $EXCEL_FILE"
echo "Excel modification time: $EXCEL_DATE"

LATEST_OUTPUT_MTIME=0
LATEST_OUTPUT_PATH=""

for state_dir in "$JIRA_DIR/open" "$JIRA_DIR/closed" "$JIRA_DIR/active"; do
    for ticket_dir in "$state_dir"/FHIR-*; do
        if [[ ! -d "$ticket_dir" ]]; then
            continue
        fi

        ticket_key="$(basename "$ticket_dir")"
        ticket_file="$ticket_dir/$ticket_key.md"

        if [[ ! -f "$ticket_file" ]]; then
            continue
        fi

        FILE_MTIME=$(stat -c %Y "$ticket_file" 2>/dev/null || stat -f %m "$ticket_file" 2>/dev/null)
        if [[ $FILE_MTIME -gt $LATEST_OUTPUT_MTIME ]]; then
            LATEST_OUTPUT_MTIME=$FILE_MTIME
            LATEST_OUTPUT_PATH="$ticket_file"
        fi
    done
done

if [[ -n "$LATEST_OUTPUT_PATH" ]]; then
    LATEST_OUTPUT_DATE=$(stat -c '%y' "$LATEST_OUTPUT_PATH" 2>/dev/null | cut -d. -f1 || stat -f '%Sm -t %Y-%m-%d\ %H:%M:%S' "$LATEST_OUTPUT_PATH" 2>/dev/null)
    echo "Latest synced markdown: $LATEST_OUTPUT_PATH"
    echo "Latest synced markdown time: $LATEST_OUTPUT_DATE"
else
    echo "Latest synced markdown: none found"
fi

if [[ $FORCE_SYNC == true ]]; then
    SHOULD_SYNC=true
    echo "Force sync enabled: YES - syncing..."
elif [[ $LATEST_OUTPUT_MTIME -eq 0 ]]; then
    SHOULD_SYNC=true
    echo "No existing synced markdown found - syncing to create it..."
elif [[ $EXCEL_MTIME -gt $LATEST_OUTPUT_MTIME ]]; then
    SHOULD_SYNC=true
    echo "Excel is newer than synced markdown: YES - syncing..."
else
    SHOULD_SYNC=false
    echo "Excel newer than synced markdown: NO - skipping sync"
fi

if [[ $SHOULD_SYNC == true ]]; then
    echo ""
    node "$REPO_SYNC_SCRIPT" --excel "$EXCEL_FILE" --out "$JIRA_DIR" --prune
    echo ""
    echo "Jira sync completed successfully"
else
    echo ""
    echo "No updates needed - ticket files are already current"
fi
