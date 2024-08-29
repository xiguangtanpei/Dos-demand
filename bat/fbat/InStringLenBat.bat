@echo  off 
chcp 65001>nul 
setlocal EnableDelayedExpansion  
rem  get 字符串的长度  掺入一个字符串get 字符串的长度 

set "InString=%~1"
set "Len=0"
rem defined 判断变量是否存在 利用递减可以判断字符数量 
:loop 
if defined InString (
    set "InString=%InString:~1%"
    set /a Len+=1 
    rem  可以用+=  哈哈
    goto :loop
)

@REM echo %Len% 
endlocal & ( set "GLOBAL_VALUE_InStringLenBat=%Len%" )