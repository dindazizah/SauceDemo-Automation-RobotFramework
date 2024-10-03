*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${username}    standard_user
${password}    secret_sauce  

*** Keywords ***
Click Sorting Button
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span
    
Verify Product Listing
    ${count}    Get Element Count    //div[@class='inventory_item']
    Should Be Equal    ${count}    ${6}

Sort Products Price Low to High
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=page_wrapper
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[3]

Sort Products Name A to Z
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=page_wrapper
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[1]