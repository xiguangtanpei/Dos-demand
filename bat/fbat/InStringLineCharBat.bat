@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  掺入的字符串行 空格统一替换成 -符号方便打印查看

rem input string mush ""  else error 

set "TemInFlagFile=%~1"
set "InFlagFile=%TemInFlagFile%"
set "result="
:run_char_replace 

set "temchar=!InFlagFile:~0,1!" 

if defined InFlagFile (
    set  "InFlagFile=!InFlagFile:~1!"
    if "!temchar!" == " " (
        set "result=!result!-"
    ) else if "!temchar!" == "	"  (
        set "result=!result!----"
    ) else (
        set "result=!result!!temchar!"
    )
    goto:run_char_replace
)
 
@REM echo %result%

endlocal  & set "GLOBAL_VALUE_InStringLineCharBat=%result%"
