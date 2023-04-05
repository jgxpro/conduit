import time

import Conduit_code.configuration as config
from page_model import FormPage

test_data = {
    'Username': 'ab',
    'Email': 'ab@gmail.com',
    'Password': 'Abcdefg1',
    "Article Title": 'Title of article',
    "What's this article about?": 'Arcticle about an idea',
    "Write your article (in markdown)": 'Interesting idea',
    "Enter tags": 'lorum'
}


def fill_form():
    for field in page.form_field():
        field.send_keys(f"{test_data[field.get_property('placeholder')]}")

    page.button_submit().click()

## Sign up
page = FormPage(driver=config.get_preconfigured_chrome_driver(), url_add='register')

page.open()
page.cookie_btn()[1].click()
time.sleep(2)
page.refresh()
assert page.cookie_panel() == []

fill_form()
time.sleep(2)
print(page.confirmation_field().text)
assert "Email already taken." in page.confirmation_field().text
# assert "Your registration was successful" in page.confirmation_field().text
# <button class="swal-button swal-button--confirm">OK</button>
page.close()

## Sign in
page = FormPage(driver=config.get_preconfigured_chrome_driver(), url_add='login')

page.open()
page.cookie_btn()[1].click()

fill_form()
# page.button_submit().click()
time.sleep(2)
print(page.navbar_right()[-2].text, test_data["Username"])
assert page.navbar_right()[-2].text == test_data["Username"]

'''
##New element
time.sleep(2)
page.navbar_right()[1].click()

fill_form()
# page.button_submit()
'''
##Logout
time.sleep(3)
page.navbar_right()[-1].click()
time.sleep(2)
print(page.navbar_right()[1].text)
assert page.navbar_right()[1].text == "Sign in"

