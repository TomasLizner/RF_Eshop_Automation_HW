*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${ESHOP_LOGO}           //*[@id="shp_logo"]
${COOKIES_DIALOG}       //*[@id="unimodal_dialog"]//span[@class="ButtonDef"]
${SEARCH_BAR}           //input[@id="EXPS"]
${SEARCH_BUTTON}        //button[contains(@class,"SearchSubmit")]


*** Keywords ***
#
# Init Test Settings
#

Init Test Settings
    [Documentation]    Increases test stability when page is overloaded
    Set Selenium Timeout    30 seconds

#
# General Navigation
#

Open Browser And Navigate To Mironet Homepage
    Open Browser    ${SERVER_URL}    ${BROWSER}
    Maximize Browser Window
    Mironet Homepage Displays

Confirm Cookie Dialog
    UTILS Click Element    ${COOKIES_DIALOG}
    Wait Until Page Does Not Contain Element    ${COOKIES_DIALOG}    timeout=3s

Set Search Bar And Click On Search Button
    [Arguments]    ${value}
    UTILS Input Text    ${SEARCH_BAR}    ${value}
    Click Element    ${SEARCH_BUTTON}

#
# Page Load Checks
#

Mironet Homepage Displays
    Wait Until Page Contains Element    ${ESHOP_LOGO}

Verify Search Bar Is Displayed
    Wait Until Page Contains Element    ${SEARCH_BAR}

#
# Utils
#

UTILS Click Element
    [Arguments]    ${locator}
    _Prepare Element    ${locator}
    Click Element    ${locator}

UTILS Input Text
    [Arguments]    ${locator}    ${value}
    _Prepare Element    ${locator}
    Input Text    ${locator}    ${value}

_Prepare Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    Wait Until Element Is Visible    ${locator}
