import sys

from selenium import webdriver
from selenium.webdriver.common.by import By

name = sys.argv[1]
url = f"http://localhost:5173?uname={name}"

driver = webdriver.Firefox()
driver.get(url)

button = driver.find_element(By.ID, "subchat")
button.click()