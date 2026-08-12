# Cross-Version Fix Memory — Index & Update Protocol

This folder is the persistent knowledge base for the `fix-crossversion-issues` skill. It records
verified FHIR cross-version deltas and the FSH fix pattern for each, so repeated errors are resolved
instantly without re-deriving them.

## Files
- [fhir-version-deltas.md](./fhir-version-deltas.md) — the delta catalog (one entry per element/type change).

## Update Protocol (mandatory after each successful fix)
1. Only record a delta **after** SUSHI confirms the error is resolved.
2. Ground every entry in the core `StructureDefinition` you inspected — never from memory alone.
3. Add a new entry, or correct an existing one if it was inaccurate. Do not duplicate.
4. Keep it terse: the versions involved, the element/type change, and the exact FSH before/after.

## Entry Template
```
### <Resource>.<element> — <short delta title>
- Versions: <e.g. R5 → R6> (also note R4 if relevant)
- Delta: <what changed, verified in core SD>
- Symptom: <the SUSHI error text>
- Fix (FSH):
  - Before: `<old rule>`
  - After:  `<new rule>`
- Caveat: <e.g. reference targets the new core forbids; value set change; none>
- Verified: <YYYY-MM-DD>, core pkg(s) <hl7.fhir.rX.core#ver>
```
