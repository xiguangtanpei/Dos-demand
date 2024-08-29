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
@REM call  fbat/InStringSplitBat.bat %test1%   "d" "3" 
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
@REM call fbat/InStringSectionBat.bat  !test1! "0" "6"
@REM echo  %GLOBAL_VALUE_InStringSectionBat%
@REM rem github 从 5 开始 向后截取6个 
@REM call fbat/InStringSectionBat.bat  %test1% "0" "-3"
rem E:\D\github\dos_demand\ 从第一个到 导数 3给数据
@REM call fbat/InStringSectionBat.bat  %test1% "-3" "3"
rem  bat 截取字符的后半段数据 


@REM rem 字符串数量获取长度 
@REM set "test1=E:\D\github\dos_demand\bat"
@REM @REM set "test1=3"
@REM call  fbat/InStringLenBat.bat  %test1%
@REM echo  !GLOBAL_VALUE_InStringLenBat!
@REM rem  计算长度返回正确



@REM @REM rem  查看字符串匹配情况   第三项 0是 结果匹配   1 开头匹配   返回 true 和 false 
@REM set "test1=E:\D\github\dos_demand\bat"
@REM set   "Bat=bat" 
@REM rem  这里是区分大小写的 字符串匹配 
@REM call fbat/InStringEndWithBat.bat  %test1%  %Bat%  1
@REM echo %GLOBAL_VALUE_InStringEndWithBat%
@REM rem 匹配结果验证成功 


@REM rem  字符串大小写字母转换 过程 
@REM set "test1=E:\D\github\dos_demand\bat"
@REM call fbat/InStringUpLowBat.bat  %test1%  0 
@REM echo  %GLOBAL_VALUE_InStringUpLowBat%
@REM rem  E:\D\GITHUB\DOS_DEMAND\BAT   e:\d\github\dos_demand\bat 大小写转换成功  


@REM rem  获取当前时间字符串  
@REM @REM date /T
@REM @REM time /T 
@REM @REM 周四 2024/08/29   11:32
@REM @REM 11:32 根据当前时间返类似的  2424_08_29_11_32 方便给文件独立的文件名称后缀使用 
@REM call fbat/GetTimeStringBat.bat 
@REM echo %GLOBAL_VALUE_GetTimeStringBat%
@REM rem  2024_08_29_14_53 返回当前时间字符串 ok 




rem 查找某个进程是否开启  有全字符串 和 模糊查找两种形式  返回nul 和进程名称 
@REM tasklist



rem  对于某个进程杀死，比如操作运行前杀死某个进程 taskkill /imn  xxx.exe 


rem  返回文件夹下的文件名称已字符串链接返回 

rem  确定给定目录是否有某个文件夹名称   


rem  确定给定目录下有没有对应 文件名称   


rem  确定给定目录下面  筛选出阿里特定文件类返回到变量 给到字符串变量返回  

rem  想注册表写入特定数据 函数是先 特定位置来写 位置固定 可以写一些key value 进行后续访问处理设置 


rem  查看 自定义写入注册表中的key  返回 true false  


rem  删除掉 自定义 注册表的 key 数据  


rem 读写 配置文件 key = value 方式通过key 访问对应value 数据--做默认支持   


rem  读写配置文件 通过 key***vaue 形式 通过key 返回value 数据形式--做默认支持 


rem   标准化路径名称 是否是window 风格名称还是其他  


rem   返回路径的最后一段   看是否是window风格的操作    


rem   文件向前 返回多少段数据 

rem   对于文件下 特定类型 加入前缀 后缀  vvv

@REM arp -a 
 




















endlocal 
pause>nul 