*** Settings ***
Documentation    A resource file with reusable keywords and variables.

Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${username}    rahulshettyacademy
${password}    learning
${wrong_username}    someWrongUsername
${wrong_password}    12345356
${url}        https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
Open browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}

#For cross-browser launching
Open browser with the url
    [Arguments]    ${browser_name}
    Create Webdriver    ${browser_name}
    Go To    ${url}

Wait Until element is located on Page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}