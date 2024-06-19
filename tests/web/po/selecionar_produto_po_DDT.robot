*** Settings ***
Resource    ../../../pages/base_page.robot
Test Template    Selecionar Produto
    


*** Test Cases ***
TC001    Sauce Labs Backpack    $29.99
TC002    Sauce Labs Bike Light    $9.99
TC003    Sauce Labs Bolt T-Shirt    $15.99
TC004    Sauce Labs Fleece Jacket    $49.99
TC005    Sauce Labs Onesie    $7.99
TC006    Test.allTheThings() T-Shirt (Red)    $15.99

*** Keywords ***
Selecionar Produto
    [Arguments]    ${product_name}    ${price}
    Tirar screenshot    1-Home
    Preencher usuario    standard_user
    Preencher senha    secret_sauce
    Tirar screenshot    2-Login Preenchido
    Clicar no botão login 
    Element Text Should Be    ${titulo_secao}    Products
    Tirar screenshot    3-Lista De Produtos
    Clicar no produto    ${product_name}
    Element Text Should Be    ${product_name_inventory}    ${product_name}
    Element Text Should Be    ${product_price_inventory}    ${price}
    Tirar screenshot    4-Detalhes produto
    Clicar no botão "Add to cart"
    Clicar no carrinho
    Element Text Should Be    ${titulo_secao}    Your Cart
    Element Text Should Be    ${product_name_cart}    ${product_name}
    Element Text Should Be    ${product_price_cart}    ${price}
    Element Text Should Be    ${quantity}    1
    Tirar screenshot    5-Carrinho 
    Realizar Logout


