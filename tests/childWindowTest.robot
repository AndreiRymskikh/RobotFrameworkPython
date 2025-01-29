*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Test Setup    Open browser with Mortgage payment url
Test Teardown    Close Browser
Resource    resource.robot
*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Validate child window functionality
    Select the link of Child window
    User switched to Child window
    Grab the email in the Child window
    Switch to Parent window

*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep    5

User switched to Child window
    Switch Window    NEW
    Element Text Should Be    css:h1    Documents request

Grab the email in the Child window
    ${text} =    Get Text    css:.red
    ${words} =    Split String    ${text}    at

    

Switch to Parent window
