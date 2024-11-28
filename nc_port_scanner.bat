@echo off
:: Ensure nc.exe is within the working directory when script is executed
setlocal enabledelayedexpansion

set target=<IP>
set start_port=1
set end_port=65000

for /l %%p in (%start_port%,1,%end_port%) do (
    echo Scanning port %%p
    .\nc.exe -zv %target% %%p 2>&1 | findstr /i "succeeded open"
)

endlocal
