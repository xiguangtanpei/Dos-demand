@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  对于传入的路径是否使用window 风格  \   不是window 风格 / 
rem  主要是使用字符替换功能 falg = 0 window 风格  1 是其他风格 

set  "InString=%~1"
set   "Flag=%~2" 

set  "WindowFlag=\"
set   "OtherFlag=/"
set "result="
if "%Flag%" == "0" (
    call  set  "result=%%InString:%OtherFlag%=%WindowFlag%%%"
) else (
     call  set  "result=%%InString:%WindowFlag%=%OtherFlag%%%"
)
rem 利用go循环转换 

set "NormalPath=!result!"
@REM echo %NormalPath%
@REM echo !result!

if "%Flag%" == "0" (
    :relace_window 
    if not "!NormalPath!" == "!NormalPath:\\=\!" (
        set "NormalPath=!NormalPath:\\=\!"
        goto relace_window
    )
) else  (

    :no_window 
    if not "!NormalPath!" == "!NormalPath://=/!" (
        set "NormalPath=!NormalPath://=/!"
        goto no_window
    )
)


@REM echo  !NormalPath!

endlocal  & set  "GLOBAL_VALUE_InStringIsWindowFlagBat=%NormalPath%"
