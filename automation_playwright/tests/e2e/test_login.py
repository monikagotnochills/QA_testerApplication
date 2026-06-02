from pages.login_page import LoginPage
from playwright.sync_api import expect
import pytest

# ─────────────────────────────────────────────
# Login Module Tests (Authentication)
# ─────────────────────────────────────────────

def test_successful_login(page, test_data):
    """
    Test Case: TC-001 | Priority: P1
    Validates that a user can log in with valid credentials and is redirected.
    """
    login_page = LoginPage(page)
    login_page.load()
    
    # Act
    login_page.login(
        test_data["users"]["standard"]["username"],
        test_data["users"]["standard"]["password"]
    )
    
    # Assert
    page.wait_for_url("**/inventory.html")
    expect(page.locator(".title")).to_have_text("Products")


def test_locked_out_user(page, test_data):
    """
    Test Case: TC-002 | Priority: P1
    Validates that a locked out user cannot log in and sees the correct error.
    """
    login_page = LoginPage(page)
    login_page.load()
    
    # Act
    login_page.login(
        test_data["users"]["locked"]["username"],
        test_data["users"]["locked"]["password"]
    )
    
    # Assert
    expect(login_page.error_banner).to_be_visible()
    assert "locked out" in login_page.get_error_message()


def test_invalid_password(page, test_data):
    """
    Test Case: TC-003 | Priority: P1
    Validates that login fails with incorrect password.
    """
    login_page = LoginPage(page)
    login_page.load()
    
    # Act
    login_page.login(test_data["users"]["standard"]["username"], "wrong_password_123")
    
    # Assert
    expect(login_page.error_banner).to_be_visible()
    assert "Username and password do not match" in login_page.get_error_message()


@pytest.mark.parametrize("username, password, expected_error", [
    ("", "secret_sauce", "Username is required"),
    ("standard_user", "", "Password is required"),
    ("", "", "Username is required"),
])
def test_login_validation_errors(page, username, password, expected_error):
    """
    Test Cases: TC-004, TC-005, TC-006 | Priority: P1
    Data-driven test to validate all empty field error states.
    """
    login_page = LoginPage(page)
    login_page.load()
    
    # Act
    login_page.login(username, password)
    
    # Assert
    expect(login_page.error_banner).to_be_visible()
    assert expected_error in login_page.get_error_message()


def test_logout(authenticated_page):
    """
    Test Case: TC-007 | Priority: P1
    Validates that a logged in user can log out successfully.
    """
    from pages.inventory_page import InventoryPage
    
    # We start already logged in via the authenticated_page fixture
    inventory_page = InventoryPage(authenticated_page)
    
    # Act
    inventory_page.logout()
    
    # Assert
    login_page = LoginPage(authenticated_page)
    login_page.assert_on_login_page()
