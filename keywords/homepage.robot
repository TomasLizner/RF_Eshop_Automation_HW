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
