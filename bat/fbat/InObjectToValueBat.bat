@echo off
chcp 65001>nul
setlocal enabledelayedexpansion

rem 获取传入的命令
set "InObject=%~1"

rem 初始化变量
set "output="

rem 执行命令并捕获输出
for /f "delims=" %%i in ('%InObject%') do (
    set "output=!output!%%i^&echo."
)

rem 显示捕获的输出

endlocal &  set "GLOBAL_VALUE_InObjectToValueBat=%output%"
