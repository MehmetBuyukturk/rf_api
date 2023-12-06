*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    Testbase.robot

Test Setup    Go to website

*** Variables ***
@{expectedMenu}=    BOOKS    COMPUTERS    ELECTRONICS    APPAREL & SHOES    DIGITAL DOWNLOADS    JEWELRY    GIFT CARDS


*** Test Cases ***
Kategorilerin kontrolu
    ${kategoriler}=    Get WebElements    xpath=//ul[@class='top-menu']/li/a

    @{actualMenu}=    Create List

    FOR    ${element}    IN    @{kategoriler}
        ${text}    Get Text    ${element}
        Append To List    ${actualMenu}    ${text}     
    END
    Lists Should Be Equal    ${expectedMenu}    ${actualMenu}

Urun fiyati kontrolu
    ${actualFiyat}=    Get Text    xpath=(//span[@class='price actual-price'])[2]
    Urun sayfasina git
    ${expectedFiyat}=    Get Text    xpath=//span[@class='price-value-31']
    Should Be Equal    ${actualFiyat}    ${expectedFiyat}

Urunu sepete ekle
    Urun sayfasina git
    Click Element    xpath=//input[@id='add-to-cart-button-31']
    Wait Until Page Contains    The product has been added to your shopping cart    timeout=30
    ${expectedTitle}=    Get Text    xpath=//h1
    Click Link    xpath=//li[@id='topcartlink']/a
    ${actualTitle}=    Get Text    xpath=//td[@class='product']/a
    Should Be Equal As Strings    ${expectedTitle}    ${actualTitle}
    


*** Keywords ***

Urun sayfasina git
    Click Link    xpath=(//h2[@class='product-title'])[2]/a

