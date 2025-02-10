from time import sleep

from robot.api.deco import keyword, library
from robot.libraries.BuiltIn import BuiltIn


class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("Selenium Library")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_card_and_checkout(self, product_list):
        i = 1
        product_titles = self.selLib.get_webelements("css:.card-title")

        for product_title in product_titles:
            if product_title.text in product_list:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[" + str(i) + "]/button")

            i = i + 1

        self.selLib.click_link("css:li.active a")