@echo off
chcp 65001>nul 
setlocal  EnableDelayedExpansion 
rem  字符串 大小写转换    Flag = 0 转小写  =1 转大写 
rem  在案例中遇到一些新知识   a ==b   not a==b  方向形式 
rem  for 循环 /f 格式化一些字符串  /L 有步幅设置 (0,2,20) /D /R 文件夹 文件
rem  有关于 详细解释: bat for语句(循环结构)-CSDN博客 
rem   if /i  忽略大小写 
rem  建议看这里  https://github.com/xiguangtanpei/DOS-BAT-Tutorial/tree/master 

set "InString=%~1"
set "Flag=%~2"

rem   call  set "char=%%InString:~%%a,1%%"  和  set "char=!InString:~%%a,1!" 一样的  call 后面做一个整体逻辑 用 %% 在外层包括 

set  "result="
if "%Flag%" == "0" (
    for /L %%a in (0,1,256) do (
        call  set "char=%%InString:~%%a,1%%"
        if not "!char!" == "" (
            rem (a b c d e f g h i j k l m n o p q r s t u v w x y z) 可以理解成数组了
            for  %%C in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
                if /i "!char!" == "%%C"  ( set "char=%%C")
            )
           set "result=!result!!char!"
        )
    )
     
) else (
 rem  其他任何情况多是处理字符串的 大写情况  
    for /L %%a in (0,1,256) do (
        call  set "char=%%InString:~%%a,1%%"
        if not "!char!" == "" (
            for  %%C in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)  do (
                if /i "!char!" == "%%C"  ( set "char=%%C")
            )
           set "result=!result!!char!"
        )
    )


)

@REM echo  %result%

endlocal  &  set  "GLOBAL_VALUE_InStringUpLowBat=%result%"