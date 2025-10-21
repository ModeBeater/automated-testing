*** Settings ***
Documentation     Automated test cases for Booking.com using Robot Framework
Resource          ../resources/keywords.robot
Resource          ../resources/locators.robot
Resource          ../resources/variables.robot
Test Setup        Open Booking Website
Test Teardown     Close Browser


*** Test Cases ***

TS1 Search For Hotel
    Open Booking Website
    Search Hotel    ${CITY}
    Close Browser Session

TS2 Filter By 5-Star Hotels
    Open Booking Website
    Search Hotel    ${CITY}
    Filter By 5 Star
    Close Browser Session

TS3 Verify Search Results Contain Destination
    [Documentation]    Verify that search results contain the destination name
    Open Booking Website
    Search Hotel    ${CITY}
    Wait Until Page Contains Element    ${SEARCH_RESULTS}    15s
    ${page_text}=    Get Text    xpath=//body
    Should Contain    ${page_text}    ${DESTINATION}
    Close Browser Session

TS4 Change Website Language
    Open Booking Website
    Change Language
    Close Browser Session

TS5 Change Currency
    Open Booking Website
    Change Currency
    Close Browser Session
