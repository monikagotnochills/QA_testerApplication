# Kevin Trimboli | QA Automation Engineer & SDET
> **Ensuring software reliability across UI, API, and Database layers.**

[![Playwright Tests](https://github.com/monikagotnochhills/onchain_backend-/actions/workflows/playwright.yml/badge.svg)](https://github.com/monikagotnochhills/onchain_backend-/actions/workflows/playwright.yml)
[![Selenium Tests](https://github.com/monikagotnochhills/onchain_backend-/actions/workflows/selenium.yml/badge.svg)](https://github.com/monikagotnochhills/onchain_backend-/actions/workflows/selenium.yml)

**Email:** trimboli.it@gmail.com | **Location:** Italy 🇮🇹 | **Languages:** Spanish (Native), English (Professional), Italian (Learning)

---

## 🎯 Professional Summary
QA Engineer focused on the full Software Testing Life Cycle (STLC). Experienced in designing comprehensive manual test strategies, validating database integrity via SQL, testing REST APIs with Postman, and building automated E2E frameworks from scratch using Python (Playwright & Selenium). Strong advocate for shift-left testing and defect traceability.

---

## 🛠️ Skills Matrix

| Skill Area | Tools & Technologies | Evidence Link |
|------------|----------------------|---------------|
| **Manual Testing** | Test Plans, Test Cases, RTM, Jira | [Manual Test Suite](./manual-testing/) |
| **Defect Management**| Bug reporting, Severity/Priority analysis | [Defect Log](./bug-reports/defect-log.md) |
| **API Testing** | Postman, Newman, REST methods | [API Postman Suite](./api-testing/api-manual-validation.md) |
| **E2E Automation** | Playwright, Python, Pytest, POM | [Playwright Framework](./automation_playwright/) |
| **UI Automation** | Selenium WebDriver, Python, POM | [Selenium Framework](./automation_selenium/) |
| **Database QA** | SQL, SQLite, Northwind schema | [SQL Validation Queries](./database-testing/validation-queries.sql) |
| **CI/CD Pipelines** | GitHub Actions, Automated reporting | [.github/workflows](./.github/workflows/) |
| **Modern QA** | AI-Assisted QA, Prompt Engineering | [AI Prompt Library](./ai-qa/prompt-library.md) |

---

## 🧪 Project Coverage: SauceDemo & OpenCart

This portfolio uses real, public e-commerce demo applications (SauceDemo and OpenCart) to demonstrate QA methodologies. 

**Test Coverage Highlights:**
- **Manual Smoke & Regression:** 40+ test cases mapping to business requirements.
- **Defects Found:** 10 logged bugs including 2 Critical security/logic flaws.
- **API Coverage:** Full CRUD lifecycle validation against JSONPlaceholder.
- **Data Integrity:** 16 complex SQL queries detecting data anomalies.

---

## 🚀 Automation Frameworks

### 1. Playwright (Python + Pytest)
Modern, fast E2E testing framework utilizing the Page Object Model (POM) and fixtures.
```bash
cd automation_playwright
pip install -r requirements.txt
playwright install
pytest --html=report.html
```

### 2. Selenium WebDriver (Python + Pytest)
Classic functional UI testing framework.
```bash
cd automation_selenium
pip install -r requirements.txt
pytest --html=report.html
```

---

## 📂 Repository Structure

```text
qa-portfolio-main/
├── .github/workflows/       # CI/CD pipelines for Playwright & Selenium
├── manual-testing/          # Test Plan, Strategy, Test Cases, RTM
├── bug-reports/             # Defect log and Jira-style bug reports
├── api-testing/             # Postman collection & Newman CLI report
├── automation_playwright/   # Playwright + Pytest framework (POM)
├── automation_selenium/     # Selenium WebDriver framework
├── database-testing/        # SQL validation queries (Nulls, Duplicates, Integrity)
├── ai-qa/                   # AI Prompt Library for QA workflows
└── evidence/                # Screenshots and videos backing up defects/tests
```

---

## 🎤 Interview-Ready QA Answers

**1. "How do you decide what to automate?"**
> *I follow a risk-based and ROI-driven approach. I automate the Smoke Suite and highly repetitive regression paths (like Login and Checkout). I leave exploratory testing, UX validation, and rapidly changing new features to manual testing.*

**2. "Walk me through how you report a bug."**
> *I first ensure the bug is reproducible. Then, I log it with a clear summary, environment details, preconditions, exact steps to reproduce, expected vs. actual results, and visual evidence. I also include a Root Cause Hypothesis to help developers debug faster, as seen in my [Critical Bug Reports](./bug-reports/).*

**3. "How do you test an API before the UI is ready?"**
> *I review the API documentation (Swagger/OpenAPI) and create a Postman collection. I start with positive CRUD tests (200, 201, 204), then move to negative testing (400, 401, 404)—like sending missing fields or incorrect data types. Finally, I run the suite via Newman in CI, as demonstrated in my [API section](./api-testing/api-manual-validation.md).*
