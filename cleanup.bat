:: this file cleans up portable folder and link folder created in this system

@echo off
setlocal

set PORTABLE_ROOT=%~dp0

call %PORTABLE_ROOT%\_clean_link.bat
call %PORTABLE_ROOT%\_clean_cache.bat

endlocal
