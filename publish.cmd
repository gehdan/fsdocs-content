set versiondir=v4.2
set currentpath=%cd%

REM prüfen, ob das ziel-Repo clean ist.
cd ..\fsdocs
set gitout=
for /f "tokens=*" %%i in ('git status --porcelain') do set gitout=%%i
IF NOT "%gitout%" == "" (
    set errortext=workspace is not clean
    goto displayerror
)
git pull

REM die dokumentation rendern
cd %currentpath%
docfx\docfx.exe docfx.json

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
