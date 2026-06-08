# Proposed Resolution for FHIR-56765

## Ticket Summary

| Field | Value |
| --- | --- |
| Key | FHIR-56765 |
| Type | Change Request |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Related Sections | 1 |
| Raised in Version | 1.0.0-ballot |

## Description

The table of contents should be linked in a menu.

Reporter(s): Brian Swinkels, Epic

## Implementation Status

Pending.

No implementation evidence is recorded in the ticket markdown: there are no linked pull requests, commits, or issue references in the synced ticket content.

Repository inspection shows that the implementation guide already generates a Table of Contents page, but it is not exposed from the primary top navigation menu:

- `output/toc.html` exists in the current rendered build.
- `sushi-config.yaml` currently defines only one menu entry: `Home: index.html`.
- `template/includes/fragment-pagebegin.html` renders the top navigation from `menu.xml`.
- `template/includes/fragment-footer.html` already links `toc.html` from the footer.
- `output/index.html` shows `Table of Contents` in the breadcrumb trail and footer, but the navbar itself still contains only `Home`.

### Implementation Details

- Current state: discoverable through breadcrumb and footer, not the navbar menu.
- Likely change surface: `sushi-config.yaml` or a custom `input/includes/menu.xml` if the project wants more control than the generated SUSHI menu provides.
- Validation target after implementation: rebuilt IG output should show a navbar entry that links to `toc.html` consistently in the root build and versioned outputs.

## Related Tickets

- Related navigation ticket: FHIR-56766, "Editorial: menu ordering doesn't match IG-builder ordering" (Status: Submitted, Resolution: Unresolved). This is adjacent because adding a TOC menu item should respect the same final ordering rules as the rest of the menu.

## Disposition Analysis

### Disposition Taken

Pending governance review.

### Rationale

The request is editorial and narrowly scoped. The repository already has the underlying artifact (`toc.html`) and already surfaces it in secondary navigation elements, which means the missing behavior is not generation of the TOC page but discoverability from the primary menu. That makes this a low-risk navigation improvement rather than a substantive content or modeling change.

### Evidence

- Ticket status is `Triaged` with unresolved resolution.
- No implementation links are present in the synced Jira markdown.
- `sushi-config.yaml` menu currently contains only `Home`.
- `template/includes/fragment-pagebegin.html` includes `menu.xml` for the navbar.
- `template/includes/fragment-footer.html` already links `toc.html`.
- `output/index.html` breadcrumb includes `Table of Contents`, confirming the page exists in the rendered guide.

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal A

Add a visible `Table of Contents` entry to the primary navigation menu so users can reach `toc.html` directly from the navbar. The concrete implementation would be to extend the existing menu configuration in `sushi-config.yaml` from a single `Home` item to include a TOC item, or to replace the generated menu with a curated `input/includes/menu.xml` if ordering and labeling need tighter control. The TOC entry should be placed consistently with the IG page ordering and propagated through the root and multi-version outputs.

#### Justification A

This addresses the ticket exactly as written with minimal implementation risk. The page already exists, so the change is limited to navigation exposure. It improves discoverability for readers who expect key orientation aids in the main menu rather than only in breadcrumbs or the footer.

---

### Disposition B: Alternative Approach

#### Proposal B

Keep the top menu compact and instead make TOC access more prominent through a dedicated navigation control near the page header or breadcrumb area, for example by styling the existing breadcrumb link more prominently or adding a persistent secondary navigation element that links to `toc.html`.

#### Justification B

This preserves a minimal navbar while still improving discoverability. It may be preferable if the work group wants to avoid growing the top-level menu or if FHIR-56766 leads to a broader rethink of menu ordering. The trade-off is that it only partially satisfies the literal wording of "linked in a menu" because it relies on secondary navigation rather than the main navbar.

---

### Disposition C: Decline

#### Proposal C

Do not change the current navigation because the TOC is already reachable through the breadcrumb trail and footer links.

#### Justification C

Declining is defensible only if the work group considers the existing discoverability sufficient and wants to avoid additional menu items. The downside is that it leaves the main navigation inconsistent with user expectations: orientation content exists but is not surfaced in the primary menu, which is the core concern raised by the ticket.

---

### Recommendation

**Recommended disposition:** A

Accept the request and add `Table of Contents` to the primary menu. The repository evidence shows that the page already exists and is already treated as a first-class navigation concept in breadcrumbs and the footer, so exposing it in the navbar is a small, coherent editorial fix. The only notable caveat is ordering: implementation should be coordinated with FHIR-56766 so the added menu item follows the same page-ordering rules as the rest of the guide.

## Next Steps

Ready for Review.

### Verification Checklist

- [ ] Work group review completed
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated
