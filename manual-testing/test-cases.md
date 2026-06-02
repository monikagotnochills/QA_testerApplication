# Test Cases — SauceDemo E-Commerce Application

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> **Application Under Test:** https://www.saucedemo.com  
> **Test Environment:** Chrome (latest) | Windows 10  
> **Format:** ID | Title | Preconditions | Steps | Expected Result | Actual Result | Status

---

## Module 1: Authentication

| ID | Title | Preconditions | Steps | Expected Result | Actual Result | Status |
|----|-------|--------------|-------|----------------|--------------|--------|
| TC-001 | Login with valid standard user credentials | App is loaded at https://www.saucedemo.com | 1. Enter username: `standard_user` 2. Enter password: `secret_sauce` 3. Click **Login** | User is redirected to `/inventory.html`; header shows "Products" | As expected | ✅ PASS |
| TC-002 | Login with locked-out user account | App is loaded | 1. Enter username: `locked_out_user` 2. Enter password: `secret_sauce` 3. Click **Login** | Error banner: "Epic sadface: Sorry, this user has been locked out." | As expected | ✅ PASS |
| TC-003 | Login with invalid password | App is loaded | 1. Enter username: `standard_user` 2. Enter password: `wrongpassword` 3. Click **Login** | Error banner: "Username and password do not match any user in this service" | As expected | ✅ PASS |
| TC-004 | Login with empty username field | App is loaded | 1. Leave username blank 2. Enter any password 3. Click **Login** | Error banner: "Epic sadface: Username is required" | As expected | ✅ PASS |
| TC-005 | Login with empty password field | App is loaded | 1. Enter valid username 2. Leave password blank 3. Click **Login** | Error banner: "Epic sadface: Password is required" | As expected | ✅ PASS |
| TC-006 | Login with both fields empty | App is loaded | 1. Leave both fields blank 2. Click **Login** | Error banner: "Username is required" | As expected | ✅ PASS |
| TC-007 | Successful logout | User is logged in as `standard_user` | 1. Click hamburger menu (top left) 2. Click **Logout** | User is redirected to login page; session is cleared | As expected | ✅ PASS |
| TC-008 | Access inventory page without login | Fresh browser session | 1. Navigate directly to `https://www.saucedemo.com/inventory.html` | User is redirected to login page; cannot access protected route | As expected | ✅ PASS |
| TC-009 | Error message dismiss button works | Invalid login attempt made | 1. Submit invalid credentials 2. Click the **X** button on the error banner | Error banner is dismissed; form is usable again | As expected | ✅ PASS |

---

## Module 2: Product Inventory

| ID | Title | Preconditions | Steps | Expected Result | Actual Result | Status |
|----|-------|--------------|-------|----------------|--------------|--------|
| TC-010 | Inventory page displays all 6 products | Logged in as `standard_user` | 1. Observe `/inventory.html` | Page displays exactly 6 product cards with name, description, price, and Add to Cart button | As expected | ✅ PASS |
| TC-011 | Sort products by Name (A to Z) | Logged in; on inventory page | 1. Click sort dropdown 2. Select "Name (A to Z)" | Products reordered alphabetically A→Z | As expected | ✅ PASS |
| TC-012 | Sort products by Name (Z to A) | Logged in; on inventory page | 1. Click sort dropdown 2. Select "Name (Z to A)" | Products reordered alphabetically Z→A | As expected | ✅ PASS |
| TC-013 | Sort products by Price (low to high) | Logged in; on inventory page | 1. Click sort dropdown 2. Select "Price (low to high)" | Products ordered by price ascending ($7.99 first) | As expected | ✅ PASS |
| TC-014 | Sort products by Price (high to low) | Logged in; on inventory page | 1. Click sort dropdown 2. Select "Price (high to low)" | Products ordered by price descending ($49.99 first) | As expected | ✅ PASS |
| TC-015 | Open product detail page | Logged in; on inventory page | 1. Click on any product title or image | Product detail page loads with name, description, price, and Add to Cart button | As expected | ✅ PASS |
| TC-016 | Navigate back from product detail to inventory | On product detail page | 1. Click **Back to products** button | Returns to inventory page; product list is intact | As expected | ✅ PASS |

---

## Module 3: Shopping Cart

| ID | Title | Preconditions | Steps | Expected Result | Actual Result | Status |
|----|-------|--------------|-------|----------------|--------------|--------|
| TC-017 | Add single item to cart from inventory | Logged in; on inventory page | 1. Click **Add to cart** on "Sauce Labs Backpack" | Cart badge shows "1"; button changes to "Remove" | As expected | ✅ PASS |
| TC-018 | Add multiple items to cart | Logged in; on inventory page | 1. Click **Add to cart** on 3 different products | Cart badge shows "3" | As expected | ✅ PASS |
| TC-019 | Remove item from cart via inventory page | 1 item already in cart | 1. Click **Remove** on the same product | Cart badge decrements to 0 and disappears; button reverts to "Add to cart" | As expected | ✅ PASS |
| TC-020 | Cart badge persists across pages | Item added to cart | 1. Navigate to product detail page 2. Observe cart icon | Cart badge count is preserved across page navigation | As expected | ✅ PASS |
| TC-021 | View cart contents | 2 items in cart | 1. Click cart icon | Cart page shows all added items with name, quantity, price | As expected | ✅ PASS |
| TC-022 | Remove item from cart page | Cart page open with 1 item | 1. Click **Remove** on an item | Item is removed from cart list; if last item, cart is empty | As expected | ✅ PASS |
| TC-023 | Continue shopping from cart page | On cart page | 1. Click **Continue Shopping** | User is redirected back to inventory page | As expected | ✅ PASS |
| TC-024 | Add item to cart from product detail page | On product detail page | 1. Click **Add to cart** | Cart badge increments; button changes to "Remove" | As expected | ✅ PASS |
| TC-025 | Cart is empty on fresh session | Just logged in | 1. Click cart icon | Cart page shows no items; no badge visible on cart icon | As expected | ✅ PASS |

---

## Module 4: Checkout Flow

| ID | Title | Preconditions | Steps | Expected Result | Actual Result | Status |
|----|-------|--------------|-------|----------------|--------------|--------|
| TC-026 | Proceed to checkout with item in cart | 1+ items in cart; on cart page | 1. Click **Checkout** | Checkout Step 1 page loads (address form) | As expected | ✅ PASS |
| TC-027 | Complete checkout information form | On Checkout Step 1 | 1. Enter First Name: "John" 2. Enter Last Name: "Tester" 3. Enter Zip: "12345" 4. Click **Continue** | Navigates to Checkout Step 2 (order summary) | As expected | ✅ PASS |
| TC-028 | Submit checkout with empty First Name | On Checkout Step 1 | 1. Leave First Name blank 2. Fill Last Name and Zip 3. Click **Continue** | Error: "Error: First Name is required" | As expected | ✅ PASS |
| TC-029 | Submit checkout with empty Last Name | On Checkout Step 1 | 1. Fill First Name, leave Last Name blank 2. Fill Zip 3. Click **Continue** | Error: "Error: Last Name is required" | As expected | ✅ PASS |
| TC-030 | Submit checkout with empty Zip Code | On Checkout Step 1 | 1. Fill First Name and Last Name 2. Leave Zip blank 3. Click **Continue** | Error: "Error: Postal Code is required" | As expected | ✅ PASS |
| TC-031 | Order summary displays correct items | On Checkout Step 2 | 1. Observe item list, individual prices, item total, tax, and grand total | All items from cart are listed; item total + tax = grand total | As expected | ✅ PASS |
| TC-032 | Verify tax calculation on order summary | 1 item ($29.99) in cart; on Checkout Step 2 | 1. Note item subtotal 2. Note tax amount 3. Note total | Tax = item total × 8% (≈ $2.40); Total = item total + tax | As expected | ✅ PASS |
| TC-033 | Complete order — Finish button | On Checkout Step 2 | 1. Review order 2. Click **Finish** | Order confirmation page loads; "Thank you for your order!" message displayed | As expected | ✅ PASS |
| TC-034 | Order confirmation — Back Home navigation | On order confirmation page | 1. Click **Back Home** | User is redirected to inventory page; cart is empty | As expected | ✅ PASS |
| TC-035 | Cancel checkout from Step 1 | On Checkout Step 1 | 1. Click **Cancel** | User is returned to cart page; items are preserved | As expected | ✅ PASS |
| TC-036 | Cancel checkout from Step 2 | On Checkout Step 2 | 1. Click **Cancel** | User is returned to inventory page; cart items are preserved | As expected | ✅ PASS |

---

## Module 5: Navigation & UI

| ID | Title | Preconditions | Steps | Expected Result | Actual Result | Status |
|----|-------|--------------|-------|----------------|--------------|--------|
| TC-037 | Hamburger menu opens and closes | Logged in | 1. Click hamburger menu (≡) 2. Observe menu 3. Click X to close | Menu slides open with options (All Items, About, Logout, Reset); closes on X click | As expected | ✅ PASS |
| TC-038 | "About" menu link navigates to Sauce Labs site | Hamburger menu open | 1. Click **About** | Browser navigates to https://saucelabs.com | As expected | ✅ PASS |
| TC-039 | "Reset App State" clears cart | Items in cart; hamburger menu open | 1. Click **Reset App State** | Cart badge disappears; all "Remove" buttons revert to "Add to cart" | As expected | ✅ PASS |
| TC-040 | Footer social links are present | Any page when logged in | 1. Scroll to footer | Twitter, Facebook, LinkedIn icons are visible and link to Sauce Labs social pages | As expected | ✅ PASS |

---

## Test Execution Summary

| Module | Total TCs | Passed | Failed | Blocked |
|--------|----------|--------|--------|---------|
| Authentication | 9 | 9 | 0 | 0 |
| Product Inventory | 7 | 7 | 0 | 0 |
| Shopping Cart | 9 | 9 | 0 | 0 |
| Checkout Flow | 11 | 11 | 0 | 0 |
| Navigation & UI | 4 | 4 | 0 | 0 |
| **TOTAL** | **40** | **40** | **0** | **0** |

> **Note:** SauceDemo is a purpose-built test application; all standard flows pass by design. Defects were discovered through exploratory negative testing and boundary analysis — see `/bug-reports/` for logged findings.

---

*Test Cases Version: 1.0 | Prepared by: Kevin Trimboli | Last Updated: 2025*
