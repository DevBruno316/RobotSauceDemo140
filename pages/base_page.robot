*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    cart_page.robot
Resource    inventory_item_page.robot
Resource    inventory_page.robot
Resource    login_page.robot

*** Variables ***
${timeout}    5000ms
${url}    https://www.saucedemo.com
${browser}    Chrome


*** Keywords ***

Abrir Navegador
    Register Keyword To Run On Failure    Tirar screenshot

Tirar screenshot
    ${date}=     Get Current Date 
    ${date}=    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    Capture Page Screenshot    
