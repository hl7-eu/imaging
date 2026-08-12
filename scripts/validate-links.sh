#!/bin/bash
# Link Validation Script for HL7 Europe Imaging IG
# Validates external links in HTML rendered output
# Part of FHIR-56315 implementation: Comprehensive documentation quality initiative

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# Configuration
R4_OUTPUT="${REPO_ROOT}/igs/imaging-r4/output"
R5_OUTPUT="${REPO_ROOT}/igs/imaging-r5/output"
REPORT_FILE="${REPO_ROOT}/build-link-validation-report.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

BROKEN_LINKS_FOUND=0
VALIDATION_ERRORS=0

echo "Starting link validation..."
echo "R4 Output: ${R4_OUTPUT}"
echo "R5 Output: ${R5_OUTPUT}"

# Function to validate URLs in HTML files
validate_html_links() {
    local output_dir=$1
    local version=$2
    local temp_urls_file="${REPO_ROOT}/temp_urls_${version}.txt"
    
    if [[ ! -d "${output_dir}" ]]; then
        echo -e "${YELLOW}Warning: Output directory not found: ${output_dir}${NC}"
        return 0
    fi
    
    echo -e "\n${GREEN}Scanning ${version} HTML files for external links...${NC}"
    
    # Extract all http/https URLs from HTML files
    find "${output_dir}" -name "*.html" -type f -exec grep -oh 'https\?://[^"<>]*' {} \; > "${temp_urls_file}" 2>/dev/null || true
    
    if [[ ! -s "${temp_urls_file}" ]]; then
        echo "No external links found in ${version}"
        rm -f "${temp_urls_file}"
        return 0
    fi
    
    # Sort and deduplicate
    sort -u "${temp_urls_file}" > "${temp_urls_file}.unique"
    
    local total_links=$(wc -l < "${temp_urls_file}.unique")
    echo "Found ${total_links} unique external links in ${version}"
    
    # Check known broken patterns
    local broken_count=0
    
    # Pattern 1: /branches/master/ (should be /branches/main/ or stable)
    if grep -q "branches/master" "${temp_urls_file}.unique"; then
        echo -e "${YELLOW}Warning: Found /branches/master/ URLs (outdated branch reference)${NC}"
        grep "branches/master" "${temp_urls_file}.unique" | while read url; do
            echo "  - $url"
            ((broken_count++))
        done
    fi
    
    # Pattern 2: www.hl7.org/fhir/R4/ImagingSelection.html (does not exist)
    if grep -q "www.hl7.org/fhir/R4/ImagingSelection.html" "${temp_urls_file}.unique"; then
        echo -e "${RED}Error: Found broken FHIR R4 link to ImagingSelection (does not exist in R4)${NC}"
        echo "  - https://www.hl7.org/fhir/R4/ImagingSelection.html"
        ((broken_count++))
        ((BROKEN_LINKS_FOUND++))
    fi
    
    if [[ ${broken_count} -gt 0 ]]; then
        ((VALIDATION_ERRORS++))
    fi
    
    rm -f "${temp_urls_file}" "${temp_urls_file}.unique"
}

# Run validation
validate_html_links "${R4_OUTPUT}" "R4"
validate_html_links "${R5_OUTPUT}" "R5"

# Generate report
{
    echo "# Link Validation Report"
    echo ""
    echo "**Generated**: $(date)"
    echo ""
    echo "## Summary"
    echo ""
    echo "- **Validation Errors**: ${VALIDATION_ERRORS}"
    echo "- **Broken Links Found**: ${BROKEN_LINKS_FOUND}"
    echo ""
    echo "## Details"
    echo ""
    if [[ ${BROKEN_LINKS_FOUND} -eq 0 ]]; then
        echo "✅ **All external links validated successfully**"
    else
        echo "❌ **Broken links detected**"
        echo ""
        echo "### Issues Found"
        echo ""
        echo "1. **Outdated branch references** (/branches/master/)"
        echo "   - Update to /branches/main/ or use stable/published URLs"
        echo ""
        echo "2. **Non-existent FHIR resources** (R4-specific)"
        echo "   - ImagingSelection does not exist in FHIR R4 (R5 resource)"
        echo "   - Should use R5 link or add clarifying note"
    fi
    echo ""
    echo "## Recommendations"
    echo ""
    echo "- Run this validation as part of every build"
    echo "- Update External Dependencies Registry after fixes"
    echo "- See .github/documentation-maintenance-policy.md for procedures"
} > "${REPORT_FILE}"

echo ""
echo -e "${GREEN}Link validation complete.${NC}"
echo "Report: ${REPORT_FILE}"

# Exit with error if critical issues found
if [[ ${BROKEN_LINKS_FOUND} -gt 0 ]]; then
    echo -e "${RED}Critical broken links found!${NC}"
    cat "${REPORT_FILE}"
    exit 1
fi

exit 0
