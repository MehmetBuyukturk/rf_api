*** Settings ***
Documentation    If ve Else statement dersleri


*** Variables ***
${metin1}=    Ben varim
${sayi1}=    10
${sayi2}=    20




*** Test Cases ***
Ders 2
    [Documentation]    if else alistirmalari
    [Tags]    amca
    IF    ${sayi1} > ${sayi2}
        Log To Console    ${sayi1} buyuktur ${sayi2}
    ELSE
        Log To Console    ${sayi2} buyuktur ${sayi1}
    
    END

    
    IF    'Ben varim' == '${metin1}'
        Log To Console    yazilar ayni
        
    END

    Run Keyword If    3 == 3    Log To Console    uc uce esitmis

    # keywordu calistirir olumluysa true olumsuzsa false döndurur
    # cookies lerde kullanilabilinir
    ${sonuc}=    Run Keyword And Return Status    Should Be Empty    ${metin1}
    Log To Console    ${sonuc}

    



