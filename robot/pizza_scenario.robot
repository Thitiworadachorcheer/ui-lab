*** Settings ***
Documentation    Test case QP-01, A custom pizza reaches the admin list.
Resource    resources/quickpizza.resource
Library    DateTime
Test Teardown    Close Browser

*** Test Cases ***
QP-01 A Custom Pizza Reaches The Admin List
    [Documentation]    A pizza request with restrictions gives a pizza that
    ...    keeps them, rating needs a login, and the admin sees the pizza.
    Open QuickPizza
    Turn On Advanced
    ${stamp}=    Get Current Date    result_format=%Y%m%d-%H%M%S
    ${name}=     Set Variable        Lab Pizza ${stamp}
    Fill In The Pizza Request    600    Knife    ${name}
    Capture Page Screenshot    qp01-step3-fields.png
    Ask For A Pizza
    ${tool}=    Recommendation Should Keep The Restrictions
    ...    ${name}    Knife    600
    Capture Element Screenshot    id:recommendations    qp01-step4-pizza.png
