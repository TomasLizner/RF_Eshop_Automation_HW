*** Settings ***
Force Tags          RF_HW_MIRONET

Documentation       Opens Mironet homepage Go to your favorite Czech, navigate to TVs category,
...                 adds two most expensive TVs to the shopping cart.

Resource            ./keywords/general_keywords.robot
Resource            ./settings/general_settings.robot
Resource            ./keywords/homepage.robot

Test Setup          Run Keywords    Init Test Settings    AND    Open Browser And Navigate To Mironet Homepage    AND    Comfirm Cookie Dialog
Test Teardown       Run Keyword    Close Browser


*** Test Cases ***
Homepage Loads Successfully
    [Documentation]    Opens Mironet homepage and verifies if expected objects are loaded properly
    Verify Search Bar Is Displayed
    Verify Top Banner Is Present
    Verify Basket Is Present
    Verify Footer Is Present