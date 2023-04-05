from Conduit_code.general_model import GeneralPage
from selenium.webdriver import Chrome
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait


class HomePage(GeneralPage):

    def __init__(self, driver: Chrome, url_add):
        super().__init__(driver, url=f'http://localhost:1667/#/{url_add}')

    def cookie_panel(self):
        return self.driver.find_elements(By.ID, 'cookie-policy-panel')

    def cookie_btn(self):
        return WebDriverWait(self.driver, 5).until(EC.presence_of_all_elements_located((By.XPATH, '//button[contains(@class,"cookie__bar__buttons")]')))

    def navbar_right(self):
        return WebDriverWait(self.driver, 10).until(EC.presence_of_all_elements_located((By.XPATH, '//ul[@class="nav navbar-nav pull-xs-right"]//li[@class="nav-item"]')))

    # def switch_to(self):
    #     self.driver.switch_to.window(self.driver.window_handles[1])


class FormPage(HomePage):

    def __init__(self, driver: Chrome, url_add):
        super().__init__(driver, url_add)

    def form_field(self):
        return WebDriverWait(self.driver, 3).until(EC.presence_of_all_elements_located((By.XPATH, '//input|//textarea[contains(@class,"form-control")]')))
        # self.driver.find_elements(By.XPATH, '//input[@class="form-control form-control-lg"]')

    def button_submit(self):
        return WebDriverWait(self.driver, 3).until(EC.presence_of_element_located((By.XPATH, '//button[contains(@class,"btn-primary")]')))

    def confirmation_field(self):
        return WebDriverWait(self.driver, 3).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-text"]')))
        # self.driver.find_element(By.XPATH, '//div[@class="swal-text"]')
        # return WebDriverWait(self.driver, 5).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-text"]')))


