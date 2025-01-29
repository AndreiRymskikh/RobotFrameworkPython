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
Check the login options
    Fill the login details and select the User option    ${username}    ${password}
    Select teacher
    Accept terms and conditions


*** Keywords ***
Fill the login details and select the User option
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password     ${password}
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Element    okayBtn
    Wait Until Element Is Not Visible    css:.modal-body

Select teacher
    Select From List By Value    css:select.form-control    teach

Accept terms and conditions
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    