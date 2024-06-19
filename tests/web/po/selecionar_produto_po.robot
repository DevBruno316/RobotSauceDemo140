*** Settings ***
Resource    ../../../pages/base_page.robot
 
*** Test Cases ***
Selecionar Mochila
    Tirar screenshot    1-Home
    Preencher usuario    standard_user
    Preencher senha    secret_sauce
    Tirar screenshot    2-Login Preenchido
    Clicar no botão login
    Element Text Should Be    ${titulo_secao}    Products
    Tirar screenshot    3-Lista De Produtos
    Clicar no produto    Sauce Labs Backpack
    Element Text Should Be    ${product_name_inventory}    Sauce Labs Backpack
    Element Text Should Be    ${product_price_inventory}    $29.99
    Tirar screenshot    4-Detalhes produto
    Clicar no botão "Add to cart"
    Clicar no carrinho
    Element Text Should Be    ${titulo_secao}    Your Cart
    Element Text Should Be    ${product_name_cart}    Sauce Labs Backpack
    Element Text Should Be    ${product_price_cart}    $29.99
    Element Text Should Be    ${quantity}    1
    Tirar screenshot    5-Carrinho 
    Realizar Logout


