# BUG-10 — [CRITICAL] Session Token Not Invalidated After Logout

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> **Application Under Test:** https://www.saucedemo.com

---

## Bug Summary

| Field | Value |
|-------|-------|
| **Bug ID** | BUG-10 |
| **Summary** | After logout, the browser back button allows re-access to protected inventory page without re-authentication |
| **Module** | Authentication — Session Management |
| **Environment** | Chrome 120 / Windows 10 / https://www.saucedemo.com |
| **Severity** | **Critical** |
| **Priority** | **P1** |
| **Status** | Open |
| **Reported By** | Kevin Trimboli |
| **Date Reported** | 2025-01-12 |

---

## Preconditions

- User is logged in as `standard_user`
- Browser history contains the `/inventory.html` URL

---

## Steps to Reproduce

1. Log in with `standard_user` / `secret_sauce`
2. Navigate to the inventory page (confirm you see product listing)
3. Open hamburger menu → Click **Logout**
4. Confirm you are redirected to the login page
5. Press the browser **Back** button

---

## Expected Result

User should be redirected to the login page. The `/inventory.html` page should not be accessible after logout. Session should be fully invalidated server-side.

---

## Actual Result

The browser displays the cached `/inventory.html` page. The user can see the product listing and interact with the cart without being logged in. The session appears to be client-side only.

---

## Evidence

- Screenshot (back button bypass): `../evidence/BUG-10-session-back-button.png`

---

## Root Cause Hypothesis

The application uses **client-side session management** (likely a cookie or localStorage flag) that is cleared on logout, but the browser **caches the page response**. The server does not validate session tokens on every protected page request, so cached responses bypass the auth check.

**Recommended Fix:**
1. Implement server-side session invalidation on logout
2. Set `Cache-Control: no-store` headers on all authenticated pages
3. Validate session token on every request to protected routes (not just on initial load)
4. Implement short-lived JWTs with server-side token revocation list

---

## Impact

- **Security Risk:** High — shared computers (library, office) expose other users' sessions
- **Compliance Risk:** May violate OWASP Session Management standards (ASVS Level 2)
- **Test Value:** Demonstrates security testing mindset — OWASP Top 10 session fixation awareness

---

*Bug Report Version: 1.0 | Reported by: Kevin Trimboli*
