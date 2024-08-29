
@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  确定给定目录下面  筛选出阿里特定文件类返回到变量 给到字符串变量返回  
rem  返回文件类型类型 .bat  .txt 这种 最后返回到一个变量中 使用需要切割在 
set "InString=%~1"
rem  这里是要查找文件名称  
set  "InFileName=%~2"
set  "result="

for /f  "tokens=4  delims= " %%a in ('dir %InString% ^| findstr %InFileName%') do (
    @REM echo %%a 
    @REM rem 只要是文件类型最后就是使用4段分割时可以的得到最后一段
    set  "result=!result!%%a;"
)
@REM echo %result%
if  "%result%" == "" (
    set "result=nul"
)

endlocal  & set "GLOBAL_VALUE_GetDirFileTypeBat=%result%"