*** Settings ***
Resource    ../resources/main.robot
Resource    ../resources/pages/adicionar_carrinho.robot
Test Setup          Dado que faço login

*** Test Cases ***
Adcionar/Remover item ao carrinho
    Dado que estou na tela inicial
    Quando clico no botão "Add to cart"
    Então o item deve ser adicionado ao carrinho

    Dado que estou na tela inicial
    E adiciono o item ao carrinho
    E em seguida clico no botão "Remove"
    Então o item deve ser removido do carrinho

Funcionalidades do filtro
    Dado que estou na tela inicial
    Quando clico no campo filtro
    E filtro por Name A to Z
    Então o sistema deve retornar os produtos por Name A to Z

    Dado que estou na tela inicial
    Quando clico no campo filtro
    E filtro por Name Z to A
    Então o sistema deve retornar os produtos por Name Z to A

    Dado que estou na tela inicial
    Quando clico no campo filtro
    E filtro por Price low to high
    Então o sistema deve retornar os produtos por low to high
   
    Dado que estou na tela inicial
    Quando clico no campo filtro
    E filtro por Price high to low
    Então o sistema deve retornar os produtos por high to low

    


