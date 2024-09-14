@echo  off 
chcp 65001>nul 
setlocal  EnableDelayedExpansion
rem super set is  in string token bat  super   
rem aa  in aabbcc  and  a*c in aabbcc   and c:\*bat  in  c:\project\temp\test.bat 

rem in lenght string   not set  * @  
set "InString=%~1"
rem in token and token  aabb  or  a*b  
set  "Tokentan=%~2"
set "onoff=false"

call :instring_is_token_true_false  "!InString!" "!Tokentan!"
set "onoff=!instring_is_token_true_false_onoff!"

rem  go deep into  estimate
if  "!onoff!" == "false" (
    call :calca_char_number "!Tokentan!"
    @REM echo 字符串长度: !calca_char_number_Len!

    rem xie si char 
    call :forloop_string_char_replace "!Tokentan!"  "!calca_char_number_Len!" "*"  "@" 
    @REM echo 替换结果 : !forloop_string_char_replace_result!
    @REM echo  替换数量 [方便切割]: !forloop_string_char_replace_calca_len! 

    call :input_string_split_and_in_string "!InString!" "!forloop_string_char_replace_result!"
    set "onoff=!input_string_split_and_in_string_result!"
)
goto :end_run_end





:input_string_split_and_in_string  
rem  string split  and  check char in string   
rem  input string split 
set "input_string_split_and_in_string_chars=%~1"
rem  tokens  aa@bb@ccc
set  "input_string_split_and_in_string_tokenline=%~2" 
set "input_string_split_and_in_string_result=true"
set "input_string_split_and_in_string_one=@"
:input_string_split_and_in_string_goto 
for /f "tokens=1,* delims=%input_string_split_and_in_string_one%" %%a  in ("!input_string_split_and_in_string_tokenline!") do (
    @REM echo a : %%a 
    @REM echo b : %%b 
    call :instring_is_token_true_false "!input_string_split_and_in_string_chars!"  "%%a" 
    if "!instring_is_token_true_false_onoff!" == "false" (
        set "input_string_split_and_in_string_result=false"
        goto :input_string_split_and_in_string_end
    ) 
    if "%%b" =="" goto :input_string_split_and_in_string_end  
    set "input_string_split_and_in_string_tokenline=%%b"
    goto :input_string_split_and_in_string_goto
)
:input_string_split_and_in_string_end
exit /b & %input_string_split_and_in_string_result%




:instring_is_token_true_false 
rem  lenht  string 
set "instring_is_token_true_false_InString=%~1"
rem  token  return true false 
set  "instring_is_token_true_false_Tokentan=%~2"
set "instring_is_token_true_false_result=!instring_is_token_true_false_InString:%instring_is_token_true_false_Tokentan%=!"
set "instring_is_token_true_false_onoff=false"
if "%instring_is_token_true_false_result%" == "%instring_is_token_true_false_InString%" (
    set "instring_is_token_true_false_onoff=false"
) else (
    set "instring_is_token_true_false_onoff=true"
)
exit /b  %instring_is_token_true_false_onoff%




:forloop_string_char_replace 
rem  sting replace char 
rem  must set forloop_string_char_replace_char_a forloop_string_char_replace_char_b  set sting replace char 
rem  forloop_string_char_replace_len is forloop_string_char_replace_instring lens 
rem  forloop_string_char_replace_result  is result 
rem input repalce string 
set "forloop_string_char_replace_instring=%~1"
set "forloop_string_char_replace_len=%~2"
set "forloop_string_char_replace_char_a=%~3"
set "forloop_string_char_replace_char_b=%~4"

rem calca xing number
set "forloop_string_char_replace_calca_len=0"
rem output  string 
set "forloop_string_char_replace_result="
set /a forloop_string_char_replace_len-=1

for /L %%a in (0 ,1 ,!forloop_string_char_replace_len!) do (
    set "forloop_string_char_replace_tem=!forloop_string_char_replace_instring:~%%a,1!"
    
    if "!forloop_string_char_replace_tem!" == "!forloop_string_char_replace_char_a!" (
        @REM echo char: !forloop_string_char_replace_tem!
        set "forloop_string_char_replace_tem=!forloop_string_char_replace_char_b!"
        set /a forloop_string_char_replace_calca_len+=1
    )
    set "forloop_string_char_replace_result=!forloop_string_char_replace_result!!forloop_string_char_replace_tem!"
)
exit /b  & (
 %forloop_string_char_replace_result%
 %forloop_string_char_replace_calca_len%
)



:calca_char_number 
rem  set value  calca string size 
rem  * replace @  agin calal * number 
set "calca_char_number_string=%~1"
set "calca_char_number_Len=0"
:calca_char_number_loop 
if defined calca_char_number_string (
    set "calca_char_number_string=%calca_char_number_string:~1%"
    set /a calca_char_number_Len+=1 
    goto :calca_char_number_loop
)
exit /b  %calca_char_number_Len%

:end_run_end 

endlocal  & set "GLOBAL_VALUE_InStringToKenSuperBat=%onoff%"