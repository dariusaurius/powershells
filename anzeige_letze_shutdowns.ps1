#####################################################
### Anzeige der letzten Windows-Shutdown-Events   ###
###                                               ###
### Select-Object -First 5 = Letzen 5 Ereignisse  ###
#####################################################


Get-WinEvent -FilterHashtable @{logname='System';id=1074} | Select-Object -First 5 | Format-Table -Wrap TimeCreated,Id,Message