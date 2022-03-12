from bs4 import BeautifulSoup
import requests
import pymongo
import time
from splinter import Browser
from webdriver_manager.chrome import ChromeDriverManager
from actors import actors

executable_path = {'executable_path': ChromeDriverManager().install()}
browser = Browser('chrome', **executable_path, headless=False)
guest_actor_appearances = ''

for actor in actors:
    url = f'https://www.imdb.com/name/{actor[1]}/?ref_=nv_sr_srsg_0'
    browser.visit(url)
    while True:
        try:
            browser.links.find_by_partial_text('Show all').click()
            time.sleep(2)
        except:
            break
    html = browser.html
    soup = BeautifulSoup(html, 'html.parser')
    results = soup.find_all('div', class_='filmo-row')
    titles = []
    for result in results:
        try:
            series_title = result.find("a")
            if series_title.text == "Seinfeld":
                eps = result.find_all("a")
                for ep in eps:
                    titles.append(ep.text)
        except:
            continue
    guest_actor_appearances += f'{actor[0]}, {",".join(titles[1:titles.index("Show less")])}\n'
print(guest_actor_appearances)
open("Data/guest-stars.txt", "w").write(guest_actor_appearances)
