@echo off 
chcp 65001>nul 
rem  用于向前进程是否开启  传入进程名称   返回 true  没有返回false 
setlocal EnableDelayedExpansion 

set "TaskName=%~1"

set  "result=false"
set  "Stringa="
for /f  "tokens=1 delims="  %%a in   ('tasklist /FI "IMAGENAME eq %TaskName%"') do (
    set "Stringa=%%a"
)
@REM echo  Stringa %Stringa%

rem 注意此时系统返回时字符串数据时需要判断字符串处理的 
if "!Stringa!" == "INFO: No tasks are running which match the specified criteria." (
    set "result=false"
) else (
    set "result=true"
)
@REM echo  %result%

endlocal & set "GLOBAL_VALUE_GetTaskListValueBat=%result%"
