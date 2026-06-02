# Requirements Traceability Matrix (RTM) — SauceDemo

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> The RTM maps business requirements → test cases → bug reports to ensure full coverage.

---

## How to Read This Matrix

| Column | Description |
|--------|-------------|
| **REQ-ID** | Business / functional requirement identifier |
| **Requirement** | Plain-language description of what must work |
| **Priority** | Business priority (P1 = Critical, P2 = High, P3 = Medium) |
| **Test Case IDs** | All test cases that verify this requirement |
| **Bug IDs** | Defects discovered while testing this requirement |
| **Coverage** | % of requirement verified by current test cases |
| **Status** | Overall requirement status |

---

## Traceability Matrix

| REQ-ID | Requirement Description | Priority | Test Case IDs | Bug IDs | Coverage | Status |
|--------|------------------------|---------|--------------|---------|---------|--------|
| REQ-001 | System shall allow registered users to log in with valid credentials | P1 | TC-001, TC-003, TC-004, TC-005, TC-006 | — | 100% | ✅ Covered |
| REQ-002 | System shall prevent login for locked-out accounts | P1 | TC-002 | — | 100% | ✅ Covered |
| REQ-003 | System shall display appropriate error messages for invalid login | P1 | TC-003, TC-004, TC-005, TC-006 | — | 100% | ✅ Covered |
| REQ-004 | System shall allow users to log out and terminate session | P1 | TC-007 | — | 100% | ✅ Covered |
| REQ-005 | System shall protect authenticated routes from unauthenticated access | P1 | TC-008 | — | 100% | ✅ Covered |
| REQ-006 | System shall display all available products on inventory page | P2 | TC-010 | — | 100% | ✅ Covered |
| REQ-007 | System shall allow users to sort products by name and price | P2 | TC-011, TC-012, TC-013, TC-014 | BUG-09 | 100% | ⚠️ Bug Found |
| REQ-008 | System shall allow users to view individual product details | P2 | TC-015, TC-016 | — | 100% | ✅ Covered |
| REQ-009 | System shall allow users to add products to the shopping cart | P1 | TC-017, TC-018, TC-024 | — | 100% | ✅ Covered |
| REQ-010 | System shall allow users to remove products from the cart | P1 | TC-019, TC-022 | — | 100% | ✅ Covered |
| REQ-011 | Cart item count shall persist across page navigation | P2 | TC-020 | — | 100% | ✅ Covered |
| REQ-012 | System shall display cart contents with correct item details | P1 | TC-021, TC-025 | — | 100% | ✅ Covered |
| REQ-013 | System shall allow users to proceed to checkout | P1 | TC-026 | — | 100% | ✅ Covered |
| REQ-014 | System shall require and validate shipping information fields | P1 | TC-027, TC-028, TC-029, TC-030 | — | 100% | ✅ Covered |
| REQ-015 | System shall display order summary with correct totals | P1 | TC-031, TC-032 | — | 100% | ✅ Covered |
| REQ-016 | System shall allow users to complete an order and show confirmation | P1 | TC-033, TC-034 | — | 100% | ✅ Covered |
| REQ-017 | System shall allow users to cancel checkout at any step | P2 | TC-035, TC-036 | — | 100% | ✅ Covered |
| REQ-018 | Navigation menu shall provide access to all major sections | P2 | TC-037, TC-038 | — | 100% | ✅ Covered |
| REQ-019 | System shall allow resetting application state | P3 | TC-039 | — | 100% | ✅ Covered |
| REQ-020 | UI shall render consistently across supported browsers | P2 | TC-040 | BUG-10 | 80% | ⚠️ Bug Found |

---

## Coverage Summary

| Priority | Total Requirements | Fully Covered | With Bugs | Not Covered |
|----------|-------------------|--------------|-----------|------------|
| P1 | 10 | 10 | 0 | 0 |
| P2 | 8 | 7 | 2 | 0 |
| P3 | 2 | 2 | 0 | 0 |
| **Total** | **20** | **19** | **2** | **0** |

**Overall Test Coverage: 100% (requirements) | 95% (defect-free)**

---

## Defect Impact Analysis

| Bug ID | Severity | Linked Requirements | Impact |
|--------|---------|-------------------|--------|
| BUG-09 | Medium | REQ-007 | Sort on `problem_user` shows incorrect prices — visual defect |
| BUG-10 | Low | REQ-020 | Broken image on `problem_user` — cosmetic, non-blocking |

---

## Change Log

| Version | Date | Change | Author |
|---------|------|--------|--------|
| 1.0 | 2025 | Initial RTM creation | Kevin Trimboli |

---

*RTM Version: 1.0 | Prepared by: Kevin Trimboli | Last Updated: 2025*
