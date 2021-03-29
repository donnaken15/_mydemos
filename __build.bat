
@echo off
cls

rem my demos
rem some might suck

setlocal

rem "C:\Program Files (x86)\Microsoft Visual Studio 16.0\VC\Auxiliary\Build\vcvars32.bat"
call "%VS100COMNTOOLS%vsvars32.bat"

rem     0000 FIRST TEST
call :C 0000_FIRST_TEST

:#pause
endlocal
exit /b

:C
TASKKILL /F /IM %1.EXE
CL    %1.C /GS- /GL /W3 /Gy /Gm- /Ox /GF /WX- /Gd /GX /Og /Oy /Oi /Os /MD /Zl /LIBPATH:"C:\Program Files (x86)\Microsoft Visual Studio 6\LIB" "MSVCRT.LIB" "KERNEL32.LIB"
del   %1.EXE
link  /NXCOMPAT:NO /DYNAMICBASE:NO /FIXED /MACHINE:X86 /OPT:REF /SAFESEH:NO /OPT:ICF /NOLOGO /ENTRY:main /LIBPATH:"C:\Program Files (x86)\Microsoft Visual Studio 6\LIB" "MSVCRT.LIB" "KERNEL32.LIB" %1.obj /merge:.rdata=.data /merge:.text=.data /merge:.bss=.data /ALIGN:16 /FILEALIGN:16
goto :EOF
