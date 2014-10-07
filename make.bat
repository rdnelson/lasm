@echo off
if NOT "%FLEXDIR%" == "" (
    set "PATH=%PATH%;%FLEXDIR%"
)
if NOT "%BISONDIR%" == "" (
    set "PATH=%PATH%;%BISONDIR%"
)

mkdir bin
mkdir msvc10
del /Q bin\*
cd msvc10
%QTDIR%\bin\qmake -spec win32-msvc2010 -tp vc -r ..

call "%SDK_DIR%\bin\SetEnv.cmd" /x86 /Debug
msbuild lasm-gui\lasm-gui.vcxproj /nologo /verbosity:m /p:Configuration=Debug
msbuild src\src.vcxproj /nologo /verbosity:m /p:Configuration=Debug


call "%SDK_DIR%\bin\SetEnv.cmd" /x86 /Release
msbuild lasm-gui\lasm-gui.vcxproj /nologo /verbosity:m /p:Configuration=Release
msbuild src\src.vcxproj /nologo /verbosity:m /p:Configuration=Release


copy lasm-gui\bin\*.exe ..\bin\
copy src\bin\*.exe ..\bin\
