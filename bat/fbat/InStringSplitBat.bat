@echo off
chcp 65001>nul
setlocal enabledelayedexpansion
rem 字符串路径切割 不如 aabbcc  利用 bb    可以切换成两端 最后返回两个变量   
rem  要保证切割token 在字符串中 如果使用开头结尾拆分回 有一个变量返回nul  说明不才
rem  IsLeft 如果是 1 直接拆分 如果 2  拆分字段在 左边  3 拆分字段在右边 
set "InString=%~1"
set  "Token=%~2"
set  "IsLeft=%~3" 

rem 拆分前需要去点
rem 有bug 第一次测试传入 F:\LetsGoDevelop_ft_tools\LetsGo\Content\Feature\StarP   利用 Content  切割出现问题 
rem 在切割中 delims 每次知识切割一个字符串 所以需要点替换在切割 

set "Seation1="
set "Seation2="
@REM echo 验证输入 !InString!
@REM echo 验证token !Token!

call  set  "result=%%InString:%Token%=|%%"
for /f "tokens=1* delims=|" %%a in ("%result%") do (

    set  "Seation1=%%a"
    set  "Seation2=%%b"

    @REM echo 验证切割1 !Seation1!
    @REM echo 验证切割2 !Seation2!
)


if  "%IsLeft%" == "2"  (
    set  "Seation1=!Seation1!%Token%"
)
if "%IsLeft%" == "3" (
    set  "Seation2=%Token%!Seation2!"
)

rem  如果拆分是空 返回nul  说明后续不在使用了
if "%Seation1%" == "" (
    set "Seation1=nul"
)
rem  如果 aabb  用bb 拆分 后续就不用了返回就是空 
if  "%Seation2%" == "" (
    set "Seation2=nul"
)

@REM echo %Seation1%
@REM echo %Seation2%

endlocal & (
set "GLOBAL_VALUE_InStringSplitBat1=%Seation1%" 
set "GLOBAL_VALUE_InStringSplitBat2=%Seation2%"

) 

