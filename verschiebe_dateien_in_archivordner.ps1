#######################################################################################################################################
###                                             Datei-Archivierung fuer Ordner                                                      ###
###                                                                                                                                 ###
###                                            !! Benutzung auf eigene Gefahr !!                                                    ###
###                                                                                                                                 ###
### PfadImportierte = Quellpfad                                                                                                     ###
### PfadArchiv = Zielpfad                                                                                                           ###
### AbTage = Aktuelles Datum in negativen Tagen                                                                                     ###
###                                                                                                                                 ###
###                                                                                                                                 ###
###                                                                                                                                 ###
### Aufruf mit Parametern:          powershell.exe -file .\verschiebe_dateien_in_archivordner.ps1 ".\Importierte" ".\Archiv" "-1"   ###
###                                                                                                                                 ###
###                                                                                                                                 ###
### Aufruf mit fixen Argumenten:    powershell.exe -file .\verschiebe_dateien_in_archivordner.ps1                                   ###
###                                                                                                                                 ###
### args[0-2] müssen durch Strings ersetzt werden, z.B. $PfadImportierte = ".\Importierte"                                          ###
###                                                   $PfadArchiv = ".\Archiv"                                                      ###
###                                                   $AbTage = "-1"                                                                ###
###                                                                                                                                 ###
###                                                                                                                                 ###
###                                                                                                                                 ###
###         !! New-Item und Move-Item muessen auskommentiert werden !!                                                              ###
###                                                                                                                                 ###
#######################################################################################################################################

[string]   $PfadImportierte = $args[0]
[string]   $PfadArchiv = $args[1]
[string]   $AbTage = $args[2]


Get-ChildItem -Path $PfadImportierte  | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays($AbTage) } | ForEach-Object {     # mit '-Recurse' werden auch noch Unterordner durchsucht, hier aber drauf achten, dass ZielPfad nicht im PfadImportierte liegt
    
    $ZielPfad = Join-Path -Path $PfadArchiv -ChildPath $_.LastWriteTime.ToString('yyyy-MM-dd') 
    
    # Test zum Anzeigen der engÃ¼ltigen Pfade jeder gefundenen Datei
    Write-Host $ZielPfad

    # Ordner mit Datumsangabe Erstellen am PfadArchiv
    #New-Item -Type Directory -Path $ZielPfad -Force

    # Verschieben jeder gefundenen Datei aus 'Get-ChildItem'
    #Move-Item $_.FullName -Destination $ZielPfad
}


#####################################################################################################################################################################################################################################################################################################################################################################################################################
###                                                                                                                                                                                                                                                                                                                                                                                                               ###
### One-Liner direkt aus der PowerShell                                                                                                                                                                                                                                                                                                                                                                           ###
###                                                                                                                                                                                                                                                                                                                                                                                                               ###
###                                                                                                                                                                                                                                                                                                                                                                                                               ###
### $PfadImportierte = ".\Importierte"; $PfadArchiv = ".\Archiv"; $AbTage = "-0" ; Get-ChildItem -Path $PfadImportierte  | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays($AbTage) } | ForEach-Object { $ZielPfad = Join-Path -Path $PfadArchiv -ChildPath $_.LastWriteTime.ToString('yyyy-MM-dd'); New-Item -Type Directory -Path $ZielPfad -Force; Move-Item $_.FullName -Destination $ZielPfad }       ###
###                                                                                                                                                                                                                                                                                                                                                                                                               ###
#####################################################################################################################################################################################################################################################################################################################################################################################################################