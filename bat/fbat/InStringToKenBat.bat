@echo  off 
chcp 65001>nul 
setlocal  EnableDelayedExpansion

rem  用来判断当前传入字符串是否保留某个字符串 包含返回 true  不包含返回 false 

set "InString=%~1"
set  "Tokentan=%~2"
set "result=!InString:%Tokentan%=!"
set "onoff=false"
if "%result%" == "%InString%" (
    set "onoff=false"

) else (
    set "onoff=true"
)

endlocal & set "GLOBAL_VALUE_InStringToKenBat=%onoff%"

