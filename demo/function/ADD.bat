@echo off
chcp 65001>nul 
setlocal 
set "one=%1"
set  "two=%2"

set  /a  "reset=%one% + %two%"
echo 打印函数结果 %reset%
endlocal & set "GLOBAL_VALUE_ADD=%reset%"