*** Settings ***
Documentation    A resource file with reusable keywords and variables.

Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${username}    rahulshettyacademy
${password}    learning
${wrong_username}    someWrongUsername
${wrong_password}    12345356
${url}        https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
Open browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}