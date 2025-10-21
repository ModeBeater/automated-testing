*** Settings ***
Library     SeleniumLibrary
Resource    variables.robot
Resource    locators.robot

*** Keywords ***
Open Booking Website
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${DESTINATION_INPUT}

Search Hotel
    [Arguments]    ${city}
    Input Text    ${DESTINATION_INPUT}    ${city}
    Click Element    ${SEARCH_BUTTON}
    Wait Until Page Contains Element    ${HOTEL_CARD}

Filter By 5 Star
    Click Element    ${STAR_FILTER_5}
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

Change Language
    Click Element    ${LANGUAGE_BUTTON}
    Sleep    2s

Change Currency
    Click Element    ${CURRENCY_BUTTON}
    Sleep    2s

Close Browser Session
    Close Browser
