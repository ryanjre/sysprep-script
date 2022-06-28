Write-Host "Turning off BDE"
manage-bde -off c:


$Status = (manage-bde.exe -status | Select-String -Pattern 'Conversion Status').ToString()

while (1 -eq 1 ){
    if (($Status.Trim()).Substring(18).Trim() -ne "Fully Decrypted")
    {
    $Status = (manage-bde.exe -status | Select-String -Pattern 'Conversion Status').ToString()
    Start-Sleep -Seconds 1.5
    }
    else {break}
}
Write-Host "Decrypted"
cd sysprep 
Write-Host "Running Sysprep"
cmd.exe /c sysprep /generalize /oobe /shutdown