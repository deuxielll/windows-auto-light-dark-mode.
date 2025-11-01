
# Set-Theme.ps1
# This script sets the Windows 11 theme to light or dark mode.

param (
    [Parameter(Mandatory=$true)]
    [ValidateSet('Light', 'Dark')]
    [string]$Theme,

    [string]$UserSID # Optional: Specify a User SID to set theme for a specific user
)

if (-not [string]::IsNullOrEmpty($UserSID)) {
    $regPath = "Registry::HKEY_USERS\$UserSID\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
} else {
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
}

if ($Theme -eq 'Light') {
    $lightModeValue = 1
} else {
    $lightModeValue = 0
}

try {
    Set-ItemProperty -LiteralPath $regPath -Name "AppsUseLightTheme" -Value $lightModeValue -Force
    Set-ItemProperty -LiteralPath $regPath -Name "SystemUsesLightTheme" -Value $lightModeValue -Force
    Write-Host "Windows theme set to $Theme mode for $($UserSID -replace '^S-1-5-21-\d+-\d+-\d+-\d+$', 'User')."
} catch {
    Write-Error "Failed to set Windows theme for $($UserSID -replace '^S-1-5-21-\d+-\d+-\d+-\d+$', 'User'): $($_.Exception.Message)"
}
