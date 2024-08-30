@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  过去保存文件的key value 形式 
rem   这里时做一个模板使用 文本配置必须固定  key = value 都有空格形式 文件 
set "InFile=%~1"
set   "Key=%~2"
set  "Flag=%~3" 
rem  flag =0 默认时key = value 处理参数 如果是 1 使用默认 *** 拆分配置 
rem  我参照这里测试 https://ds-ebooks.github.io/DOS-BAT/2-FOR%E5%91%BD%E4%BB%A4%E8%AF%A6%E8%A7%A3/1-FOR%E5%91%BD%E4%BB%A4%E4%B8%AD%E7%9A%84%E5%8F%82%E6%95%B0.html
set "result="

if "%Flag%"=="0" (
    for /f "tokens=1-3" %%a in (%InFile%) do (
        @REM echo %%a
        if "%%a" == "%key%" (
            set "result=%%c"
        ) 

    )
) else  if "%Flag%"=="1" (
    for /f "tokens=1-2 delims=***" %%a in (%InFile%) do (
        @REM echo %%a
        if "%%a" == "%key%" (
            set "result=%%b"
        ) 

    )

)
@REM echo %result%
if  "%result%" =="" (
    rem  如果找不到key 就返回nul 字符串 
    set "result=nul"
)

endlocal & set "GLOBAL_VALUE_GetFileKeyValueBat=%result%"

