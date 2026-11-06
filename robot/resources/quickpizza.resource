*** Settings ***
Documentation    Keywords for the QuickPizza pages that QP-01 visits.
Library    SeleniumLibrary    timeout=10s

*** Variables ***
${URL}        https://quickpizza.grafana.com
${BROWSER}    chrome
${HEADING}    Looking to break out of your pizza routine?

*** Keywords ***
Open QuickPizza
    [Documentation]    QP-01 step 1. Open the home page.
    Open Browser    ${URL}    ${BROWSER}
    ...    service=executable_path=r'%{CHROMEDRIVER}'
    Set Window Size    1280    1600
    Wait Until Element Is Visible    css:h1
    Element Text Should Be    css:h1    ${HEADING}