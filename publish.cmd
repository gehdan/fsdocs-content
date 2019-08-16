@echo off

REM Der name des Branches ist gleich dem Versions-Verzeichnis im Ziel-Repo
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set versiondir=%%i
echo.
echo Pulish %versiondir% ?
echo.
echo.
pause

set currentpath=%cd%


REM prüfen, ob das aktuelle Repo clean ist und auf neusten Stand bringen
cd %currentpath%
set gitout=
for /f "tokens=*" %%i in ('git status --porcelain') do set gitout=%%i
IF NOT "%gitout%" == "" (
    set errortext=Der Workspace im content-Repository ist nicht clean
    goto displayerror
)
git clean -fdx
git pull

REM prüfen, ob das ziel-Repo clean ist und auf neusten Stand bringen
cd ..\fsdocs
set gitout=
for /f "tokens=*" %%i in ('git status --porcelain') do set gitout=%%i
IF NOT "%gitout%" == "" (
    set errortext=Der Workspace im fsdocs-Repository ist nicht clean
    goto displayerror
)
git clean -fdx
git pull

REM die dokumentation rendern
cd %currentpath%
docfx\docfx.exe docfx.json

REM die dokumentation in das ziel-Repo kopieren
cd ..\fsdocs
rd %versiondir% /s /q
md %versiondir%

xcopy %currentpath%\_site %versiondir% /s /e

git add .
git commit -m "publish %versiondir%"
git push

pause
exit


:displayerror
@echo off
color 4E
echo ####### ERROR ######
echo #
echo # %errortext%
echo #
echo ####################
pause
exit
