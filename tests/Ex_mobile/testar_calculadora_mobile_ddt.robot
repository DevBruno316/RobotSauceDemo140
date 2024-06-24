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
Test Template    Calcular
*** Variables ***
${SAUCE_ACCESS_KEY}    a5e1ea32-9cd4-479c-902f-e0520264f520
${SAUCE_USERNAME}    oauth-studybruno000-867c0
${REMOTE_URL}    https://${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
${equal}    xpath=//android.widget.ImageButton[@content-desc="equals"]
${final_result}    xpath=//android.widget.TextView[@resource-id="com.google.android.calculator:id/result_final"]

*** Test Cases ***
TC001    7    9    plus    +
TC002    4    1    minus    -
TC003    7    2    multiply    *
TC004    9    3    divide    /
TC005    9    1    plus    +
TC006    6    5    multiply    *

TC007    8    4    divide    /
TC008    2    5    plus    +
TC009    1    5    multiply    *
TC010    9    9    divide    /
TC011    6    2    minus    -
TC012    7    8    plus    +
TC013    4    2    divide    /
TC014    1    1    multiply    *
TC015    9    9    multiply    *
TC016    9    8    minus    -


*** Keywords ***
Calcular
    [Arguments]    ${number1}    ${number2}    ${tipo_operacao}    ${simbolo_operacao}
    Limpar
    ${num_1}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="${number1}"]
    Click Element    ${num_1}

    ${operacao}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="${tipo_operacao}"]
    Click Element    ${operacao}

    ${num_2}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="${number2}"]
    Click Element    ${num_2}

    Click Element    ${equal}

    ${number_1}    Set Variable   ${number1}
    ${number_2}    Set Variable   ${number2}

    ${operacao_2_nums}=    Evaluate    ${number_1} ${simbolo_operacao} ${number_2}  
    
    ${operacao_2_nums}=     Convert To Integer    ${operacao_2_nums}
    ${operacao_2_nums_str}=    Convert To String    ${operacao_2_nums}
    
    Element Text Should Be    ${final_result}    ${operacao_2_nums_str}


Limpar
    Click Element    xpath=//android.widget.ImageButton[@content-desc="clear"]

