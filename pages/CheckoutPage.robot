*** Settings ***
Documentation    All the web element and keywords for the Checkout Page
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${success_button}    css:.btn-success

*** Keywords ***
Verify items are in the CheckoutPage and proceed
    Click Element    ${success_button}