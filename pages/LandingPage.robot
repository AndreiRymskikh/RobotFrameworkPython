*** Settings ***
Documentation    All the web element and keywords for the Landing Page
Library    SeleniumLibrary

*** Keywords ***
Fill Login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password     ${password}
    Click Button    signInBtn