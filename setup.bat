:: this file set up the environment for vscode.
::  1. check the %USERPROFILE%\.vscode and %APPDATA%\Code folders existance
::  2. create symbolic links for folders provided by my portable version

@echo off
setlocal

set PORTABLE_ROOT=%~dp0

set PORTABLE_DOTVSCODE_FOLDER=%~dp0\.vscode
set USERPROFILE_DOTVSCODE_FOLDER=%USERPROFILE%\.vscode
set INSIDERS_USERPROFILE_DOTVSCODE_FOLDER=%USERPROFILE%\.vscode-insiders

set PORTABLE_CODE_FOLDER=%~dp0\Code
set APP_CODE_FOLDER=%APPDATA%\Code
set INSIDERS_APP_CODE_FOLDER="%APPDATA%\Code - Insiders"

set PORTABLE_TABNINE_FOLDER=%~dp0\TabNine
set APP_TABNINE_FOLDER=%APPDATA%\TabNine

:: if folders exist, delete them

if exist %USERPROFILE_DOTVSCODE_FOLDER% (
    @echo "WARNING: .vscode folder exist inside USERPROFILE, deleting.."
    rmdir /s /q %USERPROFILE_DOTVSCODE_FOLDER%
)

if exist %APP_CODE_FOLDER% (
    @echo "WARNING: code folder exist inside APPDATA, deleting.."
    rmdir /s /q %APP_CODE_FOLDER%
)

if exist %INSIDERS_USERPROFILE_DOTVSCODE_FOLDER% (
    @echo "WARNING: .vscode folder exist inside INSIDERS_USERPROFILE, deleting.."
    rmdir /s /q %INSIDERS_USERPROFILE_DOTVSCODE_FOLDER%
)

if exist %INSIDERS_APP_CODE_FOLDER% (
    @echo "WARNING: .vscode folder exist inside INSIDERS_APPDATA, deleting.."
    rmdir /s /q %INSIDERS_APP_CODE_FOLDER%
)

if exist %APP_TABNINE_FOLDER% (
    @echo "WARNING: TabNine folder exist inside APPDATA, deleting.."
    rmdir /s /q %APP_TABNINE_FOLDER%
)

:: delete folders that already exist inside USERPROFILE or APPDATA
call %PORTABLE_ROOT%\_clean_link.bat

:: create symbolic links

mklink /d %USERPROFILE_DOTVSCODE_FOLDER% %PORTABLE_DOTVSCODE_FOLDER%
mklink /d %APP_CODE_FOLDER% %PORTABLE_CODE_FOLDER%
mklink /d %INSIDERS_USERPROFILE_DOTVSCODE_FOLDER% %PORTABLE_DOTVSCODE_FOLDER%
mklink /d %INSIDERS_APP_CODE_FOLDER% %PORTABLE_CODE_FOLDER%
mklink /d %APP_TABNINE_FOLDER% %PORTABLE_TABNINE_FOLDER%

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
