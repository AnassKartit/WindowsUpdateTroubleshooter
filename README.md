# Fix for : We couldn’t complete the updates. Undoing changes Winodws 10 Update 
# Running the script using iwr and iex
```powershell
iwr 'https://raw.githubusercontent.com/AnassKartit/WindowsUpdateTroubleshooter/main/fixupdate.ps1' -UseBasicParsing | iex
```

You can use the following command to run the script from PowerShell using iwr and iex:

A collection of commands to help in solving We couldn’t complete the updates. Undoing changes. Don’t turn off your computer.
In admin mode, launch powershell command:
# 1. System File Checker tool to repair missing or corrupted system files
```powershell
SFC /SCANNOW
```

# 2. If there are problems with the system image, use DISM with the RestoreHealth option to automatically scan and repair common issues.
   ```powershell
   DISM.exe /Online /Cleanup-Image /Restorehealth
   ```

# 3. delete windows update cache files

 ```powershell
 $path = "C:\Windows\SoftwareDistribution"
 Get-ChildItem -Path $path -Recurse | Remove-Item -Force -Recurse
 ```

# 4.Checks the file system and file system metadata of a volume for logical and physical errors.

 ```powershell
 chkdsk /F /R /X /B /scan /offlinescanandfix
 ```
  
 # if Nothing worked from the above , manually download the upgrade assistant from https://www.microsoft.com/en-us/software-download/windows10
