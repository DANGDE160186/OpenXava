@echo off
SETLOCAL

:: set SKIP_CONFIRM=Yes ��������ȷ����ʾ
if "%SKIP_CONFIRM%"=="Yes" goto :DO_RESTORE

set /p TO_CONTINUE=Restore �������Ḳ�����ݿ������е�����, ������ Y ȷ��: 
if "%TO_CONTINUE%"=="Y" goto :DO_RESTORE
if "%TO_CONTINUE%"=="y" goto :DO_RESTORE
echo �����ȷ����Ϣ [%TO_CONTINUE%] ��Ч, �����˳�.
goto :END

:DO_RESTORE
set PWD=%~dp0.
pushd %PWD%
for /d %%i in (*) do (
    echo ^>^>^> restore database [%%i] from [%PWD%\%%i\%%i.sql] ...
    pushd %~dp0..\udrive\bin
    echo DROP DATABASE %%i | mysql -v --port=3311 --user=root --password=root --one-database %%i
    echo CREATE DATABASE %%i | mysql -v --port=3311 --user=root --password=root
    type %PWD%\%%i\%%i.sql | mysql -v --port=3311 --user=root --password=root --one-database %%i
    popd
    echo.
)
popd

:END
ENDLOCAL

pause
