*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/user_authentication.robot
Resource    ../resources/product_inventory.robot

*** Variables ***
${url}    https://www.saucedemo.com/

*** Test Cases ***
Ensure That All Products Are Displayed
    Open Browser    ${url}    Chrome
    Login With Valid Credentials
    Verify Product Listing

Sort Products Price Low to High
    Open Browser    ${url}    Chrome
    Login With Valid Credentials
    Click Sorting Button
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[3]

Sort Products Name A to Z
    Open Browser    ${url}    Chrome
    Login With Valid Credentials
    Click Sorting Button
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[1]

Close All Browser
    Close All Browsers