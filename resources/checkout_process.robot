*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Go to Shopping Cart and Checkout
    Click Element    id=shopping_cart_container
    Wait Until Page Contains Element    id=cart_contents_container
    Click Button    id=checkout

Fill All Required Field
    Input Text    id=first-name    Dinda
    Input Text    id=last-name    Azizah
    Input Text    id=postal-code    17510

Leave The Postal Code Empty
    Input Text    id=first-name    Dinda
    Input Text    id=last-name    Azizah
    Click Button    id=continue
    Page Should Contain    Error: Postal Code is required

Complete The Checkout Process
    Click Button    id=continue
    Click Button    id=finish
    Wait Until Page Contains Element    id=checkout_complete_container

Cancel The Checkout Process
    Click Button    id=continue
    Click Button    id=cancel
    Wait Until Page Contains Element    id=inventory_container