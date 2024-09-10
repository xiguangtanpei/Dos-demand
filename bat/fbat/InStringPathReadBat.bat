@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  设置文件时只读模式  注意确保如果是文件 

set "InStringFile=%~1"
set  "result=false"

rem echo 打印输入:  %InStringFile%

if exist "%InStringFile%" (
    if exist "%InStringFile%\.\" (
        set "result=false"
        goto :end_run_bat
    ) else  (
        set "result=true"  
    )
) else (
    goto :end_run_bat
)


attrib -r "%InStringFile%"

if "%errorlever%" == "1" (
    set  "result=false"
) else (
    set  "result=true" 
)

:end_run_bat 

endlocal  &  set "GLOBAL_VALUE_InStringPathReadBat=%result%"