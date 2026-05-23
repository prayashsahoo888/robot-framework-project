*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    name=username
${PASSWORD_FIELD}    name=password
${LOGIN_BUTTON}      xpath=//button[@type="submit"]
${DASHBOARD_TEXT}    xpath=//h6[text()='Dashboard']
*** Keywords ***

Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=10s
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=10s
    Click Button    ${LOGIN_BUTTON}

Verify Dashboard
    Wait Until Element Is Visible    ${DASHBOARD_TEXT}    timeout=10s