from Conduit_code.general_model import GeneralPage
from selenium.webdriver import Chrome
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait


# Model for the main homepage deriving from GeneralPage, parent of Formpage subpages defined below
class HomePage(GeneralPage):

    def __init__(self, driver: Chrome):
        super().__init__(driver, url=f'http://localhost:1667/#/')

    # it concatenates the appropriate ending to base url to call the targeted subpage, and accepts cookies
    def open_sub(self, url_add):
        self.driver.get(f"http://localhost:1667/#/{url_add}")
        self.cookie_btn()[1].click()

    # Definition of several fields and buttons in pages
    def cookie_panel(self):
        return self.driver.find_elements(By.ID, 'cookie-policy-panel')

    def cookie_btn(self):
        return WebDriverWait(self.driver, 5).until(
            EC.presence_of_all_elements_located((By.XPATH, '//button[contains(@class,"cookie__bar__buttons")]')))

    def navbar_right(self):
        return WebDriverWait(self.driver, 10).until(EC.presence_of_all_elements_located(
            (By.XPATH, '//ul[@class="nav navbar-nav pull-xs-right"]//li[@class="nav-item"]')))

    def article_text(self):
        return WebDriverWait(self.driver, 5).until(
            EC.presence_of_all_elements_located((By.XPATH, '//a[@class="preview-link"]')))

    def pagination(self):
        return WebDriverWait(self.driver, 5).until(
            EC.presence_of_all_elements_located((By.XPATH, '//a[@class="page-link"]')))


# Model for subpages containing forms, deriving from Homepage:
class FormPage(HomePage):

    def __init__(self, driver: Chrome):
        super().__init__(driver)

    # Definition of several fields and buttons in subpages
    def form_field(self):
        return WebDriverWait(self.driver, 3).until(
            EC.presence_of_all_elements_located((By.XPATH, '//input|//textarea[contains(@class,"form-control")]')))

    def card_field(self):
        return WebDriverWait(self.driver, 3).until(
            EC.presence_of_all_elements_located((By.XPATH, '//p[@class="card-text"]')))

    def button_submit(self):
        return WebDriverWait(self.driver, 3).until(
            EC.presence_of_element_located((By.XPATH, '//button[contains(@class,"btn-primary")]')))

    def confirmation_field(self):
        return WebDriverWait(self.driver, 3).until(
            EC.presence_of_element_located((By.XPATH, '//div[@class="swal-text"]')))

    def button_article(self):
        return WebDriverWait(self.driver, 3).until(
            EC.presence_of_all_elements_located((By.XPATH, '//*[contains(@class,"btn-outline")]')))

    # Fills the form-like fields on a subpage using the 'placeholder' property as key for the test data value.
    def fill_form(self, test_data):
        for field in self.form_field():
            field.send_keys(f"{test_data[field.get_property('placeholder')]}")

        self.button_submit().click()
