*** Settings ***

Library    Collections

*** Variables ***
${isim}=    Yusuf
@{liste}=    Yusuf    ahmet    Mehmet
&{anahtardeger}=    name=Yusuf    lastname=renkoglu    age=38

*** Test Cases ***
Ders1
    Log To Console    ${anahtardeger}[name]

    Set To Dictionary    ${anahtardeger}    city=helsinki
    Log To Console    ${anahtardeger}

    ${i}=    Set Variable    0
    WHILE    ${i} <= 100

        Log To Console    ${i}
        ${i}=    Evaluate    ${i} + 1
    
    END