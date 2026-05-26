*** Settings ***
Library          SeleniumLibrary
Resource         ../pages/login_page.robot  # Double check this path matches your structure

*** Test Cases ***
Valid Login Test
    # Open the browser in headless mode for the GitHub Actions Linux runner
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    headlesschrome    options=add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage"); add_argument("--window-size=1920,1080"); add_argument("--disable-gpu")

    # FIXED KEYWORD: Changed 'Set Browser Window Size' to 'Set Window Size'
    Set Window Size    1920    1080

    # FORCE Selenium to wait until the browser engine itself finishes rendering the page background
    Execute Javascript    return document.readyState === "complete"

    # Give the OrangeHRM Javascript framework 2 seconds to paint the actual input boxes
    Sleep    2s

    Enter Username    Admin
    Enter Password    admin123
    Click Login
    Verify Dashboard
    [Teardown]    Close Browser