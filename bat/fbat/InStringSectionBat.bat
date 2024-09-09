@echo  off 
chcp 65001>nul 
setlocal  enabledelayedexpansion 
rem  zhong wen inof  is bug  big  

set "InString=%~1"
set "Start=%~2"
set "End=%~3"

call set "result=%%InString:~%Start%,%End%%%"

rem echo 研究函数内截取数据 %result%

endlocal & set  "GLOBAL_VALUE_InStringSectionBat=%result%"