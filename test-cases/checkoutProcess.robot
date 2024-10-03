*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/user_authentication.robot
Resource    ../resources/shopping_cart.robot
Resource    ../resources/checkout_process.robot

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Chrome

*** Test Cases ***
Purchase with Valid Information
    Open Browser    ${url}    Chrome
    Login With Valid Credentials
    Add Product to Cart
    Go to Shopping Cart and Checkout
    Fill All Required Field
    Complete The Checkout Process

Checkout with Missing Information
    Open Browser    ${url}    Chrome
    Login With Valid Credentials
    Add Product to Cart
    Go to Shopping Cart and Checkout
    Leave The Postal Code Empty

Verify That User Can Cancel The Checkout Process
    Open Browser    ${url}    ${browser}
    Login With Valid Credentials
    Add Product to Cart
    Go to Shopping Cart and Checkout
    Fill All Required Field
    Cancel The Checkout Process

Close All Browser
    Close All Browsers