*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_id}
${book_name}    RobotFramework


*** Test Cases ***
Add Book into Library DataBase
    &{req_body}=    Create Dictionary    name=${book_name}    isbn=2341220    aisle=234998    author=rahulshetty
    ${response}=    POST    ${base_url}/Library/AddBook.php    json=${req_body}    expected_status=200
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    
Get Book details by title
    ${response}=    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    Should Be Equal As Strings    ${book_name}    ${response.json()}[0][book_name]

Delete Book from database
    &{delete_req}=    Create Dictionary    ID=${book_id}
    ${response}=    DELETE        ${base_url}/Library/DeleteBook.php    json=${delete_req}
    Should Be Equal As Strings    book is successfully deleted    ${response.json()}[Msg]


