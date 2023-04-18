@echo off
REM  ��������� ����������� �� ����� ����������� ������ ����� �����
REM  =========================================================================
REM  | ��� ���������� ���� a.bat � �������������� ���������� ��������� path  |
REM  =========================================================================
REM �������� ������� ��������� ��� ������ ����������� ����� a.bat :
REM %1   - ������ (� ������������) ��������, 
REM %~n1 - ��� �����, ����������� ��� ��������, ��� ����������
if .%1.==.. goto USAGE
if exist %1 goto start

echo File %1 not found !  usage: m program.asm 
  goto TheEnd

:USAGE
REM ��������� � ���, ��� ��� ������� ���� ���������
REM  ��� �������������� ����� � �����������  
echo usage: m program.asm unit2.asm unit3.asm unit4.asm unit5.asm
  goto TheEnd
 
:start 
REM �������� ����, ��� ������� ������ ����������� MASM:
  set path= %path%;c:\masm 6.14\bin;c:\masm32\bin;..\bin;..\..\bin
REM  c:\masm 6.14 - �� ����������,  c:\masm32 - ���� 
  
REM ��������� (����������) ���������� (ml.exe -?):
REM    /Fl     �������� �������� (%~n1.lst)
REM    /I...   ������� � ����������� (�� include) �������
REM    /c      ���������� � ��������� ���� (%~n1.obj), ��� ����������
REM    /coff   ������ ���������� ����� � COFF (Common Object File Format)
REM    /nologo ������ �������� �� ����� ������ ����������� � ��.
REM -------------------------------------------------------------------------------
ml.exe /Fl /Ic:\masm32\include /I"c:\tools\masm 6.14\include" /c /coff /nologo %1
REM -------------------------------------------------------------------------------
REM �������� ���������� ����������
if errorlevel 0 goto noasmerr1
:errasm
REM ��������� � ���, ��� � �������� ���������� ���� ������������� ������
  echo   Assembler Error in file  %1 !!!

:noasmerr1

if .%2.==.. goto link1
if exist %2 goto comp2

echo File %2 not found !  usage: m program.asm unit2.asm 
  goto TheEnd

:comp2
ml.exe /Fl /Ic:\masm32\include /I"c:\tools\masm 6.14\include" /c /coff /nologo %2

if errorlevel 0 goto noasmerr2
:errasm
  echo   Assembler Error in file  %2 !!!

:noasmerr2

if .%3.==.. goto link2
if exist %3 goto comp3

echo File %3 not found !  usage: m program.asm unit2.asm unit3.asm 
  goto TheEnd

:comp3
ml.exe /Fl /Ic:\masm32\include /I"c:\tools\masm 6.14\include" /c /coff /nologo %3

if errorlevel 0 goto noasmerr3
:errasm
  echo   Assembler Error in file  %3 !!!

:noasmerr3

if .%4.==.. goto link3
if exist %4 goto comp4

echo File %4 not found !  usage: m program.asm unit2.asm unit3.asm unit4.asm 
  goto TheEnd

:comp4
ml.exe /Fl /Ic:\masm32\include /I"c:\tools\masm 6.14\include" /c /coff /nologo %4

if errorlevel 0 goto noasmerr4
:errasm
  echo   Assembler Error in file  %4 !!!

:noasmerr4

if .%5.==.. goto link4
if exist %5 goto comp5

echo File %5 not found ! 
echo   usage: m program.asm unit2.asm unit3.asm unit4.asm unit5.asm
  goto TheEnd

:comp5
ml.exe /Fl /Ic:\masm32\include /I"c:\tools\masm 6.14\include" /c /coff /nologo %5

if errorlevel 0 goto noasmerr5
:errasm
  echo   Assembler Error in file  %5 !!!

:noasmerr5

if .%6.==.. goto link5

echo No more than 5 parameters are allowed! 
echo  usage: m program.asm unit2.asm unit3.asm unit4.asm unit5.asm

  goto TheEnd

:link5

link.exe /libpath:"c:\masm 6.14\lib" /libpath:c:\masm32\lib /subsystem:console /nologo %~n1.obj %~n2.obj %~n3.obj %~n4.obj %~n5.obj 

del %~n5.obj 
del %~n4.obj 
del %~n3.obj 
del %~n2.obj 
del %~n1.obj 

if errorlevel 0 goto RunExe

echo A linker error in the program of the 5 units !

  goto TheEnd

:link4

link.exe /libpath:"c:\masm 6.14\lib" /libpath:c:\masm32\lib /subsystem:console /nologo %~n1.obj %~n2.obj %~n3.obj %~n4.obj 

del %~n4.obj 
del %~n3.obj 
del %~n2.obj 
del %~n1.obj 

if errorlevel 0 goto RunExe

echo A linker error in the program of the 4 units !

  goto TheEnd

:link3

link.exe /libpath:"c:\masm 6.14\lib" /libpath:c:\masm32\lib /subsystem:console /nologo %~n1.obj %~n2.obj %~n3.obj 

del %~n3.obj 
del %~n2.obj 
del %~n1.obj 

if errorlevel 0 goto RunExe

echo A linker error in the program of the 3 units !

  goto TheEnd

:link2

link.exe /libpath:"c:\masm 6.14\lib" /libpath:c:\masm32\lib /subsystem:console /nologo %~n1.obj %~n2.obj

del %~n2.obj 
del %~n1.obj 

if errorlevel 0 goto RunExe

echo A linker error in the program of the two units !

  goto TheEnd

:link1
REM ��������� ���������� (link.exe -?):
REM    /libpath:...       ������� � ���������������� ������������
REM    /subsystem:console �������� ������� ���������� Windows-����������.
REM    /nologo            ������ �������� �� ����� ������ ��������� ������ � ��.
REM --------------------------------------------------------------------------------------------
link.exe /libpath:"c:\masm 6.14\lib" /libpath:c:\masm32\lib /subsystem:console /nologo %~n1.obj 
REM --------------------------------------------------------------------------------------------
REM  �������� �������������� ���������� ����� %~n1.obj
del %~n1.obj 

if errorlevel 0 goto RunExe

echo Linker Error in program of one unit !

  goto TheEnd

:RunExe
rem pause
rem 
%~n1.exe
echo on

:TheEnd

