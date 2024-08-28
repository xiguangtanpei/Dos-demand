@echo off
chcp 65001>nul
echo "运行 run.bat"

call  function\ADD.bat  23 20 

echo 打印计算调用结果： %GLOBAL_VALUE_ADD%

pause>nul 