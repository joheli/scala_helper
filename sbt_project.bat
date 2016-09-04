REM Create a set of directories to start a sbt project
REM Pass the name of the project as the argument
@echo off
if [%1]==[] goto HELP
set PROJNAME=%1
set DIRNAME=%PROJNAME: =_%
set BUILDFILE=%DIRNAME%\build.sbt
for %%d in (main, test, lib, project, target) do mkdir %DIRNAME%\%%d
for %%e in (java, scala, resources) do (
	mkdir %DIRNAME%\main\%%e
	mkdir %DIRNAME%\test\%%e
)
echo name := %PROJNAME% > %BUILDFILE%
echo version := "0.0.1" >> %BUILDFILE%
echo scalaVersion := "2.11.8" >> %BUILDFILE%
goto EXIT
:HELP
echo Argument missing!
echo Usage: %0 {Project Name}
:EXIT
