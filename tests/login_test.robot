*** Settings ***
Resource    ../resources/config.robot
Resource    ../pages/login_page.robot
Library     SeleniumLibrary

Suite Setup       Open Chrome Browser
Suite Teardown    Close Browser

*** Test Cases ***
Valid Login Test
    [Template]    Login Scenario

    Admin    admin123
    Admin    admin1234

*** Keywords ***
Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

    Create Webdriver    Chrome    options=${options}

    Go To    https://google.com
    Maximize Browser Window

Login Scenario
    [Arguments]    ${username}    ${password}

    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Verify Dashboard