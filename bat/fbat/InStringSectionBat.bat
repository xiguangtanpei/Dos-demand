@echo  off 
chcp 65001>nul 
rem  这里是字符串截取  类似python 实现 【0 ，3 从0开始 】 【-3 3 结尾三个 】 【 5 6 从5开始运行6个 】
rem  Start开始0 
rem  End 要截取的数量  
setlocal  enabledelayedexpansion 
set "InString=%~1"
set "Start=%~2"
set "End=%~3"

call set "result=%%InString:~%Start%,%End%%%"

echo %result%

endlocal 