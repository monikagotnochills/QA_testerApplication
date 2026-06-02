import pytest
import os
from playwright.sync_api import sync_playwright

# ─────────────────────────────────────────────
# Configuration — loaded from environment or .env.example defaults
# ─────────────────────────────────────────────
BASE_URL = os.getenv("BASE_URL", "https://www.saucedemo.com")
STANDARD_USER = os.getenv("STANDARD_USER", "standard_user")
LOCKED_USER = os.getenv("LOCKED_USER", "locked_out_user")
PROBLEM_USER = os.getenv("PROBLEM_USER", "problem_user")
PASSWORD = os.getenv("APP_PASSWORD", "secret_sauce")
HEADLESS = os.getenv("HEADLESS", "true").lower() == "true"
SLOW_MO = int(os.getenv("SLOW_MO", "0"))


# ─────────────────────────────────────────────
# Base page fixture — provides a clean browser page per test
# ─────────────────────────────────────────────
@pytest.fixture(scope="function")
def page(browser):
    """
    Provides a fresh browser page for each test.
    Automatically closes after test completes (pass or fail).
    """
    context = browser.new_context(
        viewport={"width": 1280, "height": 720},
        record_video_dir="test-results/videos/" if os.getenv("RECORD_VIDEO") else None,
    )
    page = context.new_page()
    yield page
    context.close()


# ─────────────────────────────────────────────
# Authenticated page fixture — logs in before test runs
# ─────────────────────────────────────────────
@pytest.fixture(scope="function")
def authenticated_page(page):
    """
    Pre-authenticated page fixture. Navigates to the app and logs in
    as standard_user before handing the page to the test.

    Usage:
        def test_something(authenticated_page):
            # page is already logged in
    """
    page.goto(BASE_URL)
    page.fill("#user-name", STANDARD_USER)
    page.fill("#password", PASSWORD)
    page.click("#login-button")
    page.wait_for_url("**/inventory.html")
    yield page


# ─────────────────────────────────────────────
# Test data fixture — shared across tests
# ─────────────────────────────────────────────
@pytest.fixture(scope="session")
def test_data():
    """
    Central test data store. Avoids magic strings scattered across tests.
    """
    return {
        "users": {
            "standard": {"username": STANDARD_USER, "password": PASSWORD},
            "locked": {"username": LOCKED_USER, "password": PASSWORD},
            "problem": {"username": PROBLEM_USER, "password": PASSWORD},
        },
        "checkout": {
            "first_name": "Kevin",
            "last_name": "Tester",
            "zip_code": "12345",
        },
        "products": {
            "backpack": "Sauce Labs Backpack",
            "bike_light": "Sauce Labs Bike Light",
            "bolt_tshirt": "Sauce Labs Bolt T-Shirt",
        },
        "base_url": BASE_URL,
    }
