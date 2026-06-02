from playwright.sync_api import Page, expect


class LoginPage:
    """
    Page Object Model for the SauceDemo Login page.
    Encapsulates all locators and actions for the login screen.
    URL: https://www.saucedemo.com
    """

    URL = "https://www.saucedemo.com"

    def __init__(self, page: Page):
        self.page = page
        # Locators — using data-test attributes where available (most stable)
        self.username_input = page.locator("#user-name")
        self.password_input = page.locator("#password")
        self.login_button = page.locator("#login-button")
        self.error_banner = page.locator("[data-test='error']")
        self.error_dismiss = page.locator(".error-button")

    def load(self) -> "LoginPage":
        """Navigate to the login page."""
        self.page.goto(self.URL)
        return self

    def login(self, username: str, password: str) -> None:
        """Enter credentials and submit the login form."""
        self.username_input.fill(username)
        self.password_input.fill(password)
        self.login_button.click()

    def get_error_message(self) -> str:
        """Return the text of the error banner if visible."""
        return self.error_banner.inner_text()

    def dismiss_error(self) -> None:
        """Click the X button to close the error banner."""
        self.error_dismiss.click()

    def assert_on_login_page(self) -> None:
        """Assert the login form is visible (used after logout/redirect)."""
        expect(self.login_button).to_be_visible()
        expect(self.username_input).to_be_visible()