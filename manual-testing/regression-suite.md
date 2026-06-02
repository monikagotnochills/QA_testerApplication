# Regression Test Suite — SauceDemo E-Commerce Application

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> **Purpose:** Full coverage regression run executed after every major feature change or release.  
> **Total Tests:** 35 | **Estimated Manual Execution:** ~90 minutes | **Automated:** ~8 minutes

---

## Regression Suite Overview

| Module | Test Count | Automation Coverage |
|--------|-----------|-------------------|
| Registration / Authentication | 9 | 100% |
| Product Inventory & Search | 7 | 86% |
| Shopping Cart | 9 | 100% |
| Checkout Flow | 11 | 100% |
| Navigation & UI | 4 | 75% |
| **Total** | **40** | **95%** |

---

## Module 1: Authentication (9 Tests)

| ID | Title | Type | Priority | Status |
|----|-------|------|---------|--------|
| REG-001 | Login with standard_user → redirect to inventory | Positive | P1 | ✅ PASS |
| REG-002 | Login with locked_out_user → error message shown | Negative | P1 | ✅ PASS |
| REG-003 | Login with problem_user → login succeeds but UI defects present | Exploratory | P2 | ✅ PASS |
| REG-004 | Login with invalid password → error banner shown | Negative | P1 | ✅ PASS |
| REG-005 | Login with empty username → "Username is required" | Negative | P1 | ✅ PASS |
| REG-006 | Login with empty password → "Password is required" | Negative | P1 | ✅ PASS |
| REG-007 | Login with both fields empty → "Username is required" | Negative | P1 | ✅ PASS |
| REG-008 | Logout → session cleared, redirect to login | Positive | P1 | ✅ PASS |
| REG-009 | Direct URL access to /inventory.html without session → redirect | Security | P1 | ✅ PASS |

---

## Module 2: Product Inventory (7 Tests)

| ID | Title | Type | Priority | Status |
|----|-------|------|---------|--------|
| REG-010 | Inventory page shows exactly 6 products | Positive | P2 | ✅ PASS |
| REG-011 | Each product card has: image, name, description, price, button | UI Validation | P2 | ✅ PASS |
| REG-012 | Sort by Name A→Z: first product is "Sauce Labs Backpack" | Positive | P2 | ✅ PASS |
| REG-013 | Sort by Name Z→A: first product is "Test.allTheThings() T-Shirt" | Positive | P2 | ✅ PASS |
| REG-014 | Sort by Price Low→High: first product costs $7.99 | Positive | P2 | ✅ PASS |
| REG-015 | Sort by Price High→Low: first product costs $49.99 | Positive | P2 | ✅ PASS |
| REG-016 | Click product title → product detail page loads with all fields | Positive | P2 | ✅ PASS |

---

## Module 3: Shopping Cart (9 Tests)

| ID | Title | Type | Priority | Status |
|----|-------|------|---------|--------|
| REG-017 | Add first product → cart badge = "1" | Positive | P1 | ✅ PASS |
| REG-018 | Add 3 products → cart badge = "3" | Positive | P1 | ✅ PASS |
| REG-019 | Remove product from inventory page → badge decrements | Positive | P1 | ✅ PASS |
| REG-020 | Cart badge persists when navigating to product detail | State | P2 | ✅ PASS |
| REG-021 | Cart page shows all items with correct names and prices | Validation | P1 | ✅ PASS |
| REG-022 | Remove item from cart page → item disappears from list | Positive | P1 | ✅ PASS |
| REG-023 | Continue Shopping from cart → return to inventory | Navigation | P2 | ✅ PASS |
| REG-024 | Add product from detail page → badge increments | Positive | P1 | ✅ PASS |
| REG-025 | Fresh session → cart starts empty, no badge visible | State | P2 | ✅ PASS |

---

## Module 4: Checkout Flow (11 Tests)

| ID | Title | Type | Priority | Status |
|----|-------|------|---------|--------|
| REG-026 | Proceed to checkout from cart → Step 1 form loads | Positive | P1 | ✅ PASS |
| REG-027 | Fill valid checkout data → proceed to Step 2 summary | Positive | P1 | ✅ PASS |
| REG-028 | Empty First Name on Step 1 → validation error | Negative | P1 | ✅ PASS |
| REG-029 | Empty Last Name on Step 1 → validation error | Negative | P1 | ✅ PASS |
| REG-030 | Empty Zip Code on Step 1 → validation error | Negative | P1 | ✅ PASS |
| REG-031 | Step 2 summary shows all cart items | Validation | P1 | ✅ PASS |
| REG-032 | Step 2 total = item subtotal + tax | Calculation | P1 | ✅ PASS |
| REG-033 | Finish button → order confirmation page | Positive | P1 | ✅ PASS |
| REG-034 | Confirmation: "Thank you for your order!" message shown | Validation | P1 | ✅ PASS |
| REG-035 | Back Home from confirmation → inventory, cart is cleared | State | P1 | ✅ PASS |
| REG-036 | Cancel on Step 1 → back to cart, items preserved | Negative | P2 | ✅ PASS |

---

## Module 5: Navigation & UI (4 Tests)

| ID | Title | Type | Priority | Status |
|----|-------|------|---------|--------|
| REG-037 | Hamburger menu opens and closes correctly | UI | P2 | ✅ PASS |
| REG-038 | "About" link navigates to saucelabs.com | Navigation | P3 | ✅ PASS |
| REG-039 | Reset App State clears cart and button states | Functional | P2 | ✅ PASS |
| REG-040 | Footer social media links are present and functional | UI | P3 | ✅ PASS |

---

## Defects Found During Regression

| Bug ID | Severity | Module | Description | Status |
|--------|---------|--------|-------------|--------|
| BUG-09 | Medium | Inventory | `problem_user`: product images broken, prices display incorrectly | Open |
| BUG-10 | Low | UI | `problem_user`: checkout form auto-fills Last Name field incorrectly | Open |

---

## Regression Execution History

| Run # | Date | Trigger | Total | Pass | Fail | Duration |
|-------|------|---------|-------|------|------|---------|
| RUN-01 | 2025-01-10 | Manual baseline | 40 | 38 | 2 | 87 min |
| RUN-02 | 2025-01-20 | CI Pipeline | 40 | 38 | 2 | 8 min |

> *Failures are confined to `problem_user` scenarios — these are intentional known defects in SauceDemo for testing purposes. All P1 tests pass on `standard_user`.*

---

*Regression Suite Version: 1.0 | Prepared by: Kevin Trimboli | Last Updated: 2025*
