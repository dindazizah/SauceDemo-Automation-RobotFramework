*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/user_authentication.robot

*** Variables ***
${url}    https://www.saucedemo.com/

*** Test Cases ***
Valid Login
    Open Browser    ${url}    Chrome
    Login With Valid Credentials

Invalid Login Wrong Password
    Open Browser    ${url}    Chrome
    Login With Invalid Credentials

Invalid Login Locked Out User
    Open Browser    ${url}    Chrome
    Login Locked Out User

User Can Logout
    Open Browser    ${url}    Chrome
    Login With Valid Credentials
    Logout Process

Field Is Empty
    Open Browser    ${url}    Chrome
    Username is Empty
    Reload Page
    Password is Empty
    Sleep    2s

Close All Browser
    Close All Browsers