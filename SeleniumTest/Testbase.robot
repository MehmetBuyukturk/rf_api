*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go to website
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-logging
    Create Webdriver    Chrome    options=${options}
    Go To    https://demowebshop.tricentis.com
    Maximize Browser Window