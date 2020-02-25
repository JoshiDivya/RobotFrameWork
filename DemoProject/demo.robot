*** Settings ***
Suite Setup       Log To Console    Suite started
Suite Teardown    Log To Console    Suite Completed
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
    Login
    Close Browser
    Log To Console    %{username} ran this test on %{os}

Test3
    [Tags]    Sanity
    [Setup]    GoToHomePage
    Login
    Set Tags    SmokeTest
    Log To Console    Successfully
    Remove Tags    SmokeTest
    [Teardown]    Close All Browsers

*** Keywords ***
LoginKW
    Input Text    id = txtUsername    &{Login}[Username]
    Input Password    id = txtPassword    &{Login}[password]
    Click Button    id = btnLogin

GoToHomePage
    Open Browser    ${url}    chrome
