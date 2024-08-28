@echo off
chcp 65001>nul
echo "运行 run.bat"
setlocal enabledelayedexpansion
@REM rem 测试字符串替换工作  -- 可以用来替换路径 / \ 
@REM set "test1=E:\D\github\dos_demand\bat"
@REM call  fbat/StringReplaceBat.bat  %test1%  github  ch 
@REM echo  %GLOBAL_VALUE_StringReplaceBat% 
@REM rem 返回  E:\D\ch\dos_demand\bat  正确 


@REM rem  测试字符串中 包含字符串 
@REM set "test1=E:\D\github\dos_demand\bat"
@REM call fbat/InStringToKenBat.bat   %test1%  and\bat  
@REM echo  %GLOBAL_VALUE_InStringToKenBat%
@REM rem 返回 true   正确结果 


@REM rem  测试 ipconfig net use  这种对象一变量返回 注意用双引号标识一下  防止 "net user"这种变量
@REM call fbat/InObjectToValueBat.bat "ipconfig"
@REM call fbat/InObjectToValueBat.bat "net user"
@REM call fbat/InObjectToValueBat.bat "net LOCALGROUP"
@REM call fbat/InObjectToValueBat.bat "tree"
@REM echo  %GLOBAL_VALUE_InObjectToValueBat%


@REM rem 字符串路径切割 不如 aabbcc  利用 b  可以切换成两端  
@REM set "test1=E:\D\github\dos_demand\bat"
@REM call  fbat/InStringSplitBat.bat %test1%   "hub" "2" 
@REM echo %GLOBAL_VALUE_InStringSplitBat1%
@REM echo %GLOBAL_VALUE_InStringSplitBat2%
@REM @REM E:\D\github\  
@REM @REM dos_demand\bat



@REM rem  多版本调用 过程 多call调用过程 
@REM set "test1=E:\D\github\dos_demand\bat"
@REM call  fbat/InStringToKenBat.bat %test1%   "bat" 
@REM if   "%GLOBAL_VALUE_InStringToKenBat%" == "true"  (
@REM     call fbat/InStringSplitBat.bat  %test1%  "bat"  "2" 
@REM     echo  !GLOBAL_VALUE_InStringSplitBat1!
@REM     echo  !GLOBAL_VALUE_InStringSplitBat2!

@REM     if  "!GLOBAL_VALUE_InStringSplitBat1!" == "E:\D\gibat" (
@REM         call  fbat/StringReplaceBat.bat  !GLOBAL_VALUE_InStringSplitBat1!  "D"  "uuu" 
@REM         echo  !GLOBAL_VALUE_StringReplaceBat!
@REM     )
@REM )
@REM @REM  E:\D\gibat
@REM @REM  hub\dos_demand\bat
@REM @REM  E:\uuu\gibat


@REM rem 字符串截取 从0 开始 类似于python的处理  
@REM set "test1=E:\D\github\dos_demand\bat"
@REM @REM call fbat/InStringSectionBat.bat  %test1% "0" "6"
@REM @REM rem github 从 5 开始 向后截取6个 
@REM @REM call fbat/InStringSectionBat.bat  %test1% "0" "-3"
@REM rem E:\D\github\dos_demand\ 从第一个到 导数 3给数据
@REM @REM call fbat/InStringSectionBat.bat  %test1% "-3" "3"
@REM rem  bat 截取字符的后半段数据 










endlocal 
pause>nul 