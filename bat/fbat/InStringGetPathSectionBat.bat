@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  获取路径段数  首先对于路径使用 Flag  window 风格还是其他 其次根据输入来返回路径 前面几段 还是后面几段 数据 \
rem  前面输入是标注路径 window路径风格的部分 
rem  Seation 这部分是 返回 段数   1 1段  2 两端  3 三段 然后使用路径符号 链接 
rem   Direction 是方向  0 从前截取  1 从后截取  
set  "InString=%~1"
set   "Flag=%~2" 
set    "Section=%~3" 
set    "Direction=%~4" 

set  "WindowFlag=\"
set   "OtherFlag=/"
set "result="
if "%Flag%" == "0" (
    call  set  "result=%%InString:%OtherFlag%=%WindowFlag%%%"
) else (
     call  set  "result=%%InString:%WindowFlag%=%OtherFlag%%%"
)
rem 利用go循环转换 

set "NormalPath=!result!"
@REM echo %NormalPath%
@REM echo !result!

if "%Flag%" == "0" (
    :relace_window 
    if not "!NormalPath!" == "!NormalPath:\\=\!" (
        set "NormalPath=!NormalPath:\\=\!"
        goto relace_window
    )
) else  (

    :no_window 
    if not "!NormalPath!" == "!NormalPath://=/!" (
        set "NormalPath=!NormalPath://=/!"
        goto no_window
    )
)

rem  到这里就知道具体路径 是什么分割的数据 

@REM rem  这里就是具体的 循环路径实现 有前后关系 
@REM for /L %%a in  (4 ,-1 ,0) do (
@REM     echo %%a 
@REM )
@REM for /L %%a in  (0 ,1 ,4) do (
@REM     echo %%a 
@REM )

set "TotoSectionPath="
set  "Len=0"
if "%Flag%" == "0" (
    @REM echo  !NormalPath!
    set "SplitPath=!NormalPath:\= !"
    @REM echo  !SplitPath!
    set "temSplitPath="
    set  "tokenflag=false"
    if "%Direction%" == "1" (
        
        rem 从后面开始截取 对于字符进行凡汐那边处理 
         for  %%A in (!SplitPath!) do (
            set "temSplitPath=%%A !temSplitPath!"
         )
        @REM  echo 测试颠倒 !temSplitPath!
        rem  注意如果路径反向 后续拼接也不同 
        set  "tokenflag=true"
    ) else (
        set "temSplitPath=!SplitPath!"
         set  "tokenflag=false"
    )

    for  %%A in (!temSplitPath!) do (
        @REM echo  %%A 
        if  "!tokenflag!" == "false" (
            set  "TotoSectionPath=!TotoSectionPath!%%A\"
        ) else (
            set  "TotoSectionPath=%%A\!TotoSectionPath!"
        )
        set /a Len+=1
        if  "!Len!" == "%Section%" (
            goto result
        )
    )
) else  (
    set "SplitPath=!NormalPath:/= !"

    set "temSplitPath="
    set  "tokenflag=false"
    if "%Direction%" == "1" (
        
        rem 从后面开始截取 对于字符进行凡汐那边处理 
         for  %%A in (!SplitPath!) do (
            set "temSplitPath=%%A !temSplitPath!"
         )
        @REM  echo 测试颠倒 !temSplitPath!
        rem  注意如果路径反向 后续拼接也不同 
        set  "tokenflag=true"
    ) else (
        set "temSplitPath=!SplitPath!"
         set  "tokenflag=false"
    )

    for  %%A in (!temSplitPath!) do (
        @REM echo  %%A 
        if  "!tokenflag!" == "false" (
            set  "TotoSectionPath=!TotoSectionPath!%%A/"
        ) else (
            set  "TotoSectionPath=%%A/!TotoSectionPath!"
        )
        set /a Len+=1
        if  "!Len!" == "%Section%" (
            goto result
        )
    )
)

:result 

set "endchar="
rem 如果路径最后一段是 \ / 去掉一下 
if "%Flag%" == "0" (
    set "endchar=!TotoSectionPath:~-1,1!"
    if  "!endchar!" == "\" (
        set "endchar=!TotoSectionPath:~0,-1!"
    )
) else (
    set "endchar=!TotoSectionPath:~-1,1!"
    if  "!endchar!" == "/" (
        set "endchar=!TotoSectionPath:~0,-1!"
    )
)
@REM echo %endchar%


endlocal & set  "GLOBAL_VALUE_InStringGetPathSectionBat=%endchar%"