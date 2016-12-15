:: this file will clean the cache files located in Code folder.
:: unlike Atom, VSCode puts some configuration file inside %APPDATA%\Code,
:: not .vscode folder.
@echo off
setlocal

set PORTABLE_ROOT=%~dp0
set PORTABLE_CODE_ROOT=%PORTABLE_ROOT%\Code

:: this simulate a array, in which store all the files/folders that need
:: to be deleted

set DELFOLDER@Cache=%PORTABLE_CODE_ROOT%\Cache
set DELFOLDER@GPUCache=%PORTABLE_CODE_ROOT%\GPUCache
set DELFOLDER@LocalStorage="%PORTABLE_CODE_ROOT%\Local Storage"
set DELFOLDER@workspaceStorage=%PORTABLE_CODE_ROOT%\User\workspaceStorage
set DELFOLDER@CachedData=%PORTABLE_CODE_ROOT%\CachedData

set DELFILE@Cookies=%PORTABLE_CODE_ROOT%\Cookies
set DELFILE@Cookies-journal=%PORTABLE_CODE_ROOT%\Cookies-journal

:: display some
echo "WARNING: some files/folders will be deleted in Code folder.."

:: delete folders

for /f "tokens=2 delims==" %%a in ('set DELFOLDER') do (
    if exist %%a (
        rmdir /s /q %%a
    )
)

:: delete files

for /f "tokens=2 delims==" %%a in ('set DELFILE') do (
    if exist %%a (
        del /q %%a
    )
)

pause
endlocal
