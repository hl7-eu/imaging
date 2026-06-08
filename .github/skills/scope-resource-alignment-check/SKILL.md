---
name: scope-resource-alignment-check
description: 'Validate that SMART scope declarations in capability statement security sections are aligned with declared resource access requirements, with primary focus on ImagingStudy, Device, and ServiceRequest (FHIR-56748).'
argument-hint: 'Optional: provider|consumer|both, and include-related=true to also check Procedure/Provenance search scopes'
---

# Scope-Resource Alignment Check

Validate that declared scope statements and resource access requirements are aligned in capability statement source files.

## When To Use

- Resolving tickets about scope/resource consistency (for example FHIR-56748)
- Before/after edits to capability statement security descriptions
- During validation before build/release

## Inputs

- Provider source: `ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh`
- Consumer source: `ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh`

## Primary Alignment Rules (FHIR-56748)

For each target resource in `{ImagingStudy, Device, ServiceRequest}`:

1. If resource access is declared via `insert <Resource>Resource(...)` in Provider/Consumer capability statements,
2. Then the corresponding security description scope lists must include:
   - `system/<Resource>.read`
   - `system/<Resource>.search`

A resource is **in sync** only if declarations and scope entries are both present in each file where the resource is declared.

## Related Consistency Rules (Optional)

When `include-related=true`, also report whether `Procedure` and `Provenance` have matching scope entries with declared search expectations (informational warning mode by default).

## Execution Steps

1. Run:

```bash
./scripts/check_scope_resource_alignment.sh
```

2. For related checks, run:

```bash
./scripts/check_scope_resource_alignment.sh --include-related
```

3. Interpret exit code:
- `0`: aligned for the selected checks
- `1`: one or more alignment failures detected

## Output Format

The checker prints one line per check:

- `PASS`: declaration and scopes aligned
- `FAIL`: declaration exists but scope entry missing
- `WARN`: related/informational mismatch (only in include-related mode)

And a final summary:

- `Alignment status: IN SYNC` or `Alignment status: NOT IN SYNC`

## Notes

- This skill validates source-level consistency only.
- After fixes, rerun preprocessing/build (`./_preprocessMultiVersion.sh`, then build checks) to verify generated outputs remain consistent.
