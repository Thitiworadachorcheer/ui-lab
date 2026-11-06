*** Settings ***
Documentation    Test case QP-01, A custom pizza reaches the admin list.
Resource    resources/quickpizza.resource
Test Teardown    Close Browser

*** Test Cases ***
QP-01 A Custom Pizza Reaches The Admin List
    [Documentation]    A pizza request with restrictions gives a pizza that
    ...    keeps them, rating needs a login, and the admin sees the pizza.
    Open QuickPizza