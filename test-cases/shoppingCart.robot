*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/user_authentication.robot
Resource    ../resources/shopping_cart.robot

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Chrome

*** Test Cases ***
Verify That User Can Add a Single Product To Cart
    Open Browser    ${url}    ${browser}
    Login With Valid Credentials
    Add Product to Cart

Verify That User Can Add Multiple Products To Cart
    Open Browser    ${url}    ${browser}
    Login With Valid Credentials
    Add Three Products to Cart

Verify That User Can Remove a Product From Cart
    Open Browser    ${url}    ${browser}
    Login With Valid Credentials
    Add Three Products to Cart
    Remove Product from Cart

Close All Browser
    Close All Browsers