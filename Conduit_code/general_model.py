from selenium import webdriver
from datetime import datetime

class GeneralPage:

    def __init__(self, driver: webdriver.Chrome, url):
        self.driver = driver
        self.url = url

    def open(self):
        self.driver.get(self.url)
        self.driver.maximize_window()

    def close(self):
        self.driver.close()

    def refresh(self):
        self.driver.refresh()

    def save_screen(self, path):
        filename = f'{self.driver.title}-{datetime.now().strftime("%Y-%m-%d-%H-%M_%S")}.png'
        print(f'Screenshot attempt: {path}\\{filename}')
        if not self.driver.save_screenshot(f'{path}\\{filename}'):
            # csak self.driver.save_screenshot helyett van ez
            print('Screenshot failed.')