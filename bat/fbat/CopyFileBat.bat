@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  这里是实现对于文件进行拷贝的操作  从 A 拷贝 B  过程 
rem  拷贝路径 经验验证 路径必须是 winddow风格, 所以选选哟转路径操作 
rem  拷贝文件不用在在乎路基符号 c:\\\//a\\\b  都可以的
set "SourcePath=%~1"
set "DestPath=%~2" 

set  "WindowFlag=\"
set   "OtherFlag=/"
set "result="
call  set  "result=%%SourcePath:%OtherFlag%=%WindowFlag%%%"

set "NormalPath=!result!"
:relace_window 
if not "!NormalPath!" == "!NormalPath:\\=\!" (
    set "NormalPath=!NormalPath:\\=\!"
    goto relace_window
)
set "resultdest="
call  set  "resultdest=%%DestPath:%OtherFlag%=%WindowFlag%%%"

set "NormalPathDest=!resultdest!"
:relace_window_end 
if not "!NormalPathDest!" == "!NormalPathDest:\\=\!" (
    set "NormalPathDest=!NormalPathDest:\\=\!"
    goto relace_window_end
)

@REM echo !NormalPath!
@REM echo !NormalPathDest!

set "onoff=false"
copy  /Y   %NormalPath% %NormalPathDest% 2>&1 | findstr /c:"The system cannot" >nul 

if  "%errorlevel%" =="0" (
    set "onoff=false"
) else (
    set "onoff=true"
)

endlocal  & set  "GLOBAL_VALUE_CopyFileBat=%onoff%"
