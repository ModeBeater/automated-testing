*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    variables.robot
Resource    locators.robot

*** Keywords ***
Open BrowserStack Browser
    [Arguments]    ${browser}=chrome    ${os}=Windows    ${os_version}=11

    ${browser_class}=    Set Variable If    '${browser.lower()}' == 'chrome'    ChromeOptions    '${browser.lower()}' == 'firefox'    FirefoxOptions    '${browser.lower()}' == 'safari'    SafariOptions    '${browser.lower()}' == 'edge'    EdgeOptions    ChromeOptions
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${browser_class}()    sys, selenium.webdriver
    Call Method    ${options}    set_capability    browserVersion    latest
    ${bstack_options}=    Evaluate    {'os': '${os}', 'osVersion': '${os_version}', 'userName': '${BROWSERSTACK_USER}', 'accessKey': '${BROWSERSTACK_KEY}'}
    Call Method    ${options}    set_capability    bstack:options    ${bstack_options}

            Open Browser    ${BASE_URL}    remote_url=https://${BROWSERSTACK_USER}:${BROWSERSTACK_KEY}@hub.browserstack.com/wd/hub    options=${options}
    Maximize Browser Window
    Wait Until Page Contains Element    ${DESTINATION_INPUT}    timeout=15s

Search Hotel
    [Arguments]    ${city}
    Remove Overlay Elements
    Wait Until Element Is Visible    ${DESTINATION_INPUT}    timeout=15s
    Clear Element Text    ${DESTINATION_INPUT}
    Input Text    ${DESTINATION_INPUT}    ${city}
    Sleep    1s
    Remove Overlay Elements
    Wait Until Element Is Visible    ${SEARCH_BUTTON}    timeout=5s
    Wait Until Element Is Enabled    ${SEARCH_BUTTON}    timeout=5s
    Scroll Element Into View    ${SEARCH_BUTTON}
    ${element}=    Get WebElement    ${SEARCH_BUTTON}
    Execute JavaScript    return arguments[0].click();    ARGUMENTS    ${element}
    Wait Until Page Contains Element    ${HOTEL_CARD}    timeout=20s

Filter By 5 Star
    Remove Overlay Elements
    Wait Until Element Is Visible    ${STAR_FILTER_5}    timeout=10s
    ${element}=    Get WebElement    ${STAR_FILTER_5}
    Execute JavaScript    arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});    ARGUMENTS    ${element}
    Sleep    1s
    Wait Until Element Is Enabled    ${STAR_FILTER_5}    timeout=5s
    Execute JavaScript    return arguments[0].click();    ARGUMENTS    ${element}
    Wait Until Page Contains Element    ${HOTEL_CARD}    timeout=15s

Sort By Lowest Price
    Click Element    ${SORT_LOWEST_PRICE}
    Sleep    3s

Open First Hotel
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    2s
    Click Element    ${HOTEL_CARD}
    Sleep    2s
    Switch Window    index=1

Remove Overlay Elements
    Execute JavaScript    try { const el1 = document.querySelector('[id*="onetrust"]'); if (el1) el1.remove(); const el2 = document.querySelector('[id="onetrust-banner-sdk"]'); if (el2) el2.remove(); const el3 = document.querySelector('[class*="bbe73dce14"]'); if (el3) el3.remove(); const el4 = document.querySelector('[class*="cookie"]'); if (el4) el4.remove(); } catch(e) {}
    Sleep    0.5s
    
Change Language
    Remove Overlay Elements
    Wait Until Element Is Visible    ${LANGUAGE_BUTTON}    timeout=10s
    Scroll Element Into View    ${LANGUAGE_BUTTON}
    Wait Until Element Is Enabled    ${LANGUAGE_BUTTON}    timeout=5s
    ${element}=    Get WebElement    ${LANGUAGE_BUTTON}
    Execute JavaScript    return arguments[0].click();    ARGUMENTS    ${element}
    Sleep    2s

Change Currency
    Remove Overlay Elements
    Wait Until Element Is Visible    ${CURRENCY_BUTTON}    timeout=10s
    Scroll Element Into View    ${CURRENCY_BUTTON}
    Wait Until Element Is Enabled    ${CURRENCY_BUTTON}    timeout=5s
    ${element}=    Get WebElement    ${CURRENCY_BUTTON}
    Execute JavaScript    return arguments[0].click();    ARGUMENTS    ${element}
    Sleep    2s