# Defect Log — Master Bug Tracker

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.

---

## Summary Table

| Bug ID | Summary | Module | Severity | Priority | Status | Reported |
|--------|---------|--------|---------|---------|--------|---------|
| [BUG-01](./BUG-01-invalid-name-dash.md) | Registration accepts `-` as valid name | Registration | Medium | P2 | Open | 2025-01-10 |
| [BUG-02](./BUG-02-rate-limit-register.md) | User blocked after 2 registration attempts (CF-1015) | Registration | High | P1 | Open | 2025-01-10 |
| [BUG-03](./BUG-03-slash-in-name.md) | Registration accepts `/` in name fields | Registration | Medium | P2 | Open | 2025-01-10 |
| [BUG-04](./BUG-04-rate-limit-browsing.md) | Cloudflare block during normal product browsing | Catalog | High | P1 | Open | 2025-01-11 |
| [BUG-05](./BUG-05-weak-email-validation.md) | Weak email validation accepts `2@a.c` | Registration | High | P2 | Open | 2025-01-11 |
| [BUG-06](./BUG-06-out-of-stock-cart.md) | Out-of-stock item allowed through checkout | Cart/Checkout | High | P1 | Open | 2025-01-12 |
| [BUG-07](./BUG-07-rate-limit-refresh.md) | Cloudflare block on repeated page refresh | General | Medium | P2 | Open | 2025-01-12 |
| [BUG-08](./BUG-08-api-negative-price-acceptance.md) | API accepts negative price values | API / Business Logic | High | P1 | Open | 2025-01-13 |
| [BUG-09](./BUG-09-critical-cart-quantity-bypass.md) | Cart quantity bypass via DOM manipulation | Cart/Checkout | **Critical** | P1 | Open | 2025-01-12 |
| [BUG-10](./BUG-10-critical-session-not-invalidated.md) | Session not invalidated after logout (back button bypass) | Authentication | **Critical** | P1 | Open | 2025-01-12 |

---

## Severity Distribution

| Severity | Count | Bug IDs |
|---------|-------|---------|
| Critical | 2 | BUG-09, BUG-10 |
| High | 4 | BUG-02, BUG-04, BUG-05, BUG-08 |
| Medium | 3 | BUG-01, BUG-03, BUG-07 |
| Low | 1 | BUG-06 (demo limitation) |
| **Total** | **10** | |

---

## Module Coverage

| Module | Bug Count | Highest Severity |
|--------|----------|-----------------|
| Authentication / Session | 2 | Critical (BUG-10) |
| Registration / Validation | 3 | High (BUG-02, BUG-05) |
| Shopping Cart / Checkout | 2 | Critical (BUG-09) |
| Product Catalog | 1 | High (BUG-04) |
| API / Business Logic | 1 | High (BUG-08) |
| General Navigation | 1 | Medium (BUG-07) |

---

## Bug Status Summary

| Status | Count |
|--------|-------|
| Open | 10 |
| In Progress | 0 |
| Fixed / Closed | 0 |
| Won't Fix | 0 |

> All bugs are marked **Open** as this is a portfolio demonstration against public demo applications that are not actively maintained.

---

## Testing Notes

- **BUG-02, BUG-04, BUG-07:** Cloudflare rate-limiting bugs affect OpenCart demo (`demo.opencart.com`) which is a heavily trafficked public demo site. These are environment-specific but represent real-world infrastructure issues a QA must document.
- **BUG-09, BUG-10:** Found via security-focused exploratory testing (DOM manipulation, browser history attacks). Demonstrates OWASP awareness.
- **BUG-08:** Found via API negative testing in Postman. Demonstrates ability to test beyond the UI layer.

---

*Defect Log Version: 1.0 | Maintained by: Kevin Trimboli | Last Updated: 2025*
