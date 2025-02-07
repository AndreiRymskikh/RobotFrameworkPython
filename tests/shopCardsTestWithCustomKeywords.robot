*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    ../custom.libraries/Shop.py
Test Setup       Open browser with Mortgage payment url
Test Teardown    Close Browser
Resource         resource.robot
*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_Page_Load}    css:.nav-link
@{listOfProducts}    Nokia Edge    Blackberry

*** Test Cases ***
Validate Unsuccessful Login
    Fill Login form    ${wrong_username}    ${wrong_password}
    Wait visibility of element    ${Error_Message_Login}
    Verify error message

Validate products are displayed on Shopping Page
    Fill Login form    ${username}    ${password}
    Wait visibility of element    ${Shop_Page_Load}
    Verify Card titles on the Shop Page
    Add items to card and checkout    ${listOfProducts}

*** Keywords ***
Fill Login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username} 
    Input Password    password     ${password}
    Click Button    signInBtn
    #Custom keyword is called here
    Hello World

Wait visibility of element
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles on the Shop Page
    @{productsList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get Webelements    css:.card-title
    @{actualList} =    Create List
    FOR    ${element}    IN    @{elements}
       Log    ${element.text}
       Append To List    ${actualList}    ${element.text}
    END
    
    Lists Should Be Equal    ${productsList}    ${actualList}

Select the card
    [Arguments]    ${cardName}
    ${elements} =    Get Webelements    css:.card-title
    ${index} =    Set Variable    1
    FOR    ${element}  IN    @{elements}
             Exit For Loop If    '${cardName}' == '${element.text}'
             ${index} =  Evaluate    ${index} + 1
    END
    Log    ${index}
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    