*** Settings ***
Resource    ../../pages/base_page.robot

Test Setup    base_page.Abrir Navegador
Test Teardown    base_page.Fechar Navegador

*** Test Cases ***
Selecionar Sauce Labs Backpack
    Preencher usuario    standard_user
    Preencher senha    secret_sauce
    Clicar no botão login
    Element Text Should Be    ${titulo_secao}    Products
    Clicar no produto    Sauce Labs Backpack
    Element Text Should Be    ${product_name_inventory}    Sauce Labs Backpack
    Element Text Should Be    ${product_price_inventory}    $29.99
    Clicar no botão "Add to cart"
    Clicar no carrinho
    Element Text Should Be    ${titulo_secao}    Your Cart
    Element Text Should Be    ${product_name_cart}    Sauce Labs Backpack
    Element Text Should Be    ${product_price_cart}    $29.99
    Element Text Should Be    ${quantity}    1
    Realizar Logout


