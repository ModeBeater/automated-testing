*** Settings ***
Documentation     Automated test cases for Booking.com using Robot Framework - Chrome Browser
Resource          ../resources/keywords.robot
Resource          ../resources/locators.robot
Resource          ../resources/variables.robot
Test Setup        Open BrowserStack Browser    chrome    Windows    11
Test Teardown     Close Browser

*** Test Cases ***

TS1 Search For Hotel
    Search Hotel    ${CITY}

TS2 Filter By 5-Star Hotels
    Search Hotel    ${CITY}
    Filter By 5 Star

TS3 Verify Search Results Contain Destination
    [Documentation]    Verify that search results contain the destination name
    Search Hotel    ${CITY}
    Wait Until Page Contains Element    ${SEARCH_RESULTS}    15s
    ${page_text}=    Get Text    xpath=//body
    Should Contain    ${page_text}    ${DESTINATION}

TS4 Change Website Language
    Change Language

TS5 Change Currency
    Change Currency