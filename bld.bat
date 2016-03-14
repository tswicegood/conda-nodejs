msiexec /a node-v%PKG_VERSION%-x64.msi /qb TARGETDIR=%TEMP%
mkdir %SCRIPTS%

copy %TEMP%\nodejs\node.exe %SCRIPTS%
xcopy /i /e /y %TEMP%\nodejs\node_modules %LIBRARY_LIB%\node_modules

echo @echo off > %SCRIPTS%\npm.cmd
echo node "%LIBRARY_LIB%\.\node_modules\npm\bin\npm-cli.js" %%* >> %SCRIPTS%\npm.cmd
