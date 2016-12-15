:: this file delete folders inside USERPROFILE and APPDATA

@echo off
setlocal

set USERPROFILE_DOTVSCODE_FOLDER=%USERPROFILE%\.vscode
set APP_CODE_FOLDER=%APPDATA%\Code

:: if folders exist, delete them

if exist %USERPROFILE_DOTVSCODE_FOLDER% (
    @echo "WARNING: .vscode folder exist inside USERPROFILE, deleting.."
    rmdir /s /q %USERPROFILE_DOTVSCODE_FOLDER%
)

if exist %APP_CODE_FOLDER% (
    @echo "WARNING: code folder exist inside APPDATA, deleting.."
    rmdir /s /q %APP_CODE_FOLDER%
)

endlocal
