@echo off
:top
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dp0\Scripts\Build.ps1'"
echo.
echo.
choice /c yn /m "Compile again"
if "%errorlevel%" == "1" goto top
