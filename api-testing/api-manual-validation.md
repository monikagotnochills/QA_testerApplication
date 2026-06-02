# API Testing — Manual Validation & Postman Suite

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> **Base URL:** https://jsonplaceholder.typicode.com  
> **Tools:** Postman (collection), Newman (CLI runner)

---

## Project Overview

This project validates a public REST API using **Postman** for manual exploration and **Newman** for automated CI-driven execution. The test suite covers all four HTTP methods (GET, POST, PUT, DELETE), positive and negative scenarios, boundary conditions, and business logic validation.

**Collection File:** [`postman-collection.json`](./postman-collection.json)  
**Execution Report:** [`newman-report.md`](./newman-report.md)

---

## Test Coverage Matrix

| Method | Endpoint | Test Type | Expected Status | Result |
|--------|----------|-----------|----------------|--------|
| GET | `/posts` | Positive — list all | 200 | ✅ Pass |
| GET | `/posts/1` | Positive — get by ID | 200 | ✅ Pass |
| GET | `/posts/999` | **Negative** — non-existent ID | 404 | ✅ Pass |
| GET | `/posts?userId=1` | Boundary — query filter | 200 + filter works | ✅ Pass |
| POST | `/posts` | Positive — create resource | 201 + ID returned | ✅ Pass |
| POST | `/posts` | **Negative** — missing `title` field | 400 | ⚠️ Defect (returns 201) |
| POST | `/posts` | **Business Logic** — negative price | 400 | ❌ BUG-08 (returns 201) |
| PUT | `/posts/1` | Positive — full update | 200 + updated data | ✅ Pass |
| DELETE | `/posts/1` | Positive — delete resource | 200/204 | ✅ Pass |
| DELETE | `/posts/999` | **Negative** — delete non-existent | 404 | ⚠️ Returns 200 (documented) |

---

## Test Design Rationale

### Why test GET with a non-existent ID?
A common API defect is returning `200 OK` with an empty body instead of `404 Not Found` for missing resources. This breaks client-side error handling logic.

### Why test POST with a missing required field?
Input validation is a critical API contract. If the API accepts requests with missing fields, it can lead to null pointer exceptions, database constraint violations, or corrupted data downstream.

### Why test POST with a negative price? (BUG-08)
Business logic validation must exist at the API layer, not just the UI. A front-end may prevent negative prices via form validation, but if the API doesn't enforce it, a developer or malicious actor can bypass the UI and submit invalid data directly.

### Why test DELETE on a non-existent resource?
Idempotent DELETE should return 404 if the resource doesn't exist. Returning 200 for a non-existent delete is misleading to API consumers.

---

## Assertions Used

Every test includes assertions for:
- **Status Code** — correct HTTP response code
- **Response Schema** — correct fields and data types
- **Data Integrity** — submitted data is echoed correctly
- **Response Time** — < 1000ms threshold
- **Content-Type Header** — confirms JSON response

---

## Newman CLI Execution

```bash
# Install dependencies
npm install -g newman newman-reporter-htmlextra

# Run full suite
newman run api-testing/postman-collection.json \
  --reporters cli,htmlextra \
  --reporter-htmlextra-export api-testing/newman-report.html

# Run in CI (exit code 0 = pass, 1 = failures)
newman run api-testing/postman-collection.json --suppress-exit-code
```

**Latest Run Results:** See [`newman-report.md`](./newman-report.md)  
- Total: 9 requests | 28 assertions | 25 passed | 3 known defects documented

---

## Bug Discovered Through API Testing

| Bug ID | Summary | Severity | Method |
|--------|---------|---------|--------|
| [BUG-08](../bug-reports/BUG-08-api-negative-price-acceptance.md) | API accepts negative price values | High | POST |

---

*API Testing Version: 1.0 | Prepared by: Kevin Trimboli | Last Updated: 2025*
