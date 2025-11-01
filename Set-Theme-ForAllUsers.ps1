
# Set-Theme-ForAllUsers.ps1
# This script iterates through all user profiles and sets the Windows 11 theme.

param (
    [Parameter(Mandatory=$true)]
    [ValidateSet('Light', 'Dark')]
    [string]$Theme
)

$setThemeScript = "c:\Users\rrrai\OneDrive\Documents\windows auto light and dark mode\Set-Theme.ps1"

# Get all user profiles
$userProfiles = Get-WmiObject -Class Win32_UserProfile | Where-Object { -not $_.Special -and $_.Enabled }

foreach ($profile in $userProfiles) {
    $sid = $profile.SID
    Write-Host "Attempting to set theme for SID: $sid"
    # Execute Set-Theme.ps1 for each user SID
    powershell.exe -NoProfile -WindowStyle Hidden -File "$setThemeScript" -Theme $Theme -UserSID $sid
}
