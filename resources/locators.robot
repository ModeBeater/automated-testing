*** Variables ***
# Search bar
${DESTINATION_INPUT}     xpath=//input[@name='ss']
${SEARCH_BUTTON}         xpath=//button[@type='submit']

# Filters
${PRICE_FILTER}          xpath=//div[contains(@data-filters-group,'pri')]
${STAR_FILTER_5}         xpath=//div[contains(@data-filters-group,'class')]//div[@data-filters-item='class:class=5']
${SORT_LOWEST_PRICE}     xpath=//*[contains(text(),'Lowest price') or contains(text(),'Сначала самые дешёвые')]

# Hotel list
${HOTEL_CARD}            xpath=(//div[@data-testid='property-card'])[1]
${HOTEL_NAME}            xpath=(//div[@data-testid='title'])[1]

# Language & Currency
${LANGUAGE_BUTTON}       xpath=//button[@data-testid='header-language-picker-trigger']
${CURRENCY_BUTTON}       xpath=//button[@data-testid='header-currency-picker-trigger']

# Error message
${ERROR_MESSAGE}         xpath=//*[contains(text(),'Enter a destination')]

${CHECKIN_FIELD}    xpath=//button[contains(@aria-label,'Check-in') or contains(@aria-label,'Дата заезда')]
${CALENDAR_POPUP}   xpath=//div[contains(@class,'calendar')]
${SEARCH_RESULTS}   xpath=//div[@data-testid='property-card']