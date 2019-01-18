*** Settings ***
 
Library    SSHLibrary    


*** Variables ***
${coreOamIP}          135.1.172.61    # OAM101/OAM102 IP address used for backchannel test manipulation
${coreOamLogin}       root    # OAM101/OAM102 login used for backchannel test manipulation
${coreOamPassword}    changeme    # OAM101/OAM102 password used for backchannel test manipulation


*** Test Cases ***

Login to server and perform a command
    Log    *** Login the host ***
    AAA - Login and check aaa status    ${coreOamIP}    ${coreOamLogin}    ${coreOamPassword}
   



*** Keywords ***
AAA - Login and check aaa status
    [Arguments]    ${input_ip}    ${input_login}    ${input_password}
    Open Connection    ${input_ip}    alias=lnxphAAA-lnxphoam11
    Login    ${input_login}    ${input_password}
    Get File     /usr/local/netzwert/AAA/log/*.log      C:${/}Users${/}dragos${/}RobotFrameworkTestsWork${/}SprintTask${/}logs