# BUG-01 — Registration Form Accepts Single Dash "-" as Valid Name

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> **Application Under Test:** https://demo.opencart.com

---

## Bug Summary

| Field | Value |
|-------|-------|
| **Bug ID** | BUG-01 |
| **Summary** | Registration form accepts a single dash character `"-"` as a valid First Name and Last Name |
| **Module** | User Registration — Input Validation |
| **Environment** | Chrome (latest) / Windows 10 / https://demo.opencart.com |
| **Severity** | Medium |
| **Priority** | P2 |
| **Status** | Open |
| **Reported By** | Kevin Trimboli |
| **Date Reported** | 2025-01-10 |

---

## Preconditions

- Application is accessible at https://demo.opencart.com
- User is on the Register Account page (`/index.php?route=account/register`)

---

## Steps to Reproduce

1. Navigate to https://demo.opencart.com
2. Go to **My Account → Register**
3. In the **First Name** field, enter exactly: `-`
4. In the **Last Name** field, enter exactly: `-`
5. Fill remaining required fields with valid data (valid email, password, etc.)
6. Accept the Privacy Policy checkbox
7. Click **Continue**

---

## Expected Result

The registration form should reject the input. A validation error should appear such as:
> *"First Name must contain only alphabetic characters and must be at least 1 character long."*

User account should **not** be created.

---

## Actual Result

The form accepts `-` as valid data for both First Name and Last Name. The account is created successfully with a dash as the user's name. No validation error is displayed.

---

## Evidence

- Screenshot: `../evidence/BUG-01.png`

---

## Root Cause Hypothesis

The input validation for the name fields likely uses a regex that checks for **non-empty string** only (e.g., `length > 0`), rather than enforcing a character whitelist (e.g., `[A-Za-z\s\-]{2,}`). The backend/form validation does not strip or reject special characters in name fields.

**Recommended Fix:** Apply server-side and client-side validation requiring name fields to contain at least 2 alphabetic characters and reject strings consisting solely of special characters.

---

## Impact

- **Data Integrity:** User records with `-` as names pollute the database and may break downstream processes (e.g., greeting emails, PDF generation, CRM sync).
- **Business Risk:** Low — but contributes to poor data quality at scale.

---

*Bug Report Version: 1.0 | Reported by: Kevin Trimboli*
