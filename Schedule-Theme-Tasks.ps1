
# Schedule-Theme-Tasks.ps1
# This script creates scheduled tasks to automatically switch between light and dark mode for all users.

$scriptPath = "c:\Users\rrrai\OneDrive\Documents\windows auto light and dark mode\Set-Theme-ForAllUsers.ps1"

# Schedule Light Mode at 7 AM
$lightTrigger = New-ScheduledTaskTrigger -Daily -At "7:00 AM"
$lightAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -File `"$scriptPath`" -Theme Light"
Register-ScheduledTask -TaskName "Auto Light Mode All Users" -Trigger $lightTrigger -Action $lightAction -Description "Automatically sets Windows to light mode for all users." -Force -RunLevel Highest

# Schedule Dark Mode at 7 PM
$darkTrigger = New-ScheduledTaskTrigger -Daily -At "7:00 PM"
$darkAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -File `"$scriptPath`" -Theme Dark"
Register-ScheduledTask -TaskName "Auto Dark Mode All Users" -Trigger $darkTrigger -Action $darkAction -Description "Automatically sets Windows to dark mode for all users." -Force -RunLevel Highest

Write-Host "Scheduled tasks for auto light/dark mode for all users created successfully."
