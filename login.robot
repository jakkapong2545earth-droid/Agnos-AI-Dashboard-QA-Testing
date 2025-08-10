*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Speed    0.5s

*** Variables ***
${LOGIN_URL}    https://dev.app.agnoshealth.com/ai_dashboard/login/
${SIGNUP_URL}   https://dev.app.agnoshealth.com/ai_dashboard/agnos/sign_up
${EMAIL_OK}     test@gmail.com
${PASS_OK}      12345
${BROWSER}      Chrome
${TIMEOUT}      10s

*** Test Cases ***
Login Success Simple
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@type="email"]    ${TIMEOUT}
    Input Text    xpath=//input[@type="email"]    ${EMAIL_OK}
    Input Text    xpath=//input[@type="password"]    ${PASS_OK}
    Click Element    xpath=//button[.//div[normalize-space(text())="Sign in"]]
    Sleep    5s
    [Teardown]    Close Browser


Login Wrong Email
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@type="email"]    ${TIMEOUT}
    Input Text    xpath=//input[@type="email"]    ex01
    Input Text    xpath=//input[@type="password"]    12345
    Click Element    xpath=//button[.//div[normalize-space(text())="Sign in"]]
    Wait Until Location Contains    /ai_dashboard/login    5s
    Page Should Contain    Log-in
    [Teardown]    Close Browser


Login Wrong Password
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@type="email"]    ${TIMEOUT}
    Input Text    xpath=//input[@type="email"]    ${EMAIL_OK}
    Input Text    xpath=//input[@type="password"]    1234
    Click Element    xpath=//button[.//div[normalize-space(text())="Sign in"]]
    Wait Until Location Contains    /ai_dashboard/login    5s
    Page Should Contain    Log-in
    [Teardown]    Close Browser


Sign Up Success
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:Email    ${TIMEOUT}
    Input Text    id:Email    ex01@example.com
    Input Text    (//input[@type='password'])[1]    12345@It
    Input Text    (//input[@type='password'])[2]    12345@It

    Click Element    xpath=//button[.//div[normalize-space()='Confirm']]
    Sleep    7s
    [Teardown]    Close Browser


Sign Up Wrong Email
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:Email    ${TIMEOUT}
    Input Text    id:Email    ex01
    Input Text    (//input[@type='password'])[1]    12345@It
    Input Text    (//input[@type='password'])[2]    12345@It

    Click Element    xpath=//button[.//div[normalize-space()='Confirm']]
    Sleep    7s
    [Teardown]    Close Browser
    
    
Sign Up Wrong Password
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:Email    ${TIMEOUT}
    Input Text    id:Email    ex01@example.com
    Input Text    (//input[@type='password'])[1]    12345678
    Input Text    (//input[@type='password'])[2]    12345678

    Click Element    xpath=//button[.//div[normalize-space()='Confirm']]
    Sleep    7s
    [Teardown]    Close Browser


Login and work case
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@type="email"]    ${TIMEOUT}
    Input Text    xpath=//input[@type="email"]    ${EMAIL_OK}
    Input Text    xpath=//input[@type="password"]    ${PASS_OK}
    Click Element    xpath=//button[.//div[normalize-space(text())="Sign in"]]
    Sleep    4s
    Click Element    xpath=//div[div[normalize-space(.)="All"]]//img
    Sleep    1s
    Click Element    xpath=//div[div[normalize-space(text())="Seek Medical"]]/img
    Sleep    1s
    Click Element    xpath=//div[normalize-space(text())="Channel"]
    Sleep    1s
    Click Element    xpath=//div[normalize-space(text())="All"]
    Sleep    1s
    Click Element    xpath=//div[normalize-space(text())="Agnos application"]
    Sleep    1s
    Click Element    xpath=//div[normalize-space(text())="Channel"]
    Sleep    1s
    Click Element    xpath=//img[@alt="calendar"]
    Sleep    1s
    Click Element    xpath=//div[contains(@class,'rdp-dropdown_month')]/select
    Sleep    1s
    Select From List By Label        css=select[name="months"]    July
    Sleep    1s
    Click Element    xpath=//div[contains(@class,'rdp-dropdown_month')]/select
    Sleep    1s
    Click Element    xpath=//button[@name="day" and normalize-space(text())="18"]
    Sleep    1s
    Click Button    xpath=//button[normalize-space(.)="Apply"]
    Sleep    2s
    Input Text       xpath=//input[@placeholder="Patient name, Patient contact, Record ID, Record code"]    336
    Click Element    xpath=//button[normalize-space(text())="Search"]
    Sleep    1s
    Click Element    xpath=//button[normalize-space(text())="Move to In-progress"]
    Sleep    1s
    Click Element    xpath=//div[normalize-space(.)="ยืนยัน"]/ancestor::button[1]
    Sleep    1s
    Click Element    xpath=//div[normalize-space(.)='In progress']
    Sleep    1s
    Click Element    xpath=//button[normalize-space(.)='Complete']
    Sleep    1s
    Click Element    xpath=//div[normalize-space(text())='ยืนยัน']
    Sleep    1s
    Click Element    xpath=//div[normalize-space(.)='Completed']
    Sleep    6s
    Click Element    xpath=//div[normalize-space(text())='Log Out']
    Sleep    7s
    [Teardown]    Close Browser

