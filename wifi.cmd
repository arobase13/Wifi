@echo off
:menu
cls
color 1F
echo Gestion des réseaux Wi-Fi
echo.
echo 1 : Importer tous les profils
echo 2 : Exporter tous les profils 
echo 3 : Supprimer tous les profils 
echo 4 : Importer un profil 
echo 5 : Exporter un profil 
echo 6 : Supprimer un profil
echo 7 : Quitter
echo.
echo.
set /p choix=Sélectionner une option 1-7 ? :

if /I "%choix%"=="1" (goto :A)
if /I "%choix%"=="2" (goto :B)
if /I "%choix%"=="3" (goto :C)
if /I "%choix%"=="4" (goto :D)
if /I "%choix%"=="5" (goto :E)
if /I "%choix%"=="6" (goto :F)
if /I "%choix%"=="7" (goto :G)

goto menu

:A
echo.
for %%f in (*.xml) do (
netsh wlan add profile filename= "%%f" 
)
cls
goto menu

:B
echo.
netsh wlan export profile  key=clear folder=%~dp0
)
cls
goto menu

:C
echo.
SET /P AREYOUSURE=Tous les réseaus connus vont être supprimé, voulez-vous continuer O/N ?
IF /I "%AREYOUSURE%" EQU "N" GOTO menu
netsh wlan delete profile *
)
cls
goto menu

:D
cls
echo Gestion des réseaux Wi-Fi
echo.
echo Importer un réseau Wi-Fi
echo.
set /p ssid=Quel reseau souhaitez vous importer ? 
echo.
echo Import du réseau %ssid%.
echo.
netsh wlan add profile filename=Wi-Fi-%ssid%.xml
)
cls
if %ErrorLevel% equ 0 (echo True) else (echo False)
ping 127.0.0.1 -n 6 > nul
cls
goto menu

:E
echo.
set /p ssid=Quel reseau souhaitez exporter ? 
echo.
echo Export du réseau %ssid%.
echo.
netsh wlan export profile %ssid% key=clear folder=%~dp0
cls
if %ErrorLevel% equ 0 (echo True) else (echo False)
ping 127.0.0.1 -n 6 > nul
cls
goto menu

:F
cls
echo Gestion des réseaux Wi-Fi
echo.
echo Supprimer un réseau connu
echo.
set /p ssid=Quel reseau souhaitez vous supprimer ? 
echo.
SET /P AREYOUSURE=Le réseau %ssid% va être supprimé, voulez vous continuer O/N ?
IF /I "%AREYOUSURE%" EQU "N" GOTO menu
netsh wlan delete profile name=%ssid%
)
cls
if %ErrorLevel% equ 0 (echo True) else (echo False)
ping 127.0.0.1 -n 6 > nul
cls
goto menu


:G
echo.
echo Quitter ?
echo.
SET /P AREYOUSURE=Voulez-vous quitter O/N ?
IF /I "%AREYOUSURE%" EQU "O" GOTO END
cls
goto menu

:end
