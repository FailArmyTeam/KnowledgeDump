#Script developed by jsd1710 for Fail Army Team
# Used to make symbolic-links to necessary directories and hard-links to files necessary for Arma 3 Server
# operation. Modify the variables to accommodate unique setups. Run this script in the folder you wish to 
# run the server from.
$A3SERVERMASTER = "G:\FAILARMY\Applications\Games\ArmA3\arma3server" #Base Arma 3 Installation directory.
$CURRENTDIR = "$(pwd)"

$ARMA3FOLDERS = @("addons",
                    "battleye",
                    "config",
                    "curator",
                    "dll", 
                    "dta",
                    "heli",
                    "kart",
                    "mark",
                    "mpmissions"
                    )


$ARMA3FILES = @("arma3server.exe",
                    "ijl15.dll",
                    "msvcr100.dll",
                    "physx3_x86.dll",
                    "physx3common_x86.dll", 
                    "physx3cooking_x86.dll",
                    "physx3gpu_x86.dll",
                    "steam.dll",
                    "steam_api.dll",
                    "steam_appid.txt",
                    "steamclient.dll",
                    "tier0_s.dll",
                    "vstdlib_s.dll"
                    )
$CUSTOMFOLDERS = @("BEC",
                    "keys",
                    "logs"
                    )

# Only create files and folders if they do not already exist.
foreach ($folder in $CUSTOMFOLDERS)
{
    $exists = & Test-Path $CURRENTDIR\$folder
    if (!$exists)
    {
        mkdir $CURRENTDIR\$folder
    }
    
}

foreach ($folder in $ARMA3FOLDERS)
{
    $exists = & Test-Path $CURRENTDIR\$folder
    if (!$exists)
    {
        cmd /c mklink /j $CURRENTDIR\$folder $A3SERVERMASTER\$folder
    }
    
}

foreach ($file in $ARMA3FILES)
{
    $exists = & Test-Path $CURRENTDIR\$file
    if (!$exists)
    {
        cmd /c mklink /h $CURRENTDIR\$file $A3SERVERMASTER\$file
    }
}