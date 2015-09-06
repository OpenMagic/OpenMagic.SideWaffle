@echo off
:top
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dp0\Scripts\Build.ps1'"

if exist .\Source\SideWaffleMagic\bin\Release\SideWaffleMagic.vsix (

    .\Source\SideWaffleMagic\bin\Release\SideWaffleMagic.vsix
    
) else (

    echo.
    echo Compile failed.
    echo.
    
)
echo.
echo.
choice /c yn /m "Compile again"
if "%errorlevel%" == "1" goto top
