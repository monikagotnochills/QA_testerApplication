# Test Strategy — SauceDemo E-Commerce Application

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.

---

## 1. Purpose

This document defines the overall testing approach, tools, techniques, and standards applied across the SauceDemo QA project. It serves as the governing document for all testing activities and ensures consistency across manual and automated test execution.

---

## 2. Testing Approach

### 2.1 Risk-Based Testing
Test effort is prioritized based on business impact. The checkout and login flows receive the highest test coverage because failure in these areas directly blocks revenue.

**Priority Matrix:**
| Feature | Business Risk | Test Depth |
|---------|--------------|-----------|
| Login / Authentication | Critical | Full boundary + negative testing |
| Checkout Flow | Critical | End-to-end with all input variations |
| Cart Management | High | Add/remove/quantity edge cases |
| Product Inventory | High | Sort, filter, display accuracy |
| Navigation | Medium | All links, menu states |
| Logout | Low | Session termination only |

### 2.2 Shift-Left Testing
Test cases are authored during the requirements phase, not after development. This enables early defect detection when fixes are cheapest.

### 2.3 Automation-First for Regression
Any test that will run more than twice is a candidate for automation. Manual testing focuses on exploratory, UX, and new feature validation.

---

## 3. Test Types & Techniques

### 3.1 Functional Testing
- **Equivalence Partitioning:** Group valid/invalid inputs into classes (e.g., valid email vs. empty vs. malformed)
- **Boundary Value Analysis:** Test at the edge of input limits (e.g., max character fields)
- **Decision Table Testing:** Cover all combinations of login state + credential validity

### 3.2 Negative Testing Strategy
Every feature module includes at least 2 negative test cases:
- Empty required fields
- Invalid data format
- SQL injection attempt in form fields
- XSS attempt in text inputs

### 3.3 Exploratory Testing
- **Duration:** 60-minute time-boxed sessions
- **Charter:** "Explore [module] to discover defects related to [risk area]"
- **Output:** Session notes logged as bug reports or test case additions

---

## 4. Tools & Technologies

| Category | Tool | Version | Purpose |
|---------|------|---------|---------|
| Test Management | GitHub (Markdown) | N/A | Test cases, RTM, reporting |
| Bug Tracking | Jira-style Markdown | N/A | Defect logging and tracking |
| API Testing | Postman | Latest | REST API validation |
| API Automation | Newman (CLI) | Latest | CI-driven API test execution |
| E2E Automation | Playwright + Python | 1.40+ | Cross-browser E2E testing |
| UI Automation | Selenium WebDriver + Python | 4.x | Functional regression |
| Test Framework | Pytest | 7.x+ | Test runner, fixtures, reporting |
| Database | SQLite / MySQL (Northwind) | N/A | SQL validation queries |
| CI/CD | GitHub Actions | N/A | Automated pipeline execution |
| Reporting | pytest-html | Latest | HTML test reports |
| Version Control | Git + GitHub | N/A | Source control |

---

## 5. Test Environments

### 5.1 Manual Testing Environment
| Parameter | Configuration |
|-----------|-------------|
| Primary Browser | Chrome (latest stable) |
| Secondary Browsers | Firefox (latest), Safari (macOS) |
| Operating System | Windows 10 / macOS |
| Network | Standard broadband (no VPN) |
| Application URL | https://www.saucedemo.com |

### 5.2 Automation Environment
| Parameter | Configuration |
|-----------|-------------|
| Language | Python 3.11+ |
| Playwright Browsers | Chromium, Firefox, WebKit |
| Selenium Browser | Chrome via WebDriver Manager |
| CI Runner | GitHub Actions (ubuntu-latest) |
| Report Artifacts | HTML report uploaded per run |

### 5.3 Test Data Strategy
| User Type | Username | Use Case |
|-----------|---------|---------|
| Standard user | `standard_user` | Happy path flows |
| Locked out user | `locked_out_user` | Login rejection testing |
| Problem user | `problem_user` | UI defect detection |
| Performance glitch user | `performance_glitch_user` | Slow load testing |
| Visual user | `visual_user` | Layout/visual checks |

*All passwords: `secret_sauce`*

---

## 6. Defect Reporting Standards

All bug reports must follow the Jira-style template:
```
BUG-ID | Summary | Environment | Severity | Priority
Preconditions | Steps to Reproduce | Expected Result | Actual Result
Root Cause Hypothesis | Attachments
```

### Severity vs. Priority Distinction
- **Severity** = Technical impact on the system
- **Priority** = Business urgency of the fix
- A cosmetic bug on the homepage may be Low Severity but High Priority (brand impact)

---

## 7. Definition of Done (Test Case)

A test case is considered "done" when:
- [ ] It has a unique ID, clear title, and preconditions
- [ ] Steps are reproducible by a third party without assistance
- [ ] Expected result is measurable and specific
- [ ] Actual result is recorded after execution
- [ ] Status (Pass/Fail/Blocked) is documented
- [ ] Any defect found is linked in the RTM

---

## 8. Metrics & Reporting

| Metric | Formula | Target |
|--------|---------|--------|
| Test Case Pass Rate | (Passed / Total Executed) × 100 | ≥ 95% (Smoke) |
| Defect Detection Rate | Bugs found / Total test cases | > 0.15 |
| Test Coverage | Test cases / Requirements | 100% of P1 requirements |
| Automation Coverage | Automated TCs / Total TCs | ≥ 60% |

---

*Strategy Version: 1.0 | Prepared by: Kevin Trimboli | Last Updated: 2025*
