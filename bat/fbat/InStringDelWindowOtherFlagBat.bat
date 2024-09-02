@echo off
chcp 65001>nul
setlocal enabledelayedexpansion
rem 对于输入的路径或者字符串只是对于最后一个char  \/ 进行去掉操作 
@REM set "test=c:\bat\\\new\\///"
@REM rem 结果 是 c:\bat\\\new 这里只是处理路径最后一个字符串 如果全路径风格处理 使用 InStringIsWindowFlagBat 

set "InString=%~1"

:runWork 
set "endchar_2=!InString:~-1,1!"
if  "!endchar_2!" == "\" (
    set "endchar_2=!InString:~0,-1!"
) else if  "!endchar_2!" == "/" (
    set "endchar_2=!InString:~0,-1!"
) else (
    set "endchar_2=!InString!"
)
@REM rem 换变量 
@REM echo 换变量后 !endchar_2!
rem 注意这里每次拆分变量前都备份一次保证ok情况下数据可以向下传递
set  "endchar99=!endchar_2!"
set  "InString=!endchar_2!"
set "endchar_2=!InString:~-1,1!"
if  "!endchar_2!" == "\" (
    goto :runWork 
) else if  "!endchar_2!" == "/"  (
    goto  :runWork 
)
@REM echo 换变量后0000 !endchar_2!
@REM echo 换变量后1111 !endchar99!
endlocal & set  "GLOBAL_VALUE_InStringDelWindowOtherFlagBat=%endchar99%"


