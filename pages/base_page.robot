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
${date}

*** Keywords ***

Abrir Navegador
    Register Keyword To Run On Failure    Tirar screenshot
    Open Browser    url=${url}    browser=${browser}
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.login_logo    ${timeout}
Fechar Navegador
    Sleep    500ms    # Pode ser nmecessário para dar tempo de realizar ultima ação
    Close Browser  
Clicar no carrinho
    Click Element    css=[data-test="shopping-cart-link"]    
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}
Realizar Logout
    Click Element    id=react-burguer-menu-btn
    Click Element    id=logout_sidebar_link
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Obter data e hora
    ${date}=     Get Current Date 
    ${date}=    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S

Tirar screenshot    
    [Arguments]    ${screenshot_name}
    # Ler a data do sistema operacional
    
    Capture Page Screenshot    screenshots/${date}/${TEST_NAME}/${screenshot_name}.jpg

    # 1 - Screenshots/<system_name>/<test_name>/<date>.jpg
    # 2 - Screenshots/<system_name>/<date>/<test_name>.jpg


    
