*** Variables ***
${SEARCHBAR}    //input[@id="EXPS"]


*** Keywords ***
Verify Search Bar Is Displayed
    Wait Until Page Contains Element    ${SEARCHBAR}
