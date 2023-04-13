import time
import allure
import Conduit_code.configuration as config
from page_model import FormPage
from selenium.webdriver.common.by import By
import csv

test_data = {
    'Username': 'ab',
    'Email': 'ab@gmail.com',
    'Password': 'Abcdefg1',
    "Article Title": 'Title of article',
    "What's this article about?": 'Article about an idea',
    "Write your article (in markdown)": 'Interesting idea',
    "Enter tags": 'lorum',
    "Modified_data": 'modified'
}


class TestConduitPage:

    def setup_method(self):
        self.page = FormPage(driver=config.get_preconfigured_chrome_driver())

    def teardown_method(self):
        self.page.close()

    # Function to search the title of an article in all pages. It takes in a key for the dictionary for test data,
    # and compares it to the actual title in the cycle. Returns a variable whether the target was found.
    def search_article(self, key):
        found = 0
        for actual_page in self.page.pagination():
            time.sleep(2)
            for actual_article in self.page.article_text():
                time.sleep(0.7)
                if actual_article.text.split('\n')[0] == test_data[key]:
                    actual_article.click()
                    found += 1
                    break
            if not found == 0:
                break
            else:
                actual_page.click()
                time.sleep(1)
        return found

    @allure.id('CON_ATC_01')
    @allure.title('Accept cookies')
    @allure.description('It calls the subpage opening function of POM (Page Object Model), which '
                        'includes accepting cookies.\nAssert: whether the cookie panel appears after page refresh.')
    def test_cookie(self):
        self.page.open_sub('register')
        time.sleep(2)
        self.page.refresh()
        assert self.page.cookie_panel() == []

    @allure.id('CON_ATC_02')
    @allure.title('Sign up - proper data')
    def test_signup(self):
        self.page.open_sub('register')
        self.page.fill_form(test_data)
        time.sleep(2)
        assert "Your registration was successful" in self.page.confirmation_field().text

    @allure.id('CON_ATC_03')
    @allure.title('Sign in - proper data')
    def test_login(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(2)
        assert self.page.navbar_right()[-2].text == test_data["Username"]

    @allure.id('CON_ATC_04')
    @allure.title('Collecting data into list')
    def test_datalist(self):
        list_titles = []
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(1)
        for article in self.page.article_text():
            list_titles.append(article.get_attribute('innerText').split('\n')[0])
        assert not list_titles == []

    @allure.id('CON_ATC_05')
    @allure.title('Visit all pages')
    def test_pagination(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(1)
        for actual_page in self.page.pagination():
            actual_page.click()
        assert 'active' in self.page.pagination()[-1].find_element(By.XPATH, "..").get_attribute('className')

    @allure.id('CON_ATC_06')
    @allure.title('New data entry')
    def test_new_data(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(2)
        self.page.navbar_right()[1].click()
        self.page.fill_form(test_data)
        time.sleep(1)
        assert "Post Comment" in self.page.button_submit().get_attribute("innerText")

    @allure.id('CON_ATC_07')
    @allure.title('Modify entered data')
    def test_modify_data(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(2)

        self.search_article("Article Title")
        time.sleep(1)
        self.page.button_article()[0].click()
        time.sleep(1)

        self.page.form_field()[0].clear()
        self.page.form_field()[0].send_keys(test_data["Modified_data"])
        time.sleep(1)
        self.page.button_submit().click()
        time.sleep(1)
        self.page.navbar_right()[0].click()
        time.sleep(1)
        assert not self.search_article("Modified_data") == 0
        time.sleep(1)

    @allure.id('CON_ATC_08')
    @allure.title('Delete entered, modified data')
    def test_delete_data(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(2)

        self.search_article("Modified_data")
        time.sleep(2)

        self.page.button_article()[1].click()
        time.sleep(2)

        assert self.search_article("Modified_data") == 0
        time.sleep(1)

    @allure.id('CON_ATC_09')
    @allure.title('Enter data from file')
    def test_data_from_file(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        self.page.article_text()[0].click()
        comments = []
        with open('./Conduit_code/test_data.csv', 'r') as file:
            test_data_file = csv.DictReader(file, delimiter=',')
            for row in test_data_file:
                for count in range(3):
                    time.sleep(0.5)
                    self.page.form_field()[0].send_keys(
                        f"{row[self.page.form_field()[0].get_property('placeholder') + str(count + 1)]}")
                    comments.append(f"{row[self.page.form_field()[0].get_property('placeholder') + str(count + 1)]}")
                    time.sleep(0.5)
                    self.page.button_submit().click()

        self.page.refresh()
        for count, comment in enumerate(self.page.card_field()):
            assert comment.text == comments[count]

    @allure.id('CON_ATC_10')
    @allure.title('Save data to file')
    def test_data_to_file(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(2)
        self.page.navbar_right()[2].click()

        settings_keys = []
        settings_dict = {}
        for count, data in enumerate(self.page.form_field()[:-1]):
            settings_keys.append(data.get_property("placeholder"))
            settings_dict[f'{data.get_property("placeholder")}'] = data.get_property("value")

        with open('./Conduit_code/settings.csv', 'w') as file:
            writer = csv.DictWriter(file, fieldnames=settings_keys, lineterminator='\n')
            writer.writeheader()
            writer.writerow(settings_dict)

        with open('./Conduit_code/settings.csv', 'r') as file:
            settings_file = csv.DictReader(file, delimiter=',')
            for row in settings_file:
                print(row, settings_dict)
                assert row == settings_dict

    @allure.id('CON_ATC_11')
    @allure.title('Logout')
    def test_logout(self):
        self.page.open_sub('login')
        self.page.fill_form(test_data)
        time.sleep(2)
        self.page.navbar_right()[-1].click()
        time.sleep(1)
        assert self.page.navbar_right()[1].text == "Sign in"
