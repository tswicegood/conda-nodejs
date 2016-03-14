msiexec /a node-v%PKG_VERSION%-x64.msi /qb TARGETDIR=%TEMP%

copy %TEMP%\nodejs\node.exe %SCRIPTS%
del %SRC_DIR%\nodejs\npm.cmd
xcopy /i /e /y %SRC_DIR%\nodejs\node_modules %LIBRARY_LIB%\node_modules

echo @echo off > %SCRIPTS%\npm.cmd
echo node "%LIBRARY_LIB%\.\node_modules\npm\bin\npm-cli.js" %%* >> %SCRIPTS%\npm.cmd
