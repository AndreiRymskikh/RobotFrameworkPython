*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    ../custom.libraries/Shop.py
Test Setup       Open browser with Mortgage payment url
Test Teardown    Close Browser
Resource         ../pages/resource.robot
Resource    ../pages/LandingPage.robot
Resource    ../pages/CheckoutPage.robot
Resource    ../pages/ShopPage.robot
Resource    ../pages/ConfirmationPage.robot
*** Variables ***
${Shop_Page_Load}    css:.nav-link
@{listOfProducts}    Nokia Edge    Blackberry
${country_name}    India

*** Test Cases ***
Validate products are displayed on Shopping Page
    Fill Login form    ${username}    ${password}
    Wait visibility of element    ${Shop_Page_Load}
    Verify Card titles on the Shop Page
    Add items to card and checkout    ${listOfProducts}
    Verify items are in the CheckoutPage and proceed
    Enter the country and accept the terms    ${country_name}
    Purchase the product and confirm

*** Keywords ***






    