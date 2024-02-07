####################################################################
### Anzeige aller Dateien im aktuellen Ordner                    ###
### welche "SuchString" enthalten, in einem bestimmten Zeitraum  ###
####################################################################


[string]   $SuchString = "Suchtext"
[string]   $DatumAb = "01.01.2024"
[string]   $DatumBis = "16.01.2024"

Get-ChildItem | Where-Object { $_.LastWriteTime.ToString("dd.MM.yyyy") -ge $DatumAb -AND $_.lastwritetime.ToString("dd.MM.yyyy") -le $DatumBis }  | Select-String $SuchString -simplematch  | Group-Object Path | Select-Object Name



#### ONE LINER ################
##
## Absoluter Pfad:
##get
## Get-ChildItem -Path "C:\Temp\Importiert"  | Where-Object { $_.LastWriteTime.ToString("dd.MM.yyyy") -ge "26.01.2024" -AND $_.lastwritetime.ToString("dd.MM.yyyy") -le "26.01.2024" } | Select-String "SUCHTEXT" -simplematch  | Group-Object Path | Select-Object Name
##
## Relativer Pfad:
##
## Get-ChildItem -Path ".\" | Where-Object { $_.LastWriteTime.ToString("dd.MM.yyyy") -ge "01.01.2024" -AND $_.lastwritetime.ToString("dd.MM.yyyy") -le "16.01.2024" } | Select-String "SUCHTEXT" -simplematch  | Group-Object Path | Select-Object Name
##
###############################

######################################################################################
### Anzeige aller Zeilen im aktuellen Ordner                                       ###
### welche beide Suchbegriffe enthalten. Im Beispiel "ERROR und "JAIF.KOMPONENTE"  ###
######################################################################################


Get-ChildItem |   Select-String -Pattern "ERROR"  | Select-String -Pattern "JAIF.KOMPONENTE"