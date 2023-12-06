*** Settings ***
Documentation    Robot framework dersleri



*** Variables ***
${isim}=    Yusuf
${Sayi1}=    10



*** Test Cases ***
Ders 1
    [Documentation]    Robot framework te degiskenle
    [Tags]    degisken    Mehmet
    Log To Console    Benim adim ${isim}
    ${Sayi2}=    Set Variable    20
    ${toplam}=    Evaluate    ${Sayi1} + ${Sayi2}
    Log To Console    Sayilarin toplami ${toplam}


*** Keywords ***