from playwright.sync_api import Page, expect

class InventoryPage:
    """
    Page Object Model for the SauceDemo Inventory/Products page.
    """

    def __init__(self, page: Page):
        self.page = page
        
        # Locators
        self.header_title = page.locator(".title")
        self.shopping_cart_link = page.locator(".shopping_cart_link")
        self.shopping_cart_badge = page.locator(".shopping_cart_badge")
        self.sort_dropdown = page.locator("[data-test='product_sort_container']")
        self.product_items = page.locator(".inventory_item")
        
        # Menu Locators
        self.burger_button = page.locator("#react-burger-menu-btn")
        self.logout_link = page.locator("#logout_sidebar_link")
        self.reset_link = page.locator("#reset_sidebar_link")

    def get_product_by_name(self, product_name: str):
        """Returns the specific product locator based on its name."""
        return self.product_items.filter(has_text=product_name)

    def add_to_cart_by_name(self, product_name: str) -> None:
        """Finds a product by name and clicks its 'Add to cart' button."""
        product = self.get_product_by_name(product_name)
        product.locator("button:has-text('Add to cart')").click()

    def remove_from_cart_by_name(self, product_name: str) -> None:
        """Finds a product by name and clicks its 'Remove' button."""
        product = self.get_product_by_name(product_name)
        product.locator("button:has-text('Remove')").click()

    def add_first_available_item(self) -> None:
        """Adds the first item in the inventory list to the cart."""
        self.product_items.first.locator("button").click()

    def sort_by(self, option_value: str) -> None:
        """
        Sorts the inventory list.
        Valid options: 'az', 'za', 'lohi', 'hilo'
        """
        self.sort_dropdown.select_option(option_value)

    def logout(self) -> None:
        """Opens the hamburger menu and clicks Logout."""
        self.burger_button.click()
        self.logout_link.click()

    def open_cart(self) -> None:
        """Clicks the shopping cart icon to navigate to the cart page."""
        self.shopping_cart_link.click()