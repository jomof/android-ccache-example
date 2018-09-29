@echo off
setlocal
set "slashed=%*"
set "slashed=%slashed:\=/%"
echo Converting back-slashes to forward slashes for ccache
%slashed%

