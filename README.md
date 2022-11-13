# WindowsUpdateTroubleshooter
A collection of commands to help in solving We couldn’t complete the updates. Undoing changes. Don’t turn off your computer.
In admin mode, launch powershell command:
# 1. System File Checker tool to repair missing or corrupted system files
  `SFC /SCANNOW`

#2. If there are problems with the system image, use DISM with the RestoreHealth option to automatically scan and repair common issues.
  `DISM.exe /Online /Cleanup-Image /Restorehealth`

#3 delete windows update cache files

  `$path = "C:\Windows\SoftwareDistribution"
  Get-ChildItem -Path $path -Recurse | Remove-Item -Force -Recurse`

#4 Checks the file system and file system metadata of a volume for logical and physical errors.

  `chkdsk /F /R /X /B /scan /offlinescanandfix`
