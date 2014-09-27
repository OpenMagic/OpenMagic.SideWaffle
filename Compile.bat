@echo off
:top
.\Scripts\Build.ps1
echo.
echo.
choice /c yn /m "Compile again"
if "%errorlevel%" == "1" goto top
