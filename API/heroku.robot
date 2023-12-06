*** Settings ***
Documentation       Bu suite heroku sitesinin API sorgularini test eder.

Library             RequestsLibrary
Library             OperatingSystem
Library             Collections
Library             SeleniumLibrary


*** Variables ***
${BASE_URL}=    https://restful-booker.herokuapp.com
&{HEADERS}=     Content-Type=application/json


*** Test Cases ***
Get Booking Ids
    [Documentation]    Kayitli tum rezervasyonlarin ID'sini döndurur.
    ${END_POINT}=    Set Variable    /booking
    Create Session    getBookingIds    ${BASE_URL}    verify=${True}
    ${response}=    GET On Session    getBookingIds    ${END_POINT}

    Status Should Be    200

Create Booking
    [Documentation]    Yeni bir rezervasyon olusturur.
    ${END_POINT}=    Set Variable    /booking
    ${bookingdates}=    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01
    ${totalprice}=    Convert To Integer    1000
    ${depositpaid}=    Convert To Boolean    ${True}
    ${BODY}=    Create Dictionary
    ...    firstname=Yusuf
    ...    lastname=Renk
    ...    totalprice=${totalprice}
    ...    depositpaid=${depositpaid}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=Meal

    Create Session    createBooking    ${BASE_URL}    headers=${HEADERS}    verify=${True}
    ${response}=    POST On Session    createBooking    ${END_POINT}    json=${BODY}
    Status Should Be    200

    ${bookingID}=    Set Variable    ${response.json()}[bookingid]
    Set Suite Variable    ${bookingID}

    &{resBody}=    Convert To Dictionary    ${response.json()}

    Dictionaries Should Be Equal    ${resBody}[booking]    ${BODY}

GetBooking
    [Documentation]    Parametre olarak gonderilen ID'ye ait rezervasyon bilgilerini dondurur.
    ${END_POINT}=    Set Variable    /booking/${bookingID}
    Create Session    getBooking    ${BASE_URL}    verify=${True}
    ${response}=    GET On Session    getBooking    ${END_POINT}

    Status Should Be    200

Update Booking
    [Documentation]    Varolan bir rezervasyonun bilgilerini gunceller
    [Setup]    Create Token

    ${END_POINT}=    Set Variable    /booking/${bookingID}
    Set To Dictionary    ${HEADERS}    Accept=application/json    Cookie=token=${TOKEN}

    ${bookingdates}=    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01
    ${totalprice}=    Convert To Integer    1000
    ${depositpaid}=    Convert To Boolean    ${True}
    ${BODY}=    Create Dictionary
    ...    firstname=Yusufff
    ...    lastname=Renkkkk
    ...    totalprice=${totalprice}
    ...    depositpaid=${depositpaid}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=Meallll

    Create Session    updateBooking    ${BASE_URL}    headers=${HEADERS}    verify=${True}
    ${response}=    PUT On Session    updateBooking    ${END_POINT}    json=${BODY}

    Status Should Be    200

    Dictionaries Should Be Equal    ${BODY}    ${response.json()}

Delete Booking
    [Documentation]    ID'si bilinen rezervasyonu siler.
    [Setup]    Create Token

    ${END_POINT}=    Set Variable    /booking/${bookingID}
    Set To Dictionary    ${HEADERS}    Cookie=token=${TOKEN}

    Create Session    deleteBooking    ${BASE_URL}    headers=${HEADERS}    verify=${True}
    ${response}=    DELETE On Session    deleteBooking    ${END_POINT}

    Status Should Be    201


*** Keywords ***
Create Token
    [Documentation]    Bu keyword Token olusturur ve olusan Tokeni set suite variable olarak atar.
    ${END_POINT}=    Set Variable    /auth
    &{BODY}=    Create Dictionary    username=admin    password=password123

    # ${BODY2}=    Set Variable    {"username" : "admin", "password" : "password123"}

    Create Session    createToken    ${BASE_URL}    headers=${HEADERS}    verify=True
    ${response}=    POST On Session    createToken    ${END_POINT}    json=${BODY}
    # ${response}=    POST On Session    createToken    ${END_POINT}    data=${BODY2}

    Status Should Be    200
    ${TOKEN}=    Set Variable    ${response.json()}[token]

    Set Suite Variable    ${TOKEN}

Create Token V2
    [Documentation]    Bu keyword Token olusturur ve olusan Tokeni geri döndurur.
    ${END_POINT}=    Set Variable    /auth
    &{BODY}=    Create Dictionary    username=admin    password=password123

    Create Session    createToken    ${BASE_URL}    headers=${HEADERS}    verify=True
    ${response}=    POST On Session    createToken    ${END_POINT}    json=${BODY}

    Status Should Be    200
    RETURN    ${response.json()}[token]

    # Kullanim sekli: Test icerisindeyken=>    ${yeni_token}=    Create Token V2
