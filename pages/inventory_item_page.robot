*** Settings ***
Library    SeleniumLibrary
*** Variables ***

${product_name_inventory}    css=div.inventory_details_name.large_size
${product_price_inventory}    css=div.inventory_details_price
${btn_add_to_cart}    css=button.btn.btn_primary.btn_small.btn_inventory

*** Keywords ***

Clicar no botão "Add to cart"
    Click Button    ${btn_add_to_cart}


    