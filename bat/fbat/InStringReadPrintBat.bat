@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  print all in file connet  in ugit cmd 

rem 文件不在返回false 文件在读文件每行跳转 空格 换成 - 进行打印 for循环call使用

set "InFlagFile=%~1"
set  "FlagToken=nul"
set  "TemCharToken="

set "result=false"
if exist "%InFlagFile%" (
    if exist "%InFlagFile%\.\" (
        set "result=false"
    ) else  (
        set "result=true"  
    )
)
if  "%result%" == "true" (
    rem when is file  get file  print lines 
    set  "FlagToken=true"
    for /f  "tokens=1 delims=" %%a in  (%InFlagFile%) do (
        rem this string bat chat 
        set  "TemCharToken=%%a"
        call :make_string_chars 
        echo !TemCharToken!
    )
)
if "%FlagToken%" == "nul" (
    set  "FlagToken=false"
    goto:end_run
) else (
    goto:end_run
)

:make_string_chars 
set "InFlagWorkRun=!TemCharToken!"
set "resultTwo="
:run_char_replace 

set "temchar=!InFlagWorkRun:~0,1!" 

if defined InFlagWorkRun (
    set  "InFlagWorkRun=!InFlagWorkRun:~1!"
    if "!temchar!" == " " (
        set "resultTwo=!resultTwo!-"
    ) else if "!temchar!" == "	"  (
        set "resultTwo=!resultTwo!----"
    ) else  (
        set "resultTwo=!resultTwo!!temchar!"
    )
    goto:run_char_replace
)
set "TemCharToken=!resultTwo!"
exit /b

rem  some goto goto .... 
:end_run 
endlocal  & set  "GLOBAL_VALUE_InStringReadPrintBat=%FlagToken%"