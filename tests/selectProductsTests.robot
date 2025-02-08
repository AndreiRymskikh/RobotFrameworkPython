*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup       Open browser with Mortgage payment url
Test Teardown    Close Browser
Resource         ../pages/resource.robot
Resource    ../pages/ShopPage.robot
Resource    ../pages/LandingPage.robot
*** Variables ***
${Error_Message_Login}    css:.alert-danger


*** Test Cases ***
Validate products are displayed on Shopping Page
    Fill Login form    ${username}    ${password}
    Wait visibility of element    ${Shop_Page_Load}
    Verify Card titles on the Shop Page
    Select the card    Blackberry

*** Keywords ***

    