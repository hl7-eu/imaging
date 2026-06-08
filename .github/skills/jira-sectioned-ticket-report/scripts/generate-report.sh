#!/bin/bash

# Wrapper script to generate Jira sectioned report
# Usage: bash generate-report.sh [--output jira/jira-ticket-sections.md]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

# Change to project root so relative paths work
cd "$PROJECT_ROOT" || exit 1

# Run the Node.js script with all arguments
node "$SCRIPT_DIR/generate-report.js" "$@"
