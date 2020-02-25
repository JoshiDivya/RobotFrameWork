*** Settings ***
Suite Setup       Log To Console    Test suite started
Suite Teardown    Log To Console    suite completed
Library           SeleniumLibrary

*** Variables ***
${url}            https://www.youtube.com/

*** Test Cases ***
SuiteTest
    [Tags]    ST
    [Setup]    GoToHomePage
    Log To Console    I am SuiteTest
    [Teardown]    Close All Browsers

*** Keywords ***
GoToHomePage
    Open Browser    ${url}    chrome
