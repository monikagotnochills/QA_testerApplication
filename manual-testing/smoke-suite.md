# Smoke Test Suite — SauceDemo E-Commerce Application

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> **Purpose:** Verify the critical path is operational before running the full regression suite.  
> **Execution Time:** ~15 minutes (manual) | ~3 minutes (automated)  
> **Run Frequency:** Every deployment / every CI build

---

## What is a Smoke Suite?

A smoke suite is a small set of **high-value, fast-running tests** that confirm the application's core functionality is alive. If any smoke test fails, regression testing is paused and the build is flagged as broken.

**Smoke Suite Pass Criteria:** 100% of tests must pass.

---

## Smoke Test Cases

| ID | Test Title | Module | Steps | Expected Result | Status |
|----|-----------|--------|-------|----------------|--------|
| SMK-001 | App loads at root URL | Infrastructure | 1. Navigate to https://www.saucedemo.com | Login page renders within 3 seconds; username/password/login fields visible | ✅ PASS |
| SMK-002 | Login with standard user | Authentication | 1. Enter `standard_user` / `secret_sauce` 2. Click Login | Redirect to `/inventory.html`; "Products" header visible | ✅ PASS |
| SMK-003 | Login error shown for wrong password | Authentication | 1. Enter valid username + wrong password 2. Click Login | Red error banner appears; user stays on login page | ✅ PASS |
| SMK-004 | Inventory page shows 6 products | Inventory | 1. Login 2. Observe inventory page | Exactly 6 product cards displayed with name, price, image, and button | ✅ PASS |
| SMK-005 | Add item to cart | Cart | 1. Login 2. Click "Add to cart" on first product | Cart badge shows "1"; button changes to "Remove" | ✅ PASS |
| SMK-006 | Cart page opens with correct item | Cart | 1. Add item 2. Click cart icon | Cart page shows the added item with name, quantity "1", and price | ✅ PASS |
| SMK-007 | Checkout Step 1 loads | Checkout | 1. Add item to cart 2. Click Checkout | Checkout Step 1 form appears with First Name, Last Name, Zip fields | ✅ PASS |
| SMK-008 | Checkout form validation — required fields | Checkout | 1. On Checkout Step 1 2. Click Continue with all fields blank | Error: "First Name is required" | ✅ PASS |
| SMK-009 | Checkout Step 2 shows order summary | Checkout | 1. Complete Step 1 with valid data | Step 2 shows items, subtotal, tax, and total; Finish button visible | ✅ PASS |
| SMK-010 | Order completion — thank you page | Checkout | 1. On Step 2, click Finish | "Thank you for your order!" confirmation displayed; Pony Express image shown | ✅ PASS |
| SMK-011 | Logout via hamburger menu | Navigation | 1. Login 2. Open hamburger menu 3. Click Logout | Redirect to login page; cart is cleared | ✅ PASS |
| SMK-012 | Protected route redirect | Security | 1. Clear session/cookies 2. Navigate directly to `/inventory.html` | Redirect to login page; cannot access without authentication | ✅ PASS |

---

## Smoke Suite — Execution Log

| Run Date | Executor | Environment | Pass | Fail | Result |
|----------|---------|-------------|------|------|--------|
| 2025-01-15 | Kevin Trimboli | Chrome / Win10 | 12 | 0 | ✅ GREEN |
| 2025-01-20 | GitHub Actions (CI) | Chromium / ubuntu | 12 | 0 | ✅ GREEN |

---

## Automation Mapping

All 12 smoke tests are automated in the Playwright suite:

| Smoke Test | Automated Test File |
|-----------|-------------------|
| SMK-001 to SMK-003 | `tests/test_login.py` |
| SMK-004 to SMK-006 | `tests/test_cart.py` |
| SMK-007 to SMK-010 | `tests/test_checkout.py` |
| SMK-011 to SMK-012 | `tests/test_login.py` |

---

*Smoke Suite Version: 1.0 | Prepared by: Kevin Trimboli | Last Updated: 2025*
