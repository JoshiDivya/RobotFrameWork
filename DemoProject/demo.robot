*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/login
@{Credentials}    Admin    admin123
&{Login}          Username=Admin    password=admin123

*** Test Cases ***
TestCase1
    Open Browser    https://robotframework.org/    chrome
    Close Browser
    Log To Console    Confirmation successfully

Test2
    [Tags]    Test2
    Open Browser    ${url}    chrome
    Input Text    id = txtUsername    &{Login}[Username]
    Input Password    id = txtPassword    &{Login}[password]
    Click Button    id = btnLogin
    Close Browser
    Log To Console    %{username} ran this test on %{os}

Test3
    [Tags]    Test3
    Open Browser    ${url} chrome
    Login
    Close All Browsers

*** Keywords ***
Login
    Input Text    id = txtUsername    Admin
    Input Password    id = txtPassword    admin123
    Click Button    id = btnLogin
