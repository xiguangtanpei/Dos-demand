@echo off
chcp 65001>nul 
rem 判断字符串结尾和开始是否是 某个字符数据  aabbcc  cc 来进行判断处理  
rem  用到字符路径 或者 词语token 判断上   
rem 利用传入字符串大小进行字符串切换然后进行比较操作  第一个是字符串  第二是token   第三个是  0 是否匹配结尾 1 是否匹配开头 
setlocal EnableDelayedExpansion
set "InString=%~1"
set "Token=%~2"
set  "Flag=%~3" 

rem 计算掺入头肯的长度 
set "Len=0"
set  "TemToken=%Token%"
rem defined 判断变量是否存在 利用递减可以判断字符数量 
:loop 
rem  defined TemToken  直接跟变量名称 检查的是名称 %%是名称get的变量内容 
if defined TemToken (
    set "TemToken=%TemToken:~1%"
    set /a Len+=1 
    rem  可以用+=  哈哈
    goto :loop
)
@REM echo  %Token%
@REM echo  %Len%
@REM rem echo %TemToken%  注意打印这里是空 因为已经变量传递以后销毁掉了 

set "result="
if  "%Flag%" =="1" (
    call set "result=%%InString:~0,%Len%%%"
) else (
    rem  这里的匹配 不是1 就是默认结尾匹配 
    call set "result=%%InString:~-%Len%,%Len%%%"
) 

@REM echo  匹配结果查看 %result%

set "resulta=false"
if  "%result%" == "%Token%" (
    set "resulta=true"
)
@REM echo 查看匹配结果  %resulta%

endlocal & set "GLOBAL_VALUE_InStringEndWithBat=%resulta%"