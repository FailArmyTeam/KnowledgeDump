$A3SERVERdir = "G:\FAILARMY\Applications\Games\ArmA3\A3_FailArmyServer01"
$A3SERVERexe = "$A3SERVERdir\arma3server.exe"

$MODSParam = "-mod=@Epoch;@EpochHive;@allinarmaterrainpack;" #TODO: Make MODSParam and MODS work as one variable.

$MODS = @("@Epoch",
            "@allinarmaterrainpack"
            )
$CONFIG = "-config=$A3SERVERdir\config\A3EpochServer.cfg"
$CFG = "-cfg=$A3SERVER01dir\config\users\A3Server.cfg"
$PROFILES = "-profiles=$A3SERVER01dir\SC"
$PORT = "-port=2302"
$OPTIONS = "-name=SC -maxMem=4096 -noSound -nosplash netlog=true"

# Bring mods into Server directory from base Arma3 installation using sym-link.
foreach ($mod in $MODS)
{
    $exists = & Test-Path $CURRENTDIR\$mod
    if (!$exists)
    {
        cmd /c mklink /j $CURRENTDIR\$mod $A3SERVERMASTER\$mod
    }
    
}

& $A3SERVER01exe $MODSParam $CONFIG $CFG $PROFILES $PORT $OPTIONS