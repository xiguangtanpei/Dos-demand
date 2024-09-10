
@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  input two path  one : source path  two: mklink path 
rem  fist:  check mklinkpath is exist  del path   two:   mklink path  
set "InputSource=%~1"
set "MkLinkPath=%~2"

rem  check path is exist 
set "result=false"
rem  source path  must  be is exist  
if exist "%InputSource%" (
    if exist "%InputSource%\.\" (
        set "result=true"
    ) else  (
        set "result=false"  
        goto :run_end_path
    )
) else (
    goto :run_end_path
)

if exist !MkLinkPath! (
    rmdir /s /q   !MkLinkPath!
)

mklink /d  !MkLinkPath! !InputSource!

if  "%errorlevel%" =="0" (
    set "result=true"
) else (
    set "result=false"  
)
:run_end_path 

endlocal  & set  "GLOBAL_VALUE_CreateMkLinkBat=%result%"