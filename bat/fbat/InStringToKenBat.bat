@echo  off 
chcp 65001>nul 
rem  用来判断当前传入字符串是否保留某个字符串 包含返回 true  不包含返回 false 
setlocal 
set "InString=%1"
set  "Token=%2"
call  set "result=%%InString:%Token%=%%"
set "onoff=false"
if "%result%" == "%InString%" (
    set "onoff=false"

) else (
    set "onoff=true"
)
rem echo  %onoff%
endlocal & set "GLOBAL_VALUE_InStringToKenBat=%onoff%"

