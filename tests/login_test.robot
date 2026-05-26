*** Settings ***
Library          SeleniumLibrary
Resource         ../pages/login_page.robot  # Double check this path matches your structure

*** Test Cases ***
Valid Login Test
    # Open the browser with options that disable sandboxing and extensions which slow down loading
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome    options=add_argument("--disable-gpu"); add_argument("--no-sandbox")
    Maximize Browser Window

    # FORCE Selenium to wait until the browser engine itself finishes rendering the page background
    Execute Javascript    return document.readyState === "complete"

    # Give the OrangeHRM Javascript framework 2 seconds to paint the actual input boxes
    Sleep    2s

    Enter Username    Admin
    Enter Password    admin123
    Click Login
    Verify Dashboard
    [Teardown]    Close Browser