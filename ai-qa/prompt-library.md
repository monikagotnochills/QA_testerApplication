# AI-Assisted QA Prompt Library

> **[SAMPLE ARTIFACT]** — Created for QA portfolio demonstration purposes.  
> This directory showcases how I leverage LLMs (ChatGPT, Claude) to accelerate test creation, analyze requirements, and identify edge cases.

---

## 🚀 How I Use AI in QA

1. **Test Case Generation:** Transforming user stories into structured Gherkin/BDD scenarios or standard test cases.
2. **Boundary & Edge Case Discovery:** Asking the LLM to identify edge cases a human might miss.
3. **Data Generation:** Creating complex JSON payloads, SQL mock data, or edge-case string generators.
4. **Regex & Scripting:** Quickly generating complex regular expressions or boilerplate code for automation frameworks.
5. **Root Cause Analysis:** Feeding server logs or error stack traces to identify potential defect sources.

*Note: AI is a copilot, not an autopilot. All AI-generated outputs are manually reviewed and executed to ensure validity.*

---

## 📚 Prompt Library

### 1. Requirements to Test Cases
**Context:** Used during Sprint Planning / Backlog Refinement.

> **Prompt:**  
> Act as a Senior QA Engineer. Analyze the following user story and acceptance criteria.  
> 1. Identify any ambiguities or missing requirements.  
> 2. Generate a comprehensive list of test scenarios (Positive, Negative, Boundary).  
> 3. Format the output as a Markdown table with columns: ID, Type, Scenario Description, Expected Result.  
>  
> [PASTE USER STORY HERE]

---

### 2. Edge Case Discovery
**Context:** Used when testing complex business logic (e.g., date calculations, financial transactions).

> **Prompt:**  
> I am testing a feature that [DESCRIBE FEATURE, e.g., calculates shipping cost based on weight and destination zone].  
> The rules are: [PASTE RULES].  
> Please list the top 10 edge cases and boundary conditions I must test. Focus on edge cases that are likely to break the system (e.g., negative values, nulls, exact boundary limits, concurrent inputs).

---

### 3. API Payload Generation (Negative Testing)
**Context:** Used when preparing API tests in Postman.

> **Prompt:**  
> Here is a valid JSON payload for a POST request to create a User profile:  
> [PASTE JSON]  
> Generate 5 variations of this JSON specifically designed for negative testing. Include scenarios like: missing required fields, invalid data types, SQL injection strings, extremely long strings, and malformed JSON structure. Explain what each payload is testing.

---

### 4. XPath/CSS Locator Strategy
**Context:** Used when encountering a difficult DOM structure in UI automation.

> **Prompt:**  
> I need to select a button in Playwright, but it has no ID or unique class, and its text changes dynamically. Here is the HTML snippet of the parent container:  
> [PASTE HTML]  
> Provide 3 different locator strategies (CSS or XPath) to reliably target the `<button>` element. Rank them from most resilient to least resilient.

---

### 5. Log Analysis for Defect Reporting
**Context:** Used when an API returns a 500 error and I need to write a descriptive bug report.

> **Prompt:**  
> Act as a backend developer assisting QA. I received a 500 Internal Server Error when submitting a checkout form. Here is the stack trace from the server logs:  
> [PASTE LOG]  
> Analyze this log and summarize the root cause in plain English. Then, provide a hypothesis I can include in my Jira bug report to help the development team fix it faster.

---

## 📂 Sample Outputs

*Example outputs from these prompts will be added to the `/ai-qa/sample-outputs/` directory.*
