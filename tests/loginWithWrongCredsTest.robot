*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login
Resource    ../pages/LandingPage.robot
Resource         ../pages/resource.robot

*** Test Cases ***    username    password
Invalid username      wrongUsernm       learning
Invalid password      rahulshetty       wrongPswd
Special characters    @#${}             learning

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open browser with Mortgage payment url
    LandingPage.Fill Login form    ${username}    ${password}
    Wait until it checks and displays error message
    Verify error message
