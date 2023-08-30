*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Keywords ***
Dado que faço login
    Open Browser      url=https://www.saucedemo.com/   browser=Chrome
    Input Text        css=#user-name         performance_glitch_user
    Input Password    css=#password         secret_sauce
    Click Element     css=#login-button
    Wait Until Element Is Visible    css=#add-to-cart-sauce-labs-backpack