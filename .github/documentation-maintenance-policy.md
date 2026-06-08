# Documentation Maintenance Policy

## Overview

This policy establishes standards and procedures for maintaining external links and references in the HL7 Europe Imaging Implementation Guide specification. It ensures high-quality, reliable documentation that supports implementers and reduces broken link incidents.

## Policy Scope

- All external hyperlinks in specification documentation (HTML, markdown, FSH, includes)
- References to external standards, IGs, and resources
- Links in both R4 and R5 versions of the specification
- Source files in `ig-src/` and `input/` directories
- Rendered output in `igs/imaging-r4/` and `igs/imaging-r5/`

## Link Categories and Ownership

### Category 1: FHIR Core Resources (High Stability)
- **Links to**: www.hl7.org/fhir/{R4|R5}/{ResourceType}.html
- **Stability**: Very High
- **Verification Frequency**: Annually or when FHIR release notes indicate changes
- **Owner**: HL7 International (not our responsibility; link maintenance automated)
- **Action if Broken**: Report to HL7 and document workaround

### Category 2: External Implementation Guides (Medium Stability)
- **Links to**: build.fhir.org/ig/{organization}/{ig-name}/...
- **Examples**: IHE guides, other SDO IGs
- **Stability**: Medium (depends on IG maintainer)
- **Verification Frequency**: Every 6 months or when updating cross-references
- **Owner**: Designated IG workgroup lead
- **Action if Broken**: Contact IG maintainer; document status and alternative references

### Category 3: Standards & Technical Documentation (Medium-Low Stability)
- **Links to**: External technical specifications, standards documents
- **Stability**: Medium (may move or version)
- **Verification Frequency**: Annually
- **Owner**: Relevant working group or domain expert
- **Action if Broken**: Search for updated location; update link or document deprecation

### Category 4: Draft & Proposed Resources (Low Stability)
- **Links to**: Draft FHIR resources, proposed standards, balloting materials
- **Examples**: ImagingSelection (if draft), proposed extensions
- **Stability**: Low (may change significantly or be withdrawn)
- **Verification Frequency**: With each specification release cycle
- **Owner**: Domain expert or FHIR workgroup liaison
- **Action if Broken/Changed**: Evaluate specification impact; update or remove reference with explanatory note

## Process for Adding External Links

### Pre-Addition Verification
1. Confirm the target resource exists and is stable enough for specification reference
2. Use persistent/canonical URLs when available (avoid branch-specific URLs)
3. For FHIR resources:
   - Use www.hl7.org (not build.fhir.org) for released versions
   - Use build.fhir.org only for published ballots or latest builds when necessary
4. Document link category and expected stability in commit message

### Link Format Standards
- Use persistent URLs (avoid branch-specific URLs like `/branches/master/`)
- For external IGs, use stable build URLs or version-tagged links when available
- Include link text that describes the resource, not just "here" or "link"
- Document URL in External Dependencies Registry at point of addition

### Review Checklist
- [ ] Link target is accessible and returns expected content
- [ ] Link uses stable/persistent URL format
- [ ] Link category identified (FHIR Core, External IG, Standards, Draft)
- [ ] Owner designated if not default
- [ ] URL added to External Dependencies Registry
- [ ] PR reviewer confirms link validity

## Link Verification and Maintenance Workflow

### Automated Link Checking (CI/CD)
- **Frequency**: On every build
- **Scope**: All HTML output links
- **Tools**: markdown-link-check + custom validation
- **Failures**: Build warns on broken links; fails on critical broken links
- **Report**: Link validation report included in build artifacts

### Manual Audit Cycle
- **Frequency**: Quarterly
- **Scope**: All categories
- **Process**:
  1. Run automated link checker against source and output
  2. Categorize findings by link type and stability
  3. Triage: Fix immediately, Schedule for future release, Document limitation
  4. Track resolutions in External Dependencies Registry
  5. Report summary to documentation steward

### Handling Broken Links

1. **Immediate Assessment**:
   - Confirm link is actually broken (check different networks, clear cache)
   - Determine if temporary (server down) vs. permanent (moved/deprecated)

2. **Fix Strategies** (in priority order):
   - Find current/correct URL and update reference
   - Switch to alternative reference (if available)
   - Add explanatory note about resource status (e.g., "proposed for future FHIR version")
   - Remove outdated reference with clarification

3. **Documentation**:
   - Record fix in External Dependencies Registry
   - Update specification version affected
   - Note decision rationale for future reference

4. **Prevention**:
   - Add persistent URL patterns to monitoring
   - Flag draft/proposed resource references for regular review
   - Establish contact with external IG maintainers for advance notice of URL changes

## External Dependencies Registry

**Location**: `external-dependencies-registry.md` in repository root

**Contents**: Inventory of all external links with:
- URL and description
- Link category and stability rating
- Last verified date
- Owner/responsible party
- Known issues or deprecation status
- Migration plan (if applicable)

**Updates**: Automated by CI/CD where possible; manual additions during development

## Documentation Quality Standards

### For Implementers
- Links must resolve to accessible, current resources
- Broken links are documentation defects requiring immediate attention
- External resource references include stability/version information
- Draft or proposed resources clearly marked as such

### For Developers
- All PRs adding external links must pass link validation
- Commit messages include External Dependencies Registry updates
- Link stability considerations noted in code review
- Quarterly audits scheduled and tracked

## Escalation Path

- **Link broken during development**: Fix immediately; report in PR
- **Link broken after release**: Triage, fix in next release if possible; document limitation
- **Systematic link rot detected**: Trigger comprehensive audit; implement improvements
- **External IG unavailable**: Document status; evaluate specification impact; communicate to users

## Governance & Escalation

- **Documentation Steward**: Responsible for policy enforcement and quarterly audit coordination
- **IG Publishing Lead**: Approves policy changes
- **Work Group**: Reviews audit findings and approves major link changes
- **Repository Contributors**: Follow policy when adding or updating external references

---

**Policy Version**: 1.0  
**Effective Date**: 2026-05-08  
**Last Updated**: 2026-05-08  
**Next Review**: 2026-08-08
