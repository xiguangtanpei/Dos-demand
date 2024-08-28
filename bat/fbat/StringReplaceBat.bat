@echo  off 
chcp 65001>nul 
rem  字符串替换函数  传入一个字符串 替换另一个  
setlocal  
set  "GetString=%~1"
set  "OldToken=%~2"
set  "NewToken=%~3"

call  set  "result=%%GetString:%OldToken%=%NewToken%%%"
rem echo  %result%
endlocal & set "GLOBAL_VALUE_StringReplaceBat=%result%"