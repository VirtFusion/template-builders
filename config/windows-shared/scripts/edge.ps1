

Write-Host "Installing Microsoft Edge..." -ForegroundColor Cyan
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EdgeUpdate /v Allowsxs /t REG_DWORD /d 1 /f
Write-Host "Downloading..."
$msiPath = "$env:TEMP\MicrosoftEdgeEnterpriseX64.msi"
(New-Object Net.WebClient).DownloadFile('https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2acf7a8c-34d3-433b-a6e8-527c0f9f88f2/MicrosoftEdgeEnterpriseX64.msi', $msiPath)

Write-Host "Installing..."
cmd /c start /wait msiexec /i "$msiPath" /qn /norestart
Remove-Item $msiPath

Set-Service edgeupdate -StartupType Manual -ErrorAction SilentlyContinue
Set-Service edgeupdatem -StartupType Manual -ErrorAction SilentlyContinue

Unregister-ScheduledTask -TaskName MicrosoftEdgeUpdateTaskMachineCore -Confirm:$false -ErrorAction SilentlyContinue
Unregister-ScheduledTask -TaskName MicrosoftEdgeUpdateTaskMachineUA -Confirm:$false -ErrorAction SilentlyContinue

Write-Host "Installed Microsoft Edge" -ForegroundColor Green
