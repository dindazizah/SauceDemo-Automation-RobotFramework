*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com/inventory.html
${username}    standard_user
${lockeduser}    locked_out_user
${password}    secret_sauce
${wrongpassword}    wrong_password
${EMPTY}        

*** Keywords ***
Login With Valid Credentials
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=page_wrapper

Login With Invalid Credentials
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${wrongpassword}
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Username and password do not match any user in this service

Login Locked Out User
    Input Text    id=user-name    ${lockeduser}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

Logout Process
    Click Button    id=react-burger-menu-btn
    Wait Until Page Contains Element   xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element    id=logout_sidebar_link
    Wait Until Page Contains Element    id=login_button_container
    Close Browser

Username is Empty
    Input Text    id=user-name    ${EMPTY}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Username is required

Password is Empty
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${EMPTY}
    Click Button    id=login-button
    Page Should Contain    Epic sadface: Password is required

