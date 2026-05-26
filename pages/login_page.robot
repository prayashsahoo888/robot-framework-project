*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    xpath=//input[@name="username"]
${PASSWORD_FIELD}    xpath=//input[@name="password"]
${LOGIN_BUTTON}      xpath=//button[@type="submit"]
${DASHBOARD_TEXT}    xpath=//h6[text()='Dashboard']

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    # 1. Changed from 'Visible' to 'Contains Element' to catch it in the DOM first
    Wait Until Page Contains Element    ${USERNAME_FIELD}    timeout=20s
    # 2. Added a tiny pause or scroll into view if needed, but Input Text should work now
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=20s
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=20s
    Click Button    ${LOGIN_BUTTON}

Verify Dashboard
    Wait Until Element Is Visible    ${DASHBOARD_TEXT}    timeout=20s