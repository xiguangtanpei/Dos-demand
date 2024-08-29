@echo off 
chcp 65001>nul 
rem  根据当前时间格式  周四 2024/08/29   11:32返回 字符串时间后续当作创建文件名称使用回有用 
setlocal EnableDelayedExpansion 
set "TimeFile="
set  "DataFile="

rem 不写 delims会拆分开 nul 时间内没有就不会处理了 ---后面把中文周过滤掉了 
for /f  "tokens=2 delims= " %%a in ( 'date /T' ) do  (
    @REM echo %%a 
    set "DataFile=%%a"
)
rem  把实信息转成变量类型 --然后循环变量来拼接字符串 
@REM echo  %DataFile%

for /f  "tokens=1 delims=nul" %%a in ( 'time /T' ) do  (
    @REM echo %%a 
    set "TimeFile=%%a"
)
@REM echo  %TimeFile%

set "TotoFile=%DataFile%_%TimeFile%"
set  "result="

for /L  %%a  in (0,1,30) do  (
   call  set "char=%%TotoFile:~%%a,1%%"
   if not "!char!" == ""  (
        rem  默认的日期拼接式有空格 所以需要两次判断  周四 2024/08/29  if xx 不支持两部分 拿就是要判断两次 
        if not "!char!" == " " (
            @REM echo  !char!
            set "temchar=false"
            for %%i in (0 1 2 3 4 5 6 7 8 9) do (     
                if "!char!" == "%%i" (
                     set "temchar=true" 
                ) 
            )
            @REM echo !temchar!

            if "!temchar!" == "true" (
                set "result=!result!!char!"
            ) else  ( set "result=!result!_" )
        )
   )
) 

@REM echo %result%

endlocal & set "GLOBAL_VALUE_GetTimeStringBat=%result%"