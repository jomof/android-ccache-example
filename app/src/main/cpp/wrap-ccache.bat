@echo off
setlocal
set "slashed=%*"
set "slashed=%slashed:\=/%"
%slashed%

