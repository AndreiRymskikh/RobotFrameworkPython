*** Settings ***
Documentation    All the web element and keywords for the Confirmation Page
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${country_location}    //a[text()='India']

*** Keywords ***
Enter the country and accept the terms
    [Arguments]    ${country_name}
    Input Text    country    ${country_name}
    Wait Until Element Is Visible    //a[text()='${country_name}']    10
    Click Element    //a[text()='${country_name}']
    Click Element    css:.checkbox label

Purchase the product and confirm
    Click Button    css:.btn-success
    Page Should Contain    Success!