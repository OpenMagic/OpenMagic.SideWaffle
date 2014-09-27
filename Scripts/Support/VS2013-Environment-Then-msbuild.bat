@echo off

rem See Task Compile in ..\Build-Tasks.ps1 for documentation.

echo.
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86

msbuild %1 /target:%2 /property:Configuration=%3 /verbosity:%4 /nologo
echo.