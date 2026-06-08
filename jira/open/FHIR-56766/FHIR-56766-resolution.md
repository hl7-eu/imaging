# Proposed Resolution for FHIR-56766

## Ticket Summary

| Field | Value |
|---|---|
| Key | FHIR-56766 |
| Type | Technical Correction |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Related Sections | Navigation |

## Description

Menus are out of order with the IG builder ordering.

Reporter(s): Brian Swinkels, Epic

## Implementation Status

Current state: Pending review and decision.

No implementation evidence was found in the ticket source markdown:
- No linked pull requests
- No linked commits
- No linked issues documenting implementation completion

### Implementation Details (if Applied)

No implementation details are available yet.

## Related Tickets

No parent key or grouping references were found in the ticket metadata.

## Disposition Analysis

### Disposition Taken

Pending

### Rationale

The ticket is currently in `Submitted` status with `Unresolved` resolution and no recorded implementation artifacts. This indicates the requested editorial correction has not yet been formally approved and merged.

### Evidence

- Ticket status marker: `Submitted`
- Ticket resolution marker: `Unresolved`
- No GitHub PR/commit links found in the ticket content
- No related ticket references (parent/grouping) found

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Update navigation/menu ordering in the source content so the rendered menu order matches the IG builder output order exactly for both publication variants. Specifically:
- Align ordering definitions in the source menu/page include structures used by preprocessing.
- Regenerate outputs and confirm parity in both `igs/imaging-r4` and `igs/imaging-r5` navigation.
- Keep labels and page targets unchanged; this is ordering-only.

#### Justification

This is a pure editorial consistency correction and improves reader experience by making navigation predictable and aligned with generated structure. It has minimal risk because it does not alter profile semantics, conformance content, or canonical URLs.

---

### Disposition B: Alternative Approach

#### Proposal

Keep current authored menu structure, but document and enforce a deterministic sorting rule during preprocessing/build so generated navigation order is stable and intentionally different where needed. Add a short note in editorial guidance describing the ordering rule and where to modify it.

#### Justification

If there are intentional differences between authored and generated menus, codifying a build-time rule avoids recurring drift and reduces manual maintenance burden. Trade-off: users may still perceive mismatch unless documentation is clear.

---

### Disposition C: Decline

#### Proposal

Do not change menu ordering. Close as not actionable because no concrete user impact or reproducible navigation defect beyond stylistic preference is demonstrated.

#### Justification

Declining is defensible only if maintainers confirm ordering is intentionally controlled by IG tooling and no governance requirement exists to mirror authored sequence. This avoids churn, but it leaves reported usability friction unresolved.

---

### Recommendation

**Recommended disposition:** A

Accepting as requested is the strongest option because the issue is narrowly scoped, editorial, low risk, and directly tied to navigation clarity. The correction can be validated quickly in both rendered outputs and does not require model or profile changes. Option B is viable if tooling constraints make direct alignment difficult, but A better satisfies the ticket statement.

## Next Steps

Awaiting Decision

### Verification Checklist

- [ ] Work group review completed
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated
