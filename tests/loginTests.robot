*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Setup       Open browser with Mortgage payment url
Test Teardown    Close Browser
Resource         resource.robot
*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_Page_Load}    css:.nav-link

*** Test Cases ***
Validate Unsuccessful Login
    Fill Login form    ${wrong_username}    ${wrong_password}
    Wait visibility of element    ${Error_Message_Login}
    Verify error message

Validate products are displayed on Shopping Page
    Fill Login form    ${username}    ${password}
    Wait visibility of element    ${Shop_Page_Load}
    Verify Card titles on the Shop Page

*** Keywords ***
Fill Login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username} 
    Input Password    password     ${password}
    Click Button    signInBtn

Wait visibility of element
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles on the Shop Page
    ${productsList} =    Create List    iphone X    Samsung Note 8    Nokia Edge
    ${elements} =    Get Webelements    css:.card-title
    FOR    ${element}    IN    @{elements}
       Log    ${element.text}

    END