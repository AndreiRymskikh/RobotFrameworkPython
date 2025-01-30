*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    Open browser with Mortgage payment url
Test Teardown    Close Browser
Resource    resource.robot
*** Variables ***
${email}

*** Test Cases ***
Validate child window functionality
    Select the link of Child window
    User switched to Child window
    Grab the email in the Child window
    Switch to Parent window and enter the email

*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep    5

User switched to Child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the email in the Child window
    ${text} =    Get Text    css:.red
    @{words} =    Split String    ${text}    at
    #0 -> Please email at
    #1 -> mentor@rahulshettyacademy.com with below template...
    ${text_split} =    Get From List    ${words}    1
    @{words_1} =    Split String    ${text_split}    
    #0 -> mentor@rahulshettyacademy.com
    ${email} =    Get From List    ${words_1}    0
    Set Global Variable    ${email}


Switch to Parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
