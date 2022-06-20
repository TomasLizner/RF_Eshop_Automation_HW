*** Settings ***
Resource    ./basket.robot


*** Variables ***
${TOP_BANNER}                   //*[contains(@class,"additional_search_category")]//span[text()="Televize"]
${THE_MOST_EXPENSIVE_BUTTON}    //*[@id="detail-tabs"]//span[text()="Nejdražší"]
${ITEMS}                        //*[@id="productContainer"]//div[@class="item_b"]


*** Keywords ***
Select Category
    [Arguments]    ${category_name}
    UTILS Click Element    //*[contains(@class,"additional_search_category")]//span[text()="${category_name}"]

Sort By The Most Expensive
    UTILS Click Element    ${THE_MOST_EXPENSIVE_BUTTON}

Add Two Most Expensive TVs Into The Basket
    Put Goods Into The Basket    1
    Basket First Page Displays
    Back To Shop From The Basket
    Put Goods Into The Basket    2

Put Goods Into The Basket
    [Arguments]    ${goods_order}
    UTILS Click Element    (${ITEMS}//input[@type="submit"])[${goods_order}]
