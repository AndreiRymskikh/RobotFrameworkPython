*** Settings ***
Documentation    All the web element and keywords for the Shop Page
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Shop_Page_Load}    css:.nav-link

*** Keywords ***
Wait visibility of element
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

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