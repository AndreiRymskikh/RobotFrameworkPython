*** Settings ***
Documentation    To validate the Options of Login form
Library    SeleniumLibrary
Library    Collections
Test Setup       Open browser with Mortgage payment url
Test Teardown    Close Browser
Resource         resource.robot
*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_Page_Load}    css:.nav-link

*** Test Cases ***
Select the form and navigate to Child window
    Fill the login details and select the User option    ${username}    ${password}


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

Fill the login details and select the User option
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password     ${password}
    Click Element    css:input[value='user']
    Click Element    okayBtn
    Select From List By Value    css:select.form-control    teach
    #Click Button    signInBtn
    