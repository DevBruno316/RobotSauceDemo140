*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Variaveis em page object são os seletores dos elementos da página
${txt_usuario}    css=[data-test="username"]
${txt_password}    css=[data-test="password"]
${btn-login}    id=login-button




*** Keywords ***
Preencher usuario
    [Arguments]    ${usuario}
    Input Text    ${txt_usuario}    ${usuario}

Preencher senha
    [Arguments]    ${password}
    Input Password    ${txt_password}    ${password}

Clicar no botão login
    Click Button    ${btn-login}


