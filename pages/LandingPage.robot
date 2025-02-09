*** Settings ***
Documentation    All the web element and keywords for the Landing Page
Library    SeleniumLibrary

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Keywords ***
Fill Login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password     ${password}
    Click Button    signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message
    ${result}=    Get Text  ${Error_Message_Login}
    Should Be Equal As Strings  ${result}    Incorrect username/password.
    #Does the same as previous two lines
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.