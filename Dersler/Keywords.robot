*** Settings ***
Library    SeleniumLibrary
Resource    ornekKeyword.robot

Test Setup    ornek Keyword
Test Teardown    Log To Console    Testin sonunda calisir

*** Variables ***
${isim}=    Mehmet

*** Test Cases ***
Ders1
    Ekrana Merhaba Yaz
    Ekrana Yaz    yusuf
    Opsiyonel Parametre Alan Keywords    Zorunu parametre
    Opsiyonel Parametre Alan Keywords    Zorunlu parametre    Opsiyonel parametre
    Benim adim ${isim} soyadim Buyukturk
    


*** Keywords ***
Ekrana Merhaba Yaz
    Log To Console    Merhaba

Ekrana Yaz
    [Arguments]    ${kelime}
    Log To Console    ${kelime}

Birden Cok parametre Alan Keyword
    [Arguments]    ${kelime}    ${kelime2}
    Log To Console    ${kelime} ${kelime2}

Opsiyonel Parametre Alan Keywords
    [Arguments]    ${kelime1}    ${kelime2}=Renkoglu
    Log To Console    ${kelime1} ${kelime2}

Benim adim ${isim} soyadim Buyukturk
    Log To Console    ${isim}