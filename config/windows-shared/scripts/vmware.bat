powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://install.virtfusion.net/optimize.exe', 'C:\Windows\Temp\optimize.exe')" <NUL
cmd /c C:\Windows\Temp\optimize.exe -v -o -g -windowsupdate enable -storeapp remove-all
cmd /c C:\Windows\Temp\optimize.exe -f 3 4 5 6 9
del C:\Windows\Temp\optimize.exe
