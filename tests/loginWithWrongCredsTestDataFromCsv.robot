*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    DataDriver    file=resources/loginData.csv    encoding=utf_8    dialect=unix
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login
*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Login with ${username} and ${password}


*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open browser with Mortgage payment url
    Fill Login form    ${username}    ${password}
    Wait until it checks and displays error message
    Verify error message

*** Keywords ***
Open browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill Login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password    ${password}
    Click Button    signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message
    ${result}=    Get Text  ${Error_Message_Login}
    Should Be Equal As Strings  ${result}    Incorrect username/password.
    #Does the same as previous two lines
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.
