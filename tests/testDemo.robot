*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary

*** Test Cases ***
Validate Unsuccessful Login
    Open browser with Mortgage payment url
    Fill Login form
    Wait until it checks and displays error message
    Verify error message

*** Keywords ***
Open browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill Login form
    Input Text    username    someWrongUsername
    Input Password    password    12345356
    Click Button    signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger

Verify error message
    ${result}=    Get Text  css:.alert-danger
    Should Be Equal As Strings  ${result}    Incorrect username/password.