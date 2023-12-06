* Settings *
Library    Collections

* Variables *
@{listem}=    Yusuf    Mehmet    Efe    Emel


* Test Cases *
Ders 1
    FOR    ${element}    IN    @{listem}
        Log To Console    ${element}
        
    END

    Append To List    ${listem}    Sofia    Aida    Anne

    FOR    ${element}    IN    @{listem}
        Log To Console    ${element}
    END

    ${yeni}=    Get From List    ${listem}    2

    Log To Console    ${yeni}

    ${yepyeni}=    Get Index From List    ${listem}    Efe
    Log To Console    Efenin index numarasi: ${yepyeni}

    @{liste}=    Create List
    Append To List    ${liste}    Yusuf    Mehmet    huseyin


    Log To Console   burasi yeni ${listem}[1]


    FOR    ${element}    IN RANGE    50    100
        Log To Console    ${element}
        
    END
