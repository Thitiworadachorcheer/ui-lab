*** Settings ***
Documentation    Keywords for the QuickPizza pages that QP-01 visits.
Library    SeleniumLibrary    timeout=10s
Library    DateTime

*** Variables ***
${URL}        https://quickpizza.grafana.com
${BROWSER}    chrome
${HEADING}    Looking to break out of your pizza routine?
${MAX CALORIES}    xpath://label[contains(.,'Max Calories')]/../input


*** Keywords ***
Open QuickPizza
    [Documentation]    QP-01 step 1. Open the home page.
    Open Browser    ${URL}    ${BROWSER}
    ...    service=executable_path=r'%{CHROMEDRIVER}'
    Set Window Size    1280    1600
    Wait Until Element Is Visible    css:h1
    Element Text Should Be    css:h1    ${HEADING}

Turn On Advanced
    ${stamp}=    Get Current Date    result_format=%Y%m%d-%H%M%S
    ${name}=     Set Variable        Lab Pizza ${stamp}
    Fill In The Pizza Request    600    Knife    ${name}
    Capture Page Screenshot    qp01-step3-fields.png

Fill In The Pizza Request
    [Documentation]    QP-01 step 3. Type the restrictions and the name.
    [Arguments]    ${calories}    ${tool}    ${name}
    Input Text    ${MAX CALORIES}    ${calories}
    Select From List By Label    css:select    ${tool}
    Select Checkbox    id:default-checkbox
    Input Text    css:input#pizza-name    ${name}
    Textfield Value Should Be    ${MAX CALORIES}    ${calories}
    List Selection Should Be    css:select    ${tool}
    Checkbox Should Be Selected    id:default-checkbox
    Textfield Value Should Be    css:input#pizza-name    ${name}