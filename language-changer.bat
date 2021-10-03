@echo off
title Language Changer for Ubisoft Games
:start
echo Enter path to file like Documents\game
set /p path=: 
echo Enter file name like game.ini
set /p filename=: 
echo Set language (text, subtitles) like pl-PL
set /p language=: 
cd %path%
if exist "%filename%.bak" (
    del %filename%.bak
)
if not exist "%filename%" (
    goto error_file_does_not_exists
)
copy %filename% %filename%.bak
if exist "%filename%" (
    del %filename%
)
echo [Language] >> %filename%
echo Text=%language% >> %filename%
echo Sound=en-US >> %filename%
echo Subtitles=%language% >> %filename%
echo It's done
pause >nul
exit
:error_file_does_not_exists
echo No file detected
pause >nul
exit