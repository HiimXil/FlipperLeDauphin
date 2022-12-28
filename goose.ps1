Invoke-WebRequest -URI '$lk' -OutFile $env:TEMP\goose.zip
Expand-Archive -Path $env:TEMP\goose.zip -DestinationPath $env:TEMP\goose
$goose = $env:TEMP + "\goose\Goose\Goose\GooseDesktop.exe"
Invoke-Expression $goose
