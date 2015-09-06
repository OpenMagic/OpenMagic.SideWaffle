@echo off

rem See Task Compile in ..\Build-Tasks.ps1 for documentation.

echo.
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsMSBuildCmd.bat"

msbuild %1 /target:%2 /property:Configuration=%3 /verbosity:%4 /nologo
echo.