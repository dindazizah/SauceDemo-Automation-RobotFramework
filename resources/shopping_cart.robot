*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Product to Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Page Contains Element    class=shopping_cart_badge
    ${cart_count}    Get Text    class=shopping_cart_badge
    Should Be Equal As Strings   ${cart_count}    ${1}

Add Three Products to Cart
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Wait Until Page Contains Element    class=shopping_cart_badge
    ${cart_count}    Get Text    class=shopping_cart_badge
    Should Be Equal As Strings   ${cart_count}    ${3}

Remove Product from Cart
    Click Element    xpath=//*[@id="shopping_cart_container"]
    Click Button    id=remove-sauce-labs-backpack
    ${cart_count}    Get Text    class=shopping_cart_badge
    Should Be Equal As Strings   ${cart_count}    ${2}