@echo off 
chcp 65001>nul 
rem  确定传入的路径下面是否有 对应的名称  有后缀是文件描述 没有后缀是 文件夹描述 
setlocal EnableDelayedExpansion 
rem  这里是填入路径  
set "InString=%~1"
rem  这里是要查找文件名称  
set  "InFileName=%~2"
set  "result="

set  "onoff="
for /f  "tokens=1  delims=*" %%a in ('dir %InString% ^| findstr %InFileName%') do (
    @REM echo %%a 
    set "result=%%a"
)

if  "%result%" =="" (
    set "onoff=false"
) else (
    set "onoff=true"
)
@REM echo  %onoff%

endlocal & set "GLOBAL_VALUE_InStringHaveNameBat=%onoff%"