# The target of the modul is to avoid the creation the appropriate Chrome driver in every occasion.
# After import it's enough to call 'get_preconfigured_chrome_driver()' function.
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager


def get_preconfigured_chrome_driver() -> webdriver.Chrome:
    s = Service(executable_path=ChromeDriverManager().install())
    o = Options()
    o.add_experimental_option('detach', True)

    return webdriver.Chrome(service=s, options=o)
