@echo off
@rem http://media.steampowered.com/installer/steamcmd.zip
SETLOCAL ENABLEDELAYEDEXPANSION

       :: DEFINE the following variables where applicable to your install

    SET STEAMLOGIN=username password
    SET A3serverBRANCH=233780 -beta
        :: For stable use 233780 -beta
        :: For Dev use 233780 -beta development

	::Example Directories.
    SET A3serverPath=G:\FAILARMY\Applications\Games\ArmA3\arma3server
    SET STEAMPATH=G:\FAILARMY\Applications\steamcmd\


:: _________________________________________________________

echo.
echo     You are about to update ArmA 3 server
echo        Dir: %A3serverPath%
echo        Branch: %A3serverBRANCH%
echo.
echo     Key "ENTER" to proceed
pause
%STEAMPATH%\steamcmd.exe +login %STEAMLOGIN% +force_install_dir %A3serverPath% +"app_update %A3serverBRANCH%" validate +quit
echo .
echo     Your ArmA 3 server is now up to date
echo     key "ENTER" to exit
pause
