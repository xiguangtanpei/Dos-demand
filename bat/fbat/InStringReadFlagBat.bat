@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  read one file one line  falg token , check error return nul 
set "InFlagFile=%~1"
set  "FlagToken=nul"

rem check is file 

set "result=false"
if exist "%InFlagFile%" (
    if exist "%InFlagFile%\.\" (
        set "result=false"
    ) else  (
        set "result=true"  
    )
)
if  "%result%" == "true" (
    rem  is file  start reading  
    for /f  "tokens=1" %%a in (%InFlagFile%)  do (
        @REM echo  验证读取操作 %%a
        if "%%a" =="True" (
            set  "FlagToken=true"
        )
        if "%%a" =="False" (
            set  "FlagToken=false"
        )
    )
)

rem echo  file flag : false  nul  toto set false 

if "%FlagToken%" == "nul" (
    set  "FlagToken=false"
)
@REM echo  flag: %FlagToken%

endlocal  & set "GLOBAL_VALUE_InStringReadFlagBat=%FlagToken%"