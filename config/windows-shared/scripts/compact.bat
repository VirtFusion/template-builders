if "%PACKER_BUILDER_TYPE:~0,6%"=="hyperv" (
  echo "Skip compact steps in Hyper-V build."
  goto :eof
)
if not exist "C:\Windows\Temp\7z1900-x64.msi" (
	powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://www.7-zip.org/a/7z1900-x64.msi', 'C:\Windows\Temp\7z1900-x64.msi')" <NUL
)
msiexec /qb /i C:\Windows\Temp\7z1900-x64.msi

if not exist "C:\Windows\Temp\SDelete.zip" (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://download.sysinternals.com/files/SDelete.zip', 'C:\Windows\Temp\SDelete.zip')" <NUL
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://vagrantboxes.blob.core.windows.net/box/sdelete/v1.6.1/sdelete.exe', 'C:\Windows\Temp\sdelete.exe')" <NUL
)

if not exist "C:\Windows\Temp\CloudbaseInitSetup_Stable_x64.msi" (
  powershell -Command "(New-Object System.Net.Webclient).DownloadFile('https://cloudbase.it/downloads/CloudbaseInitSetup_Stable_x64.msi', 'C:\Windows\Temp\CloudbaseInitSetup_Stable_x64.msi' )" < NUL
)
msiexec /qb /i C:\Windows\Temp\CloudbaseInitSetup_Stable_x64.msi

if not exist "C:\Windows\Temp\sdelete.exe" (
	cmd /c ""C:\Program Files\7-Zip\7z.exe" x C:\Windows\Temp\SDelete.zip -oC:\Windows\Temp"
)

copy "A:\cloudbase-init.conf" "C:\Program Files\Cloudbase Solutions\Cloudbase-Init\conf\"
copy "A:\cloudbase-init-unattend.conf" "C:\Program Files\Cloudbase Solutions\Cloudbase-Init\conf\"

msiexec /qb /x C:\Windows\Temp\7z1900-x64.msi

net stop wuauserv
rmdir /S /Q C:\Windows\SoftwareDistribution\Download
mkdir C:\Windows\SoftwareDistribution\Download
net start wuauserv

cmd /c %SystemRoot%\System32\reg.exe ADD HKCU\Software\Sysinternals\SDelete /v EulaAccepted /t REG_DWORD /d 1 /f
cmd /c C:\Windows\Temp\sdelete.exe -q -z C:
