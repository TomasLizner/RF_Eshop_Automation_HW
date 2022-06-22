*** Settings ***
Library     ./helpers.py


*** Variables ***
${BASKET_FIRST_PAGE}    //*[@id="newkosik-tabs"]
${BASKET_PRODUCT}       //*[@id="produkty"]//*[@class="tr_kosik_produkt "]
${PRICE_SUM}            //*[@id="sumabox_price"]


*** Keywords ***
Basket First Page Displays
    Wait Until Element Is Visible    ${BASKET_FIRST_PAGE}${BASKET_PRODUCT}

Back To Shop From The Basket
    Click Element    (//button[contains(@class,"kosik_zpet")])[1]

Verify Basket Contains Expected Number Of Items
    [Arguments]    ${expected_items}
    Basket First Page Displays
    ${count} =    Get Element Count    ${BASKET_FIRST_PAGE}${BASKET_PRODUCT}
    Run Keyword And Continue On Failure    Should Be Equal    ${count}    ${expected_items}

Verify Basket Displayes Correct Total Price
    Basket First Page Displays
    ${found_price_sum}=    Get Text    ${PRICE_SUM}
    ${basket_price}=    Get Text    ${BASKET}//span
    ${clean_basket_price}=    Parse Clean Price    ${basket_price}
    ${clean_found_price}=    Parse Clean Price    ${found_price_sum}
    Run Keyword And Continue On Failure    Should Be True    ${clean_basket_price} == ${clean_found_price}
