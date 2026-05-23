*** Settings ***
Resource    ../resources/config.robot
Resource    ../pages/login_page.robot
Library     SeleniumLibrary
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Valid Login Test
    [Template]    Login Scenario

    Admin    admin123
    Admin   admin1234

*** Keywords ***
Login Scenario
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Verify Dashboard