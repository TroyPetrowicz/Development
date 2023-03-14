REM
REM

@echo off
title Development Environment Assembler
setlocal

echo ***!!! PLEASE, EXIT THE DROPBOX DESKTOP APPLICATION IF IN USE !!!***
echo It is strongly recommended you don't use exclamation sign "!" in the names
echo -------------
echo Please, Enter an NX version
:type_again
echo Available options are:
echo -------------
REM echo 100
echo 1 - 110
echo 2 - 120
echo 3 - 1847
echo 4 - 1872
echo 5 - 1899
echo 6 - 1926
echo 7 - 1953
echo 8 - 1980
echo 9 - 2007
echo 10 - 2206
echo --------------
set /p nx_input=

REM if %nx_input% == 100    set NX_VERSION=V28.0
if %nx_input% == 1 (
	set NX_VERSION=V29.0
	set nx_number=110
	goto start_1
)
if %nx_input% == 2 (
	set NX_VERSION=V30.0
	set nx_number=120
	goto start_1
)
if %nx_input% == 3 (
	set NX_VERSION=V31.0
	set nx_number=1847
	goto start_1
)
if %nx_input% == 4 (
	set NX_VERSION=V32.0
	set nx_number=1872
	goto start_1
)
if %nx_input% == 5 (
	set NX_VERSION=V1899
	set nx_number=1899
	goto start_1
)
if %nx_input% == 6 (
	set NX_VERSION=V1926
	set nx_number=1926
	goto start_1
)
if %nx_input% == 7 (
	set NX_VERSION=V1953
	set nx_number=1953
	goto start_1
)
if %nx_input% == 8 (
	set NX_VERSION=V1980
	set nx_number=1980
	goto start_1
)
if %nx_input% == 9 (
	set NX_VERSION=V2007
	set nx_number=2007
	goto start_1
)
if %nx_input% == 10 (
	set NX_VERSION=V2206
	set nx_number=2206
	goto start_1
)
echo Input "%nx_input%" is incorrect, please, try again
goto type_again

:start_1
echo --------------------------
echo Please, Enter Customer Environment Name
echo Do Not Use Special Characters or Spaces in Environment Name. 
echo Only Underscores Please.
set /p dev_env_name=
echo -------------------------
echo Press S to Start Assembling the Development Environment
echo Press Q to Quit
set /p start_or_quit=
if %start_or_quit% == s goto start_assemble
if %start_or_quit% == S goto start_assemble
if %start_or_quit% == q goto quit
if %start_or_quit% == Q goto quit
if not %start_or_quit% == s goto quit
if not %start_or_quit% == S goto quit

:start_assemble

echo *** SETUP ROOT DIRECTORY START ***

REM Determine current path to .bat file
set current_path=%~dp0
set current_path=%current_path:~0,-1%
REM execute "cd" command
cd /d "%current_path%"
echo Current_path is: %current_path%

set kit_path=%current_path%\%dev_env_name%\NX%nx_number%
echo Kit path is: %kit_path%

set resources_folder=MACH
echo Resources folder is: %resources_folder%

set resources_path=%kit_path%\%resources_folder%
echo Resources path is: %resources_path%

if not exist "%current_path%\%dev_env_name%" (
	mkdir "%current_path%\%dev_env_name%"
@REM ) else (
@REM 	echo The folder exists already, please, delete it manually
@REM 	echo Process is aborted
@REM 	pause
@REM 	goto quit
)

if not exist "%kit_path%" (
	mkdir "%kit_path%"
) else (
	echo This customer's NX%nx_number% environment has already been created. 
	echo Please verify the customer and NX version you are trying to create. 
	pause
	goto quit
)
echo ------------------------

@REM mkdir "%resources_path%"
@REM mkdir "%resources_path%\templates"
@REM mkdir "%resources_path%\startup"
@REM mkdir "%resources_path%\usertools\bitmaps"
@REM mkdir "%resources_path%\usertools\startup"
mkdir "%kit_path%\Cam_Samples"
mkdir "%kit_path%\Deliverables"
mkdir "%kit_path%\Documentation from Customer"
mkdir "%kit_path%\Internal Documentation"
mkdir "%kit_path%\Issues"
mkdir "%kit_path%\env"

REM Determine where NX is installed
set rk=hklm\software\Unigraphics Solutions\Installed Applications
if /i "%PROCESSOR_ARCHITECTURE%"=="AMD64" set rk=hklm\software\wow6432node\Unigraphics Solutions\Installed Applications
if /i "%PROCESSOR_ARCHITEW6432%"=="AMD64" set rk=hklm\software\wow6432node\Unigraphics Solutions\Installed Applications
REM echo rk is: %rk%
echo NX_VERSION is: %NX_VERSION%
for /f "tokens=3,* usebackq" %%h in (`reg query "%rk%" /v "Unigraphics %NX_VERSION%" ^| findstr /i %NX_VERSION%` ) do (set str1=%%~dpi) 
set UGII_BASE_DIR=%str1:\nxbin\=%
echo UGII_BASE_DIR is: %UGII_BASE_DIR%

echo *** SETUP ROOT DIRECTORY END ***
echo -----------------------

echo Start Copying Files and Folders to the Environment
echo Press S to Dtart copy files
echo Press Q to Quit
set /p yes_or_no=
if %yes_or_no% == s goto start_copy
if %yes_or_no% == S goto start_copy
if %yes_or_no% == q goto quit
if %yes_or_no% == Q goto quit
if not %start_or_quit% == s goto quit
if not %start_or_quit% == S goto quit
:start_copy

REM copy launcher

xcopy "C:\Users\%USERNAME%\prolim-master\Organization\Files_To_Copy\Customer_NX_Launcher.txt" "%kit_path%\"
xcopy "C:\Users\%USERNAME%\prolim-master\Organization\Files_To_Copy\ugii_env.dat" "%kit_path%\env\"

powershell -Command "(gc '%kit_path%\Customer_NX_Launcher.txt') -replace 'version_not_set', '%nx_number%' | Out-File -encoding ASCII '%kit_path%\Customer_NX_Launcher.txt'"
powershell -Command "(gc '%kit_path%\Customer_NX_Launcher.txt') -replace 'customer_not_set', '%dev_env_name%' | Out-File -encoding ASCII '%kit_path%\Customer_NX_Launcher.txt'"
powershell -Command "(gc '%kit_path%\env\ugii_env.dat') -replace 'customer_not_set', '%dev_env_name%' | Out-File -encoding ASCII '%kit_path%\env\ugii_env.dat'"
powershell -Command "(gc '%kit_path%\env\ugii_env.dat') -replace 'version_not_set', '%nx_number%' | Out-File -encoding ASCII '%kit_path%\env\ugii_env.dat'"


ren "%kit_path%\Customer_NX_Launcher.txt" %dev_env_name%_NX%nx_number%.bat

REM copy OOTB resource data
robocopy "%UGII_BASE_DIR%\MACH" "%resources_path%" /e /nfl /ndl /a-:r
@REM del *.* /s

IF EXIST "%kit_path%\MACH\resource\library\machine\installed_machines" (
    rmdir "%kit_path%\MACH\resource\library\machine\installed_machines" /s /q
	mkdir "%kit_path%\MACH\resource\library\machine\installed_machines"
)

IF EXIST "%kit_path%\MACH\auxiliary" (
    rmdir "%kit_path%\MACH\auxiliary" /s /q
)

REM copy templates to central folder

echo ------------------------
cd %UGII_BASE_DIR%
echo Current Dir is %UGII_BASE_DIR%
echo Resources path is %resources_path%
for /d /r %%i in (templates) do (
if exist %%i ( robocopy "%%i" "%resources_path%\templates"  /xf *.xlsx *.xla *.fem *.xs4 *.svg *.vb *.zip *.xlb *.html *.sim *.bat )
)
cd /d "%current_path%"

@REM type "%kit_path%\launch*.bat" >> "%kit_path%\tmp.txt"

@REM setlocal EnableDelayedExpansion
@REM for /f "usebackq tokens=*" %%a in ("%kit_path%\tmp.txt") do (
@REM 	set "line_check=%%a"
@REM 	set "line_check=!line_check:~0,16!"
@REM 	if "!line_check!" EQU "set NX_NUMBER=NX" (
@REM 		REM echo line_check is: !line_check!
@REM 		set NewStr=set NX_NUMBER=NX!nx_number!
@REM 		echo !NewStr!
@REM 	) else (
@REM 		echo %%a
@REM 	)
@REM ) >> "%kit_path%\tmp1.txt"
@REM for /f "usebackq tokens=*" %%a in ("%kit_path%\tmp1.txt") do (
@REM 	set "line_check=%%a"
@REM 	set "line_check=!line_check:~0,13!"
@REM 	if "!line_check!" EQU "set ED_NX_LIB" (
@REM 		REM echo line_check is: !line_check!
@REM 		set NewStr=set ED_NX_LIB=%%ED_NX_DIR%%\!resources_folder!
@REM 		echo !NewStr!
@REM 	) else (
@REM 		echo %%a
@REM 	)
@REM ) >> "%kit_path%\tmp2.txt"
@REM setlocal DisableDelayedExpansion

echo -----------------------------------
echo *** Environment Kit Has Been Created Successfully ***

echo Press E to Create a New Machine Environment for this Customer
echo Press Q to quit
set /p new_mach_or_quit=
if %new_mach_or_quit% == e goto new_mach
if %new_mach_or_quit% == E goto new_mach
if %new_mach_or_quit% == q goto quit
if %new_mach_or_quit% == Q goto quit
if not %new_mach_or_quit% == s goto quit
if not %new_mach_or_quit% == S goto quit

:new_mach

set launched=1
xcopy "C:\Users\%USERNAME%\prolim-master\Organization\Machine_Env_Assembler.bat" "%kit_path%\MACH\resource\library\machine\installed_machines\"
call "%kit_path%\MACH\resource\library\machine\installed_machines\Machine_Env_Assembler.bat"


echo *** Press any key to EXIT ***
pause
:quit
endlocal
@echo on
exit
