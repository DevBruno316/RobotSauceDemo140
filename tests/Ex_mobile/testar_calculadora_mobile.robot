*** Settings ***
Library    AppiumLibrary
Library    BuiltIn

Suite Setup    Open Application    ${REMOTE_URL}
    ...    platformName=Android
    ...    appium:platformVersion=9.0
    ...    appium:deviceName=Samsung Galaxy S9 FHD GoogleAPI Emulator
    ...    appium:deviceOrientation=portrait
    ...    appium:app=storage:filename=Calculator_8.6 (599694508)_APKPure.apk
    ...    appium:appPackage=com.google.android.calculator
    ...    appium:appActivity=com.android.calculator2.Calculator
    ...    browserName=    
    ...    appium:ensureWebviewsHavePages=${True}    
    ...    appium:nativeWebScreenshot=${True}
    #...    sauce:options=[object Object]
    ...    appium:newCommandTimeout=${3600}
    ...    appium:connectHardwareKeyboard=${True}
    
Suite Teardown    Close Application 

*** Variables ***
${SAUCE_ACCESS_KEY}    a5e1ea32-9cd4-479c-902f-e0520264f520
${SAUCE_USERNAME}    oauth-studybruno000-867c0
${REMOTE_URL}    https://${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
${equal}    xpath=//android.widget.ImageButton[@content-desc="equals"]
${final_result}    xpath=//android.widget.TextView[@resource-id="com.google.android.calculator:id/result_final"]
*** Test Cases ***
Somar
    ${num_1}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="4"]
    Click Element    ${num_1}

    ${plus}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="plus"]
    Click Element    ${plus}

    ${num_2}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="8"]
    Click Element    ${num_2}

    Click Element    ${equal}

    ${number_1}    Set Variable   4
    ${number_2}    Set Variable   8


    ${soma_2_nums}=    Evaluate    ${number_1} + ${number_2}  

    ${soma_2_nums_str}=    Convert To String    ${soma_2_nums}
    
    Element Text Should Be    ${final_result}    ${soma_2_nums_str}

Subtrair
    Limpar
    ${num_1}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="9"]
    Click Element    ${num_1}
    
    ${minus}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="minus"]
    Click Element    ${minus}

    ${num_2}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="3"]
    Click Element    ${num_2}

    Click Element    ${equal}

    ${number_1}    Set Variable   9
    ${number_2}    Set Variable   3

    ${subtrai_2_nums}=    Evaluate    ${number_1} - ${number_2}  

    ${subtrai_2_nums_str}=    Convert To String    ${subtrai_2_nums}
    
    Element Text Should Be    ${final_result}    ${subtrai_2_nums_str}

Multiplicar
    Limpar
    ${num_1}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="7"]
    Click Element    ${num_1}

    ${multiply}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="multiply"]
    Click Element    ${multiply}

    ${num_2}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="8"]
    Click Element    ${num_2}

    Click Element    ${equal}

    ${number_1}    Set Variable   7
    ${number_2}    Set Variable   8

    ${multiplica_2_nums}=    Evaluate    ${number_1} * ${number_2}  

    ${multiplica_2_nums_str}=    Convert To String    ${multiplica_2_nums}
    
    Element Text Should Be    ${final_result}    ${multiplica_2_nums_str}

Dividir
    Limpar
    ${num_1}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="8"]
    Click Element    ${num_1}

    ${divide}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="divide"]
    Click Element    ${divide}

    ${num_2}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="2"]
    Click Element    ${num_2}

    Click Element    ${equal}

    ${number_1}    Set Variable   8
    ${number_2}    Set Variable   2

    ${divide_2_nums}=    Evaluate    ${number_1} / ${number_2}  
    
    ${divide_2_nums}=     Convert To Integer    ${divide_2_nums}
    ${divide_2_nums_str}=    Convert To String    ${divide_2_nums}
    
    Element Text Should Be    ${final_result}    ${divide_2_nums_str}


*** Keywords ***

Limpar
    Click Element    xpath=//android.widget.ImageButton[@content-desc="clear"]

