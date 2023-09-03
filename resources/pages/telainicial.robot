*** Settings ***
Resource    ../main.robot

*** Variables ***
${Titulo_PaginaInicial}         xpath=//span[contains(.,'Products')]     
${Botao_AdicionarCarrinho}      id=add-to-cart-sauce-labs-bike-light
${Icone_ItemnoCarrinho}         class=shopping_cart_badge  
${Botao_Remove}                 id=remove-sauce-labs-bike-light
${Icone_CarrinhosemItem}        class=shopping_cart_badge
${campo_filtro}                 class=product_sort_container
${opcao_ZaA}                    css=#header_container > div.header_secondary_container > div > span > select > option:nth-child(2)
${opcao_AaZ}                    css=#header_container > div.header_secondary_container > div > span > select > option:nth-child(1)
${opcao_low_high}               css=#header_container > div.header_secondary_container > div > span > select > option:nth-child(3)
${opcao_high_low}               css=#header_container > div.header_secondary_container > div > span > select > option:nth-child(4)
${nome_produto}                 class=inventory_item_name
${preco_produto}                class=inventory_details_price
${icone_carrinho}               class=shopping_cart_link
${botao_chekout}                id=checkout
${campo_firstname}              id=first-name
${campo_lastname}               name=lastName
${campo_zip}                    name=postalCode
${botao_continue}               id=continue
${botao_finish}                 id=finish
${msg_sucesso}                  class=complete-header

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


Quando clico no campo filtro
    Click Element        ${campo_filtro}

 E filtro por Name Z to A
    Wait Until Element Is Visible    ${opcao_ZaA}   
    Click Element        ${opcao_ZaA}   

Então o sistema deve retornar os produtos por Name Z to A
    Sleep    2s    
    Page Should Contain     Name (Z to A)


E filtro por Name A to Z
    Wait Until Element Is Visible    ${opcao_AaZ} 
    Click Element   ${opcao_AaZ} 

Então o sistema deve retornar os produtos por Name A to Z
    Sleep    2s    
    Page Should Contain     Name (A to Z)    


E filtro por Price low to high
    Wait Until Element Is Visible    ${opcao_low_high} 
    Click Element   ${opcao_low_high} 
Então o sistema deve retornar os produtos por low to high
    Sleep    2s
    Page Should Contain    Price (low to high)


E filtro por Price high to low
    Wait Until Element Is Visible    ${opcao_high_low}
    Click Element   ${opcao_high_low}
Então o sistema deve retornar os produtos por high to low
    Sleep    2s
    Page Should Contain    Price (high to low)

Quando clico no nome de um produto
    Wait Until Element Is Visible     ${nome_produto}
    Click Element    ${nome_produto}

Então devo ser redirecionado para os detalhes do produto
    Wait Until Element Is Visible    ${preco_produto} 

 E clico no ícone "Carrinho"
    Click Element   ${icone_carrinho}  
E clico no bottão checkout
    Click Element    ${botao_chekout}
E preencho todos os campos do checkout 
    Wait Until Element Is Visible    ${campo_firstname} 
    Input Text    ${campo_firstname}     Erick
    Input Text    ${campo_lastname}    Pulgar
    Input Text    ${campo_zip}    49140000
E clico no botão "Continue"
    Click Element    ${botao_continue}
E em "Checkout Overview" clico no botão "Finish"
    Click Element    ${botao_finish}    
    
Então devera ser retornado uma mensagem de sucesso
    Wait Until Element Is Visible    ${msg_sucesso} 
