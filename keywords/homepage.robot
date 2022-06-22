*** Settings ***
Library     ./helpers.py

*** Variables ***
${TOP_BANNER}       //div[contains(@class,"FloatBannersTitulka") and contains(@class,"owl-carousel")]
${BASKET}           //div[@class="BasketSumInfo"]
${FOOTER}           //div[@id="div_footX"]


*** Keywords ***
Verify Top Banner Is Present
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${SEARCHBAR}

Verify Basket Is Present
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${BASKET}

Verify Footer Is Present
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${FOOTER}

Verify Total Goods Price In The Basket
    [Arguments]    ${expected_price}
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${FOOTER}

Verify Basket Is Empty By Default
    ${basket_price}=    Get Text    ${BASKET}//span
    ${clean_price}=     Parse Clean Price    ${basket_price}
    Run Keyword And Continue On Failure    Should Be True    ${clean_price} == 0
