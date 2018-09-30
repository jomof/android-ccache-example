@echo off
setlocal
set "slashed=%*"
set "slashed=%slashed:\=/%"
echo %slashed%
%slashed%

