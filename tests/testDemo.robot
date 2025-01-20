*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser
*** Variables ***
${Error_Message_Login}    css:.alert-danger

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
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message
    ${result}=    Get Text  ${Error_Message_Login}
    Should Be Equal As Strings  ${result}    Incorrect username/password.
    #Does the same as previous two lines
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.
