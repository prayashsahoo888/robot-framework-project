*** Settings ***
Resource    ../pages/login_page.robot
Resource    ../resources/config.robot

*** Keywords ***
Login To Application
    [Arguments]    ${username}    ${password}
    Open Browser To Login Page
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login