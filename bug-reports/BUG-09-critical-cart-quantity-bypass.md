# BUG-09 — [CRITICAL] Checkout Accepts Negative Quantity in Cart

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> **Application Under Test:** https://www.saucedemo.com

---

## Bug Summary

| Field | Value |
|-------|-------|
| **Bug ID** | BUG-09 |
| **Summary** | Shopping cart does not validate item quantity; negative or zero quantity values bypass checkout guard |
| **Module** | Shopping Cart — Quantity Validation |
| **Environment** | Chrome 120 / Windows 10 / https://www.saucedemo.com |
| **Severity** | **Critical** |
| **Priority** | **P1** |
| **Status** | Open |
| **Reported By** | Kevin Trimboli |
| **Date Reported** | 2025-01-12 |

---

## Preconditions

- User is logged in as `standard_user`
- At least one item has been added to the cart

---

## Steps to Reproduce

1. Log in with `standard_user` / `secret_sauce`
2. Add "Sauce Labs Backpack" to cart
3. Open the Shopping Cart page
4. Using browser DevTools, modify the quantity input field value to `0` or `-1` via the Elements panel
5. Click **Checkout**

---

## Expected Result

The system should prevent checkout with a zero or negative item quantity. An error message should appear:
> *"Item quantity must be at least 1 to proceed."*

Checkout should be blocked.

---

## Actual Result

The checkout flow proceeds without error. The order summary on Step 2 reflects the manipulated quantity. The order can be "completed" with an invalid item count.

---

## Evidence

- Screenshot (DevTools manipulation): `../evidence/BUG-09-devtools-qty.png`
- Screen recording: `../evidence/BUG-09-checkout-bypass.mp4`

---

## Root Cause Hypothesis

The application relies entirely on UI controls (which prevent manual quantity editing through the standard UI) but does **not implement server-side quantity validation**. When the DOM is manipulated directly, the backend accepts whatever value is submitted without validation.

**Recommended Fix:**
1. Add server-side validation: `if (quantity <= 0) { reject("Invalid quantity") }`
2. Add client-side guard: validate quantity before enabling the Checkout button
3. Sign cart data to prevent DOM tampering (HMAC token on cart payload)

---

## Impact

- **Business Risk:** Customer could theoretically place an order with 0 items, causing fulfillment confusion
- **Security Risk:** Low — demo app only — but pattern is critical in production e-commerce systems
- **Test Value:** Demonstrates ability to discover logic flaws through DOM manipulation and boundary testing

---

*Bug Report Version: 1.0 | Reported by: Kevin Trimboli*
