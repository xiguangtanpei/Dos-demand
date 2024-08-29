@echo off 
chcp 65001>nul 
rem  用于向前进程是否开启  传入进程名称   返回 true  没有返回false 
setlocal EnableDelayedExpansion 
rem  对于传入进程名称  提前判断进程是否存在  杀死  注意   0 默认提示再次确认   1 强制 杀死   一般情况下传递都可以 

set "InString=%~1"
set "Flag=%~2" 
set "onoff=false"
if "%Flag%" == "1"  (
    @REM rem  捕获错误新技能  2>&1  把墙面的错误输出 捕获都 输入 在利用管道符号  |  进行判断 
    @REM rem findstr /c 使用后续字符串 进行搜索 返回 最后错误类型 
    taskkill  /F  /IM   %InString%  /T 2>&1 | findstr /c:"ERROR: The process" > nul 

) else  (
   taskkill   /IM   %InString% 2>&1 | findstr /c:"ERROR: The process" > nul 

)
if  "%errorlevel%" == "0" (
    set "onoff=false"
) else  (
    set "onoff=true"
)
@REM echo %onoff%
endlocal & set "GLOBAL_VALUE_KillTaskListValueBat=%onoff%"