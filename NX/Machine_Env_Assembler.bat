@echo off
title Machine Environment Assembler
echo ---------------------
if defined launched (
        set was_launched=1     
) else ( set was_launched=0
)


:name
echo --------------
echo Please Enter Machine Kit Name
echo Do Not Use Special Characters or Spaces in Machine Name. 
echo Only Underscores Please.
echo --------------
set /p machine=

:type

echo -------------
echo Please Select a Machine Type
echo Machine Types 
echo 1 - MDM0101 -Mill machines
echo 2 - MDM0104 -TurnMill machines
echo 3 - MDM0201 -Lathe machines
echo 4 - MDM0204 -MillTurn machines
echo 5 - MDM0301 -Wedm machines
echo 6 - MDM0401 -Robot machines
echo 7 - MDM0901 -Generic machines
echo --------------
set /p machine_type_input=
if %machine_type_input% == 1 ( 
    set machine_type=MDM0101
    goto control 
)
if %machine_type_input% == 2 ( 
    set machine_type=MDM0104
    goto control 
)
if %machine_type_input% == 3 ( 
    set machine_type=MDM0201
    goto control 
)
if %machine_type_input% == 4 ( 
    set machine_type=MDM0204
    goto control
)
if %machine_type_input% == 5 ( 
    set machine_type=MDM0301
    goto control 
)
if %machine_type_input% == 6 ( 
    set machine_type=MDM0401
    goto control 
)
if %machine_type_input% == 7 ( 
    set machine_type=MDM0901
    goto control  
) else (
    echo Machine Type is Not Valid Parameter
    echo Parameter must be 1-7
    echo Press Any Key to Continue
    pause
    goto type
)

:control
echo --------------
echo Please Enter a Machine Control
echo Do Not Use Special Characters in Control Name. 
echo Spaces are permissiable.
echo --------------
set /p machine_ctrl=

:descr
echo --------------
echo Please Enter a Machine Description
echo Do Not Use Special Characters in Machine Name. 
echo Spaces are permissiable.
echo --------------
set /p machine_descr=

:manufacturer
echo --------------
echo Please Enter a Machine Manufacturer
echo Do Not Use Special Characters in Machine Name. 
echo Spaces are permissiable.
echo --------------
set /p machine_manuf=

if %was_launched% == 0 goto internal

@REM mkdir "%resources_path%\resource\library\machine\installed_machines\%machine%"
@REM mkdir "%resources_path%\resource\library\machine\installed_machines\%machine%\cse_driver"
@REM mkdir "%resources_path%\resource\library\machine\installed_machines\%machine%\encrypt"
@REM mkdir "%resources_path%\resource\library\machine\installed_machines\%machine%\graphics"
@REM mkdir "%resources_path%\resource\library\machine\installed_machines\%machine%\postprocessor"
@REM mkdir "%resources_path%\resource\library\machine\installed_machines\%machine%\Xx_Device_xX"

cd /d "%resources_path%\resource\library\machine\installed_machines"

if %was_launched% == 0 (
    goto external
)

:internal

mkdir "%machine%"
mkdir "%machine%\cse_driver"
mkdir "%machine%\encrypt"
mkdir "%machine%\graphics"
mkdir "%machine%\postprocessor"
mkdir "%machine%\Xx_Device_xX"

:external

xcopy "C:\Users\%USERNAME%\prolim-master\Organization\Files_To_Copy\Data_Lines.txt" "%machine%\"
xcopy "C:\Users\%USERNAME%\prolim-master\Organization\Files_To_Copy\Machine_Kit.dat" "%machine%\"

powershell -Command "(gc '%machine%\Machine_Kit.dat') -replace 'Mach_Name', '%machine%' | Out-File -encoding ASCII '%machine%\Machine_Kit.dat'"
powershell -Command "(gc '%machine%\Data_Lines.txt') -replace 'Mach_Name', '%machine%' | Out-File -encoding ASCII '%machine%\Data_Lines.txt'"
powershell -Command "(gc '%machine%\Data_Lines.txt') -replace 'Mach_Type', '%machine_type%' | Out-File -encoding ASCII '%machine%\Data_Lines.txt'"
powershell -Command "(gc '%machine%\Data_Lines.txt') -replace 'Mach_Descr', '%machine_descr%' | Out-File -encoding ASCII '%machine%\Data_Lines.txt'"
powershell -Command "(gc '%machine%\Data_Lines.txt') -replace 'Mach_Ctrl', '%machine_ctrl%' | Out-File -encoding ASCII '%machine%\Data_Lines.txt'"
powershell -Command "(gc '%machine%\Data_Lines.txt') -replace 'Mach_Manuf', '%machine_manuf%' | Out-File -encoding ASCII '%machine%\Data_Lines.txt'"


ren "%machine%\Machine_Kit.dat" %machine%.dat


if %was_launched% == 1 (
cd /d %current_path%
)

:quit
echo *** Press any key to EXIT ***
pause
@echo on
exit