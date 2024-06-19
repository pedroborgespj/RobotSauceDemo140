*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Variaveis em Page Object são os seletores dos elementos da pagina
${txt_usuario}    css=[data-test="username"]
${txt_senha}    css=[data-test="password"]
${btn_login}    id=login-button

*** Keywords ***
Preencher usuario
    [Arguments]    ${usuario}
    Input Text    ${txt_usuario}    ${usuario}

Preencher senha
    [Arguments]    ${senha}
    Input Password    ${txt_senha}    ${senha}

Clicar no botao login
    Click Button    ${btn_login}