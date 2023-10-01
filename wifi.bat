@echo off
color a 
title Redes Wi-Fi
mode 120, 30

:menu
cls
echo 1. Mostrar perfiles de redes Wi-Fi
echo 2. Mostrar clave de red Wi-Fi
echo 3. Salir
set /p choice=Escoja alguna de las siguientes opciones: 

if "%choice%"=="1" goto show_profiles
if "%choice%"=="2" goto show_password
if "%choice%"=="3" goto exit

:show_profiles
cls
echo Perfiles de redes Wi-Fi disponibles:
echo ------------------------------------
netsh wlan show profiles
pause
goto menu

:show_password
cls
set /p "red=Ingresa el nombre de la red Wi-Fi: "
cls
echo Contraseña de la red Wi-Fi "%red%":
echo ---------------------------------------
netsh wlan show profile name="%red%" key=clear | findstr "Clave de contenido"
pause
goto menu

:exit
echo Saliendo...
exit
