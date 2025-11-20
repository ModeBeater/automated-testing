*** Settings ***
Documentation     Automated test cases for Booking.com using Robot Framework - All Browsers
Resource          ../resources/keywords.robot
Resource          ../resources/locators.robot
Resource          ../resources/variables.robot
Test Teardown     Close Browser

*** Variables ***
@{BROWSERS}    chrome:Windows:11    firefox:Windows:11    safari:OS X:Sonoma

*** Test Cases ***
TS1 Search For Hotel
    [Template]    Search Hotel Template
    chrome    Windows    11
    firefox    Windows    11
    safari    OS X    Sonoma

TS2 Filter By 5-Star Hotels
    [Template]    Filter By 5 Star Template
    chrome    Windows    11
    firefox    Windows    11
    safari    OS X    Sonoma

TS3 Verify Search Results Contain Destination
    [Template]    Verify Search Results Template
    [Documentation]    Verify that search results contain the destination name
    chrome    Windows    11
    firefox    Windows    11
    safari    OS X    Sonoma

TS4 Change Website Language
    [Template]    Change Language Template
    chrome    Windows    11
    firefox    Windows    11
    safari    OS X    Sonoma

TS5 Change Currency
    [Template]    Change Currency Template
    chrome    Windows    11
    firefox    Windows    11
    safari    OS X    Sonoma

*** Keywords ***
Search Hotel Template
    [Arguments]    ${browser}    ${os}    ${os_version}
    [Tags]    ${browser}
    Open BrowserStack Browser    ${browser}    ${os}    ${os_version}
    Search Hotel    ${CITY}

Filter By 5 Star Template
    [Arguments]    ${browser}    ${os}    ${os_version}
    [Tags]    ${browser}
    Open BrowserStack Browser    ${browser}    ${os}    ${os_version}
    Search Hotel    ${CITY}
    Filter By 5 Star

Verify Search Results Template
    [Arguments]    ${browser}    ${os}    ${os_version}
    [Tags]    ${browser}
    Open BrowserStack Browser    ${browser}    ${os}    ${os_version}
    Search Hotel    ${CITY}
    Wait Until Page Contains Element    ${SEARCH_RESULTS}    15s
    ${page_text}=    Get Text    xpath=//body
    Should Contain    ${page_text}    ${DESTINATION}

Change Language Template
    [Arguments]    ${browser}    ${os}    ${os_version}
    [Tags]    ${browser}
    Open BrowserStack Browser    ${browser}    ${os}    ${os_version}
    Change Language

Change Currency Template
    [Arguments]    ${browser}    ${os}    ${os_version}
    [Tags]    ${browser}
    Open BrowserStack Browser    ${browser}    ${os}    ${os_version}
    Change Currency