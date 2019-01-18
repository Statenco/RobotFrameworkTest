*** Settings ***
Library    SSHLibrary
Library    Selenium2Library


*** Variables ***
${oamIP}    135.1.172.69
${id}    root    
${pass}    changeme


*** Tasks ***
Login and get logs
    Log     ----Logging in----
    AAA - Login the server     ${oamip}    ${id}    ${pass}

*** Keywords ***
AAA - Login the server
    [Arguments]    ${input_ip}    ${input_login}    ${input_password}
     Open Connection    ${input_ip}    alias=lnxphAAA-lnxphoam11
    Login    ${input_login}    ${input_password}
    Sleep    10s
    Write Bare     /usr/local/netzwert/AAA/bin/ta-cli
    Write Bare   ./ta-cli
    Sleep    10s
    Write Bare   netzwert
    Sleep    3s
    Write Bare   netzwert
    Sleep    10s
    Write Bare   checkout
    Sleep    5s
    Write Bare   config
    Sleep    5s
    Write Bare   active
    Sleep    5s
    Write Bare   Autoconfig39.cfg
    Sleep    5s
    Get File     /root/Autoconfig39.cfg    C:${/}Users${/}dragos${/}RobotFrameworkTestsWork${/}SprintTask${/}config${/}
    