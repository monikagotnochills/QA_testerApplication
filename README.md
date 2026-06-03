```markdown
# QA Testing Portfolio

![Playwright Tests](https://github.com/monikagotnochills/QA_testerApplication/actions/workflows/playwright.yml/badge.svg)
![Selenium Tests](https://github.com/monikagotnochills/QA_testerApplication/actions/workflows/selenium.yml/badge.svg)

A hands-on QA Engineering portfolio demonstrating manual testing, test automation, API testing, database validation, and CI/CD integration — built to reflect real-world QA workflows.

---

## Skills Demonstrated

| Area | Tools & Techniques |
|---|---|
| Manual Testing | Test Plans, Test Cases, RTM, Smoke & Regression Suites |
| Automation | Playwright (JavaScript), Selenium (Python + Pytest) |
| API Testing | Postman, Newman, REST (GET/POST/PUT/DELETE) |
| Database Testing | SQL — data integrity, null checks, duplicate detection |
| Bug Reporting | Jira-style defect reports with severity & reproduction steps |
| CI/CD | GitHub Actions — automated test runs on every push |
| AI-Assisted QA | Prompt engineering for test generation & root cause analysis |

---

## Repository Structure

```
QA_testerApplication/
├── manual-testing/         # Test plan, test cases, RTM, smoke & regression suites
├── automation_playwright/  # Playwright E2E framework with Page Object Model
├── automation_selenium/    # Selenium + Pytest framework with POM
├── api-testing/            # Postman collections, Newman reports, API test docs
├── database-testing/       # SQL validation queries with comments
├── bug-reports/            # Jira-style defect reports (Critical to Low)
├── ai-qa/                  # AI-assisted test generation & prompt library
├── evidence/               # Screenshots, videos, execution logs
├── jira/                   # Traceability matrix & project test management docs
└── .github/workflows/      # CI/CD pipelines (Playwright + Selenium)
```

---

## Test Coverage — ShopEase E-Commerce App

| Feature | Manual TCs | Automated | API Tests | Status |
|---|---|---|---|---|
| Registration | 5 | ✅ | ✅ | Covered |
| Login | 6 | ✅ | ✅ | Covered |
| Search | 4 | ✅ | ✅ | Covered |
| Cart | 5 | ✅ | — | Covered |
| Checkout | 5 | ✅ | ✅ | Covered |
| Payment | 3 | — | ✅ | Covered |

---

## Automation Frameworks

### Playwright (JavaScript)
- Page Object Model architecture
- Cross-browser: Chromium, Firefox, WebKit
- HTML reports + screenshots on failure
- Parallel test execution

```bash
cd automation_playwright
npm install
npx playwright test
npx playwright show-report
```

### Selenium (Python + Pytest)
- Page Object Model with fixtures
- Logging + HTML report generation
- Parametrized test cases

```bash
cd automation_selenium
pip install -r requirements.txt
pytest --html=report.html
```

---

## API Testing

Built against REST APIs using Postman + Newman.

- ✅ Positive, negative, boundary, and error handling tests
- ✅ Schema validation
- ✅ Newman CLI reports

```bash
cd api-testing
newman run postman-collection.json -e environment.json --reporters html
```

---

## Database Testing

SQL validation scripts covering:
- Duplicate user detection
- Null/missing field checks
- Orphaned records
- Inventory threshold alerts
- Order total vs line item reconciliation

---

## Bug Reports

5 sample defect reports marked as [SAMPLE ARTIFACT] covering:

| Bug ID | Summary | Severity |
|---|---|---|
| BUG-01 | Checkout fails with valid card | Critical |
| BUG-02 | Rate limit not enforced on login | High |
| BUG-03 | Search returns irrelevant results | High |
| BUG-04 | Cart quantity not updating | Medium |
| BUG-05 | Incorrect success message on invalid email | Low |

---

## CI/CD

GitHub Actions runs on every push to main:
- Installs dependencies
- Executes Playwright tests
- Executes Selenium/Pytest tests
- Uploads HTML reports as artifacts

## Contact
mail: ms3319341@gmail.com
GitHub: https://github.com/monikagotnochills
```
