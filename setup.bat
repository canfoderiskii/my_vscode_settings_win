:: this file set up the environment for vscode.
::  1. check the %USERPROFILE%\.vscode and %APPDATA%\Code folders existance
::  2. create symbolic links for folders provided by my portable version

@echo off
setlocal

set PORTABLE_ROOT=%~dp0

set PORTABLE_DOTVSCODE_FOLDER=%~dp0\.vscode
set USERPROFILE_DOTVSCODE_FOLDER=%USERPROFILE%\.vscode

set PORTABLE_CODE_FOLDER=%~dp0\Code
set APP_CODE_FOLDER=%APPDATA%\Code

:: delete folders that already exist inside USERPROFILE or APPDATA
call %PORTABLE_ROOT%\_clean_link.bat

:: create symbolic links

mklink /d %USERPROFILE_DOTVSCODE_FOLDER% %PORTABLE_DOTVSCODE_FOLDER%
mklink /d %APP_CODE_FOLDER% %PORTABLE_CODE_FOLDER%

:: check if folders are created, due to FAT32 does not support link

if not exist %USERPROFILE_DOTVSCODE_FOLDER% (
    @echo "ERROR: create .vscode folder link failed, aborting.."
    exit 1
)

if not exist %APP_CODE_FOLDER% (
    @echo "ERROR: create code folder link failed, aborting.."
    exit 1
)

pause
endlocal
