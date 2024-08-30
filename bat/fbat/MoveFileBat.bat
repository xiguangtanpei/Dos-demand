@echo off 
chcp 65001>nul 
setlocal EnableDelayedExpansion 
rem  实现对于文件 A 移动到B 文件 
set "SourcePath=%~1"
set "DestPath=%~2" 
rem  这里移动路径不提示 
set "onoff=false"
Move  /Y  %SourcePath%  %DestPath%  2>&1 | findstr /c:"The system cannot" >nul 

if  "%errorlevel%" =="0" (
    set "onoff=false"
) else (
     set "onoff=true"
)
@REM echo  %onoff%
endlocal & set  "GLOBAL_VALUE_MoveFileBat=%onoff%"