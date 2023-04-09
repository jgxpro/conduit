import time
import csv

import Conduit_code.configuration as config
from page_model import FormPage
from selenium.webdriver.common.by import By

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


# def fill_form():
#     for field in page.form_field():
#         field.send_keys(f"{test_data[field.get_property('placeholder')]}")
#
#     page.button_submit().click()


# def sign_in():
#     page = FormPage(driver=config.get_preconfigured_chrome_driver(), url_add='login')
#     page.open()
#     page.cookie_btn()[1].click()
#     fill_form()

def search_article():
    found = 0
    for actual_page in page.pagination():
        for actual_article in page.article_text():
            time.sleep(0.4)
            print(actual_article.text.split('\n')[0], test_data["Article Title"])
            if actual_article.text.split('\n')[0] == test_data["Article Title"]:
                actual_article.click()
                print(actual_article.text.split('\n')[0])
                found += 1
                break
        if not found == 0:
            break


'''
# Sign up
page = FormPage(driver=config.get_preconfigured_chrome_driver())
page.open_sub('register')
time.sleep(2)
page.refresh()
assert page.cookie_panel() == []

page.fill_form(test_data)
time.sleep(2)
print(page.confirmation_field().text)
assert "Email already taken." in page.confirmation_field().text
# assert "Your registration was successful" in page.confirmation_field().text

page.close()
'''
# Sign in
# sign_in() -> invalidsession error...
page = FormPage(driver=config.get_preconfigured_chrome_driver())
'''
page.open_sub('login')
page.fill_form(test_data)
time.sleep(2)
print(page.navbar_right()[-2].text, test_data["Username"])
assert page.navbar_right()[-2].text == test_data["Username"]


# List_of_data
list_title = []
for article in page.article_text():
    print(article.get_attribute('innerText').split('\n')[0])
    list_title.append(article.get_attribute('innerText'))
assert not list_title == []

# Pagination
for actual_page in page.pagination():
    print(actual_page)
    actual_page.click()
print(len(page.pagination()), page.pagination()[-1].find_element(By.XPATH, "..").get_attribute('className'))
assert 'active' in page.pagination()[-1].find_element(By.XPATH, "..").get_attribute('className')


#New element
time.sleep(2)
page.navbar_right()[1].click() # if signed in

page.fill_form(test_data)
# page.button_submit()

# Modify element
time.sleep(2)
page.navbar_right()[0].click()
search_article()
# found = 0
# for actual_page in page.pagination():
#     for actual_article in page.article_text():
#         time.sleep(0.4)
#         print(actual_article.text.split('\n')[0], test_data["Article Title"])
#         if actual_article.text.split('\n')[0] == test_data["Article Title"]:
#             actual_article.click()
#             print(actual_article.text.split('\n')[0])
#             found += 1
#             break
#     if not found == 0:
#         break

time.sleep(1)
page.button_article()[0].click()
time.sleep(1)
page.form_field()[0].clear()
page.form_field()[0].send_keys(test_data["Modified_data"])
# time.sleep(1)
page.button_submit().click()
time.sleep(1)
page.navbar_right()[0].click()

# Delete element
time.sleep(2)

found = 0
for actual_page in page.pagination():
    for actual_article in page.article_text():
        time.sleep(0.4)
        print(actual_article.text.split('\n')[0], test_data["Modified_data"])
        if actual_article.text.split('\n')[0] == test_data["Modified_data"]:
            actual_article.click()
            print(actual_article.text.split('\n')[0])
            found += 1
            break
    if not found == 0:
        break

time.sleep(1)
print(page.button_article())
page.button_article()[1].click()
print('Deleted')
'''
# Data from file
page.open_sub('login')
page.fill_form(test_data)
page.article_text()[0].click()
comments = []
with open('../test_data.csv', 'r') as file:
    test_data_file = csv.DictReader(file, delimiter=',')
    for row in test_data_file:
        for count in range(3):
            time.sleep(0.5)
            page.form_field()[0].send_keys(f"{row[page.form_field()[0].get_property('placeholder')+str(count+1)]}")
            comments.append(f"{row[page.form_field()[0].get_property('placeholder') + str(count + 1)]}")
            time.sleep(0.5)
            page.button_submit().click()           

page.refresh()
for count, comment in enumerate(page.card_field()):
    assert comment.text == comments[count]

# Data to file
page.open_sub('login')
page.fill_form(test_data)
time.sleep(2)
page.navbar_right()[2].click()

settings_keys = []
settings_dict = {}
for count, data in enumerate(page.form_field()[:-1]):
    settings_keys.append(data.get_property("placeholder"))
    settings_dict[f'{data.get_property("placeholder")}'] = data.get_property("value")

with open('../settings.csv', 'w') as file:
    writer = csv.DictWriter(file, fieldnames=settings_keys, lineterminator='\n')
    writer.writeheader()
    writer.writerow(settings_dict)

with open('../settings.csv', 'r') as file:
    settings_file = csv.DictReader(file, delimiter=',')
    for row in settings_file:
        print(row, settings_dict)
        assert row == settings_dict

# # Logout
# time.sleep(3)
# page.navbar_right()[-1].click()
# time.sleep(2)
# print(page.navbar_right()[1].text)
# assert page.navbar_right()[1].text == "Sign in"
