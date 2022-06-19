*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${ESHOP_LOGO}           //*[@id="shp_logo"]
${COOKIES_DIALOG}       //*[@id="unimodal_dialog"]//span[@class="ButtonDef"]
${SEARCHBAR}            //input[@id="EXPS"]
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

Comfirm Cookie Dialog
    UTILS Click Element    ${COOKIES_DIALOG}
    Wait Until Page Does Not Contain Element    ${COOKIES_DIALOG}    timeout=3s

#
# Page Load Checks
#

Mironet Homepage Displays
    Wait Until Page Contains Element    ${ESHOP_LOGO}

Verify Search Bar Is Displayed
    Wait Until Page Contains Element    ${SEARCHBAR}

#
# Utils
#

UTILS Click Element
    [Arguments]    ${locator}
    _Prepare Element    ${locator}
    Click Element    ${locator}

Wait Until One Of Two Elements Is Visible
    [Arguments]    ${firstElement}    ${secondElement}    ${timeoutInSeconds}
    FOR    ${index}    IN RANGE    ${timeoutInSeconds}
        ${statusOfFirstElement}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${firstElement}    0.5s
        Run Keyword If    ${statusOfFirstElement} == True    Return From Keyword    ${firstElement}
        ${statusOfSecondElement}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${secondElement}    0.5s
        Run Keyword If    ${statusOfSecondElement} == True    Return From Keyword    ${secondElement}
    END
    Capture Page Screenshot
    FAIL    Element ${firstElement} nor ${secondElement} were found in ${timeoutInSeconds} seconds

Scroll Current Window
    [Arguments]    ${pixels}
    Execute JavaScript    window.scrollTo(0, ${pixels})

Scroll Current Window To Top
    Execute Javascript    window.scrollTo(0, 0);

Scroll Current Window To Bottom
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);

_Prepare Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    Wait Until Element Is Visible    ${locator}

#
# Clicking
#

Click Element Using Javascript
    [Arguments]    ${xPath}
    Execute Javascript    document.evaluate('${xPath}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

Click Element And Retry If Click Does Not Work Properly
    [Arguments]    ${clickElement}    ${elementAfterClick}    ${timeoutForWaiting}
    FOR    ${index}    IN RANGE    10
        DSDLC Set Focus To Element    ${clickElement}
        Scroll To Element Using Javascript    ${clickElement}
        ${status}    ${value}=    Run Keyword And Ignore Error    DSDLC Click Element    ${clickElement}
        ${status}    ${value}=    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${elementAfterClick}
        ...    ${timeoutForWaiting}
        Log    ${value}    # To see the error message
        IF    '${status}' == 'PASS'    BREAK
    END
