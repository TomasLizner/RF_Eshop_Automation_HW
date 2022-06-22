*** Settings ***
Resource    ./basket.robot


*** Variables ***
${THE_MOST_EXPENSIVE_BUTTON}    //*[@id="detail-tabs"]//span[text()="Nejdražší"]
${ITEMS}                        //*[@id="productContainer"]//div[@class="item_b"]
${ITEM_PRICE}                   //div[@class="item_b_cena"]


*** Keywords ***
Select Category
    [Arguments]    ${category_name}
    UTILS Click Element    //*[contains(@class,"additional_search_category")]//span[text()="${category_name}"]

Sort By The Most Expensive
    UTILS Click Element    ${THE_MOST_EXPENSIVE_BUTTON}

Verify Sorting By Most Expensive Works
    ${clean_first_price}=    Return Price Without Currency And Spaces    (${ITEMS}${ITEM_PRICE})[1]
    ${clean_second_price}=    Return Price Without Currency And Spaces    (${ITEMS}${ITEM_PRICE})[2]
    Capture Page Screenshot
    Should Be True    ${clean_first_price} > ${clean_second_price}

Add Two Most Expensive TVs Into The Basket
    Put Goods Into The Basket    1
    Basket First Page Displays
    Back To Shop From The Basket
    Put Goods Into The Basket    2

Put Goods Into The Basket
    [Documentation]    Adds good into the basket. ${goods_order} is order from the top left.
    [Arguments]    ${goods_order}
    UTILS Click Element    (${ITEMS}//input[@type="submit"])[${goods_order}]
