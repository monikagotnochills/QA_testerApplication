# Test Plan — SauceDemo E-Commerce Application

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> Application Under Test: [SauceDemo](https://www.saucedemo.com) (public demo app by Sauce Labs)

---

## 1. Introduction & Objectives

This test plan defines the strategy, scope, resources, and schedule for validating the core functionality of the SauceDemo e-commerce web application. SauceDemo is a publicly available demo site that simulates a real e-commerce purchase flow.

**Objectives:**
- Validate all critical user journeys (login → browse → cart → checkout)
- Identify functional defects before they reach production
- Ensure application behaves correctly under both positive and negative input scenarios
- Provide traceability from requirements to test cases to defects

---

## 2. Scope

### In Scope
| Module | Features Covered |
|--------|-----------------|
| Authentication | Valid login, invalid credentials, locked-out user, session handling |
| Inventory | Product listing, sorting, product detail view |
| Shopping Cart | Add item, remove item, cart badge count, persist items |
| Checkout | Address form, order summary, price totals, order completion |
| Navigation | Header, footer, hamburger menu, back navigation |

### Out of Scope
- Backend/API layer (separate API test plan)
- Payment gateway integration (mocked in demo)
- Performance and load testing
- Mobile native app testing

---

## 3. Test Strategy

### Testing Types
| Type | Purpose | Coverage |
|------|---------|----------|
| **Smoke Testing** | Verify critical path is operational | 12 tests — login, add to cart, checkout |
| **Regression Testing** | Ensure changes don't break existing functionality | 35+ tests — all modules |
| **Negative Testing** | Validate error handling and boundary conditions | Embedded in all suites |
| **Exploratory Testing** | Unscripted testing to discover unexpected behaviors | Session-based, 60 min |

### Test Levels
- **Manual Testing:** Exploratory, smoke, and regression suites
- **Automated Testing:** Playwright (Python) for E2E regression; Selenium (Python) for functional flows

### Test Environment
| Parameter | Value |
|-----------|-------|
| URL | https://www.saucedemo.com |
| Browser(s) | Chrome (primary), Firefox, Safari |
| OS | Windows 10, macOS |
| Test Data | SauceDemo built-in users (standard_user, locked_out_user, problem_user) |

---

## 4. Entry & Exit Criteria

### Entry Criteria
- Application is accessible at the target URL
- Test environment is stable (< 2 unplanned outages per session)
- Test cases have been reviewed and approved
- Test data (user credentials) is available and documented

### Exit Criteria
- 100% of Smoke Suite test cases executed
- ≥ 95% pass rate on Smoke Suite
- All **Critical** and **High** severity bugs reported with reproducible steps
- Traceability matrix (RTM) is complete
- Test summary report generated

---

## 5. Risk Management

| Risk | Likelihood | Impact | Mitigation Strategy |
|------|------------|--------|---------------------|
| Demo site instability / downtime | Medium | High | Run tests in off-peak hours; retry failed tests once before logging |
| UI selector changes breaking automation | Medium | High | Use data-test attributes; maintain locator inventory |
| Test data pollution between runs | Low | Medium | Use fresh sessions; clear cookies between test runs |
| Incomplete requirements | Low | Medium | Map all tests to observable application behavior |
| Browser compatibility differences | Medium | Low | Run cross-browser suite on Firefox and WebKit |

---

## 6. Defect Management

**Severity Definitions:**
| Severity | Definition | Example |
|----------|-----------|---------|
| Critical | Application crash or complete feature failure | Login button unresponsive |
| High | Major feature broken; no workaround | Cannot add items to cart |
| Medium | Feature partially broken; workaround exists | Sort order incorrect |
| Low | Minor cosmetic or UX issue | Misaligned button |

**Bug Lifecycle:** New → Open → In Progress → Fixed → Retest → Closed / Rejected

---

## 7. Deliverables

| Artifact | Location |
|----------|---------|
| Test Plan (this document) | `/manual-testing/test-plan.md` |
| Test Strategy | `/manual-testing/test-strategy.md` |
| Test Cases | `/manual-testing/test-cases.md` |
| Smoke Suite | `/manual-testing/smoke-suite.md` |
| Regression Suite | `/manual-testing/regression-suite.md` |
| Requirements Traceability Matrix | `/manual-testing/RTM.md` |
| Bug Reports | `/bug-reports/` |
| Defect Log | `/bug-reports/defect-log.md` |

---

## 8. Schedule & Effort Estimate

| Phase | Activity | Estimated Effort |
|-------|---------|-----------------|
| Planning | Test plan, test strategy, RTM | 4 hours |
| Design | Test case authoring (35+ cases) | 6 hours |
| Execution | Manual smoke + regression run | 8 hours |
| Reporting | Defect logging, summary report | 3 hours |

---

*Test Plan Version: 1.0 | Prepared by: Kevin Trimboli | Last Updated: 2025*
