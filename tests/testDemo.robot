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