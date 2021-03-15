@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

set args1=%1 

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=.
set BUILDDIR=_build
set STARTHTML=start msedge "%cd%\%BUILDDIR%\html\index.html" 
set CLEAN=rmdir "%BUILDDIR%" /s /q
set REINSTALL="reinstall"


if "%1" == %REINSTALL% set args1="html" 
set BUILDHTML=%SPHINXBUILD% -M %args1% %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%


if "%1" == "" goto help
if "%1" == "help" goto help

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

if "%1" == "view" %STARTHTML%

if "%1" == "clean" %CLEAN%

if "%1" == %REINSTALL% (
	%CLEAN%
	%BUILDHTML%
)

if "%1" == "html" %BUILDHTML%

goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
popd