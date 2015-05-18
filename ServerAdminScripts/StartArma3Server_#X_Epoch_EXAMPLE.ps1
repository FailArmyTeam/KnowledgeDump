$A3SERVERdir = "G:\FAILARMY\Applications\Games\ArmA3\A3_FailArmyServer01"
$A3SERVERexe = "$A3SERVERdir\arma3server.exe"

$MODSParam = "-mod="
$MODS = @("@Epoch",
			"@epochhive",
            "@allinarmaterrainpack"
            )

$CONFIG = "-config=$A3SERVERdir\config\A3EpochServer.cfg"
$CFG = "-cfg=$A3SERVERdir\config\users\A3Server.cfg"
$PROFILES = "-profiles=$A3SERVERdir\SC"
$PORT = "-port=2302"
$OPTIONS = "-name=SC -maxMem=4096 -noSound -nosplash server=server netlog=true"

# Bring mods into Server directory from base Arma3 installation using sym-link.
foreach ($mod in $MODS)
{
    $exists = & Test-Path $A3SERVERdir\$mod
    if (!$exists)
    {
        cmd /c mklink /j $A3SERVERdir\$mod $A3SERVERMASTER\$mod
    }
    $MODSParam += "$mod;" 
}

& $A3SERVERexe $MODSParam $CONFIG $CFG $PROFILES $PORT $OPTIONS
Start-Process $A3SERVERdir\DB\start-redis.cmd