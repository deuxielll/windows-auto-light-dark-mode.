# Windows Auto Light/Dark Mode

A set of PowerShell scripts and Task Scheduler XML files to automatically switch Windows 11 between light and dark mode based on time, for all users.

## Features

*   **Automatic Theme Switching:** Seamlessly transitions between light and dark mode.
*   **Time-Based Scheduling:** Configured to switch at specific times (default: Light at 7 AM, Dark at 7 PM).
*   **Applies to All Users:** Ensures all user profiles on the system experience the theme change.
*   **Easy Setup:** Can be set up via a PowerShell script or by importing XML files directly into Task Scheduler.

## Files

*   `Set-Theme.ps1`: The core PowerShell script that modifies the Windows registry to change the theme for a specified user SID or the current user.
*   `Set-Theme-ForAllUsers.ps1`: A PowerShell script that iterates through all active user profiles and calls `Set-Theme.ps1` for each user to apply the theme system-wide.
*   `Schedule-Theme-Tasks.ps1`: A PowerShell script to automatically create the necessary scheduled tasks in Windows Task Scheduler.
*   `AutoLightModeAllUsers.xml`: An XML file that defines the scheduled task for switching to light mode at 7:00 AM. This can be directly imported into Task Scheduler.
*   `AutoDarkModeAllUsers.xml`: An XML file that defines the scheduled task for switching to dark mode at 7:00 PM. This can be directly imported into Task Scheduler.

## Setup Instructions

YouYou can set up the automatic theme switching using one of two methods:

### Method 1: Using the PowerShell Script (Recommended)

This method uses the `Schedule-Theme-Tasks.ps1` script to automatically create and register the scheduled tasks.

1.  **Download the scripts:** Clone this repository or download all the `.ps1` and `.xml` files into a directory on your Windows machine (e.g., `C:\WindowsAutoTheme`).

2.  **Open PowerShell as Administrator:**
    *   Click the Start button.
    *   Type "PowerShell".
    *   Right-click on "Windows PowerShell" (or "PowerShell" if you have PowerShell Core installed).
    *   Select "Run as administrator".

3.  **Navigate to the script directory:** In the administrator PowerShell window, change to the directory where you saved the scripts:
    ```powershell
    cd "C:\Users\%username%\Documents\windows auto light and dark mode" # Adjust this path to where you saved the files
    ```

4.  **Run the scheduling script:** Execute the script to create the scheduled tasks:
    ```powershell
    .\Schedule-Theme-Tasks.ps1
    ```

    You should see a confirmation message indicating that the tasks were created successfully.

### Method 2: Importing XML Files into Task Scheduler

This method allows you to manually import the scheduled tasks using the provided XML files.

1.  **Download the scripts:** Clone this repository or download all the `.ps1` and `.xml` files into a directory on your Windows machine (e.g., `C:\WindowsAutoTheme`).

2.  **Open Task Scheduler:**
    *   Press `Win + R` to open the Run dialog.
    *   Type `taskschd.msc` and press Enter.

3.  **Import the Light Mode Task:**
    *   In the "Actions" pane on the right, click "Import Task...".
    *   Navigate to the directory where you saved the files (e.g., `C:\Users\%username%\Documents\windows auto light and dark mode`).
    *   Select `AutoLightModeAllUsers.xml` and click "Open".
    *   Review the task settings in the dialog that appears and click "OK".

4.  **Import the Dark Mode Task:**
    *   Repeat step 3, but this time select `AutoDarkModeAllUsers.xml`.

    The tasks will now be listed in the Task Scheduler Library.

## Customization

### Changing Scheduled Times

*   **Using `Schedule-Theme-Tasks.ps1`:** Open `Schedule-Theme-Tasks.ps1` in a text editor and modify the `-At` parameter for `$lightTrigger` and `$darkTrigger` variables to your desired times.
*   **Using XML Files:** Open `AutoLightModeAllUsers.xml` or `AutoDarkModeAllUsers.xml` in a text editor. Locate the `<StartBoundary>` tag within the `<CalendarTrigger>` section and change the time (e.g., `T07:00:00` for 7 AM).

### Changing Theme Logic

If you wish to modify how themes are applied (e.g., based on sunrise/sunset), you would need to edit the `Set-Theme.ps1` and `Set-Theme-ForAllUsers.ps1` scripts accordingly.

## Troubleshooting

*   **Tasks not running:** Ensure that the scheduled tasks are enabled in Task Scheduler and that the paths to the PowerShell scripts are correct.
*   **Theme not changing:** Verify that PowerShell is allowed to execute scripts (you might need to set the execution policy: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`). Also, check the Task Scheduler history for any errors.
*   **Permissions:** The tasks are set to run with `Highest` privileges. If you encounter permission issues, ensure your user account has administrative rights.

## License

This project is licensed under the MIT License - see the LICENSE file for details (if you choose to add one).
