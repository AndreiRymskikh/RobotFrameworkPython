*** Settings ***
Documentation    A resource file with reusable keywords and variables.

Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${username}    someWrongUsername
${password}    12345356
${url}        https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
Open browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}