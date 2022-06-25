*** Variables ***
${BASKET}           //div[@class="BasketSumInfo"]
${FOOTER}           //div[@id="div_footX"]


*** Keywords ***
Verify Top Banner Is Present
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${SEARCHBAR}

Verify Basket Is Present
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${BASKET}

Verify Footer Is Present
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${FOOTER}

Verify Basket Is Empty By Default
    ${clean_price}=    Return Price Without Currency And Spaces    ${BASKET}//span
    Run Keyword And Continue On Failure    Should Be True    ${clean_price} == 0
