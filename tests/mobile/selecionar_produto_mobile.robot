# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command

*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Variables ***
${SAUCE_USERNAME}    oauth-bulldogbastter-b40c0
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub

*** Test Cases ***
Selecionar mochila
    Open Application    ${REMOTE_URL}
    ...    platformName=Android
    ...    appium:platformVersion=9.0
    ...    appium:deviceName=Samsung Galaxy S9 FHD GoogleAPI Emulator
    ...    appium:deviceOrientation=portrait
    ...    appium:app=storage:filename=mda-2.0.2-23.apk
    ...    appium:appPackage=com.saucelabs.mydemoapp.android
    ...    appium:appActivity=com.saucelabs.mydemoapp.android.view.activities.SplashActivity
    ...    browserName=    
    ...    appium:ensureWebviewsHavePages=${True}    
    ...    appium:nativeWebScreenshot=${True}
    #...    sauce:options=[object Object]
    ...    appium:newCommandTimeout=${3600}
    ...    appium:connectHardwareKeyboard=${True}
    # Fim da configuração do emulador/aparelho fisico e da inicialização    
    # Início dos passos da automação
    ${img_produto} =    Set Variable     xpath=//android.widget.ImageView[@content-desc="Sauce Labs Backpack"]
    Click Element    ${img_produto}
    Swipe    ${470}    ${1876}    ${457}    ${1624}
    ${btn_adicionar_carrinho} =    Set Variable     xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]
    Click Element    ${btn_adicionar_carrinho}
    ${ico_carrinho} =    Set Variable     xpath=//android.widget.RelativeLayout[@content-desc="Displays number of items in your cart"]/android.widget.ImageView
    Click Element    ${ico_carrinho}
    ${lbl_nome_produto} =    Set Variable     xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV"]
    Element Text Should Be    ${lbl_nome_produto}    Sauce Labs Backpack
    ${lbl_preco_produto} =    Set Variable     id=com.saucelabs.mydemoapp.android:id/priceTV
    Element Text Should Be    ${lbl_preco_produto}    $ 29.99