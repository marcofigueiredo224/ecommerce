*** Settings ***
Resource    ../main.robot

*** Variables ***
${Titulo_PaginaInicial}         xpath=//span[contains(.,'Products')]     
${Botao_AdicionarCarrinho}      id=add-to-cart-sauce-labs-bike-light
${Icone_ItemnoCarrinho}         class=shopping_cart_badge  
${Botao_Remove}                 id=remove-sauce-labs-bike-light
${Icone_CarrinhosemItem}        class=shopping_cart_badge

*** Keywords ***
 Dado que estou na tela inicial
    Element Should Be Visible      ${Titulo_PaginaInicial} 

Quando clico no botão "Add to cart"
    Click Element                ${Botao_AdicionarCarrinho} 

Então o item deve ser adicionado ao carrinho
    Element Should Be Visible    ${Icone_ItemnoCarrinho}   

E adiciono o item ao carrinho
    Element Should Be Visible    ${Icone_ItemnoCarrinho} 

E em seguida clico no botão "Remove"
    Click Element                ${Botao_Remove} 

Então o item deve ser removido do carrinho
    Element Should Not Be Visible    ${Icone_CarrinhosemItem} 