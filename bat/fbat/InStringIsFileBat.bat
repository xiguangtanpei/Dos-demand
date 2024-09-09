@echo off 
chcp 65001>nul 
rem  判断传入的路径是 真实的路径 返回 true  false  数据 
setlocal EnableDelayedExpansion 
set "InString=%~1"

@REM echo %InString%
set "result=false"
rem  关于是文件判断有很多https://www.cnblogs.com/mq0036/p/15209104.html 看这里   nul 我平台不对 . 是可以的 
rem 关于这里要注意哦
if exist "%InString%" (
    if exist "%InString%\.\" (
        set "result=false"
    ) else  (
        set "result=true"  
    )
)

@REM echo %result%

endlocal & set "GLOBAL_VALUE_InStringIsFileBat=%result%"