@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  对于输入的数据 内容 进行交换 (ss  sss ssss ) 默认循环进行交互处理   (ssss  sss sss ) 
rem  一般用在 拆分数据上面 
set "InString=%~1"

set "result="

for %%a in (%InString%)  do (
    set "result=%%a !result!"
)
@REM echo %result%

endlocal  & set "GLOBAL_VALUE_InStringSectionSwapBat=%result%"