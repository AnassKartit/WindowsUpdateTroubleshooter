$Host.UI.RawUI.WindowTitle = "System Repair Tool"

Clear-Host

Write-Host "-------------------------------------------------------" -ForegroundColor Yellow
Write-Host "               SYSTEM REPAIR TOOL" -ForegroundColor Yellow
Write-Host "-------------------------------------------------------" -ForegroundColor Yellow
Write-Host

Write-Host "Choose an option:" -ForegroundColor White
Write-Host "1. Repair missing or corrupted system files" -ForegroundColor White
Write-Host "2. Scan and repair common issues with the system image" -ForegroundColor White
Write-Host "3. Delete Windows update cache files" -ForegroundColor White
Write-Host "4. Check the file system for errors" -ForegroundColor White
Write-Host "5. Exit" -ForegroundColor White

$choice = Read-Host "Enter your choice"

switch ($choice) {
    1 {
        Checkpoint-Computer -Description "System Restore Point"
        SFC /SCANNOW
    }
    2 {
        Checkpoint-Computer -Description "System Restore Point"
        DISM.exe /Online /Cleanup-Image /Restorehealth
    }
    3 {
        Checkpoint-Computer -Description "System Restore Point"
        $path = "C:\Windows\SoftwareDistribution"
        Get-ChildItem -Path $path -Recurse | Remove-Item -Force -Recurse
    }
    4 {
        Checkpoint-Computer -Description "System Restore Point"
        chkdsk /F /R /X /B /scan /offlinescanandfix
    }
    5 {
        Write-Host "Exiting..." -ForegroundColor White
        exit
    }
    default {
        Write-Host "Invalid choice" -ForegroundColor Red
    }
}
