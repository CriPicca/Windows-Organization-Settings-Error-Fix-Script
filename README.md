# Windows Organization Settings Error Fix Script

This PowerShell script automates the process of resolving the "Some of these settings are managed by your organization" error in Windows 11 and Windows 10. The error often occurs due to the usage of school or work email accounts or specific application installations.

## Description

The script targets and removes problematic registry keys that cause the "Some of these settings are managed by your organization" error, allowing users to change settings without hindrance.

## Usage

1. **Download:** Obtain the "WindowsOrganizationSettingsErrorFix.ps1" script from this repository.
2. **Run as Administrator:** Right-click on the "WindowsOrganizationSettingsErrorFix.ps1" file and select "Run as administrator". Administrator privileges are necessary to modify the registry.
3. **Follow Instructions:** Execute the script and follow the instructions provided to complete the process.
4. **View Output:** The script will display messages indicating the success or failure of the registry key removal.

## Requirements

- Windows 10 or 11 64-bit operating systems. Compatibility with 32-bit versions of Windows 10 and 11 is not guaranteed.
- PowerShell 7.0 or later.
- Administrator privileges to modify the registry.

## Tested Environments

- Windows 10 Pro 64-bit
- Windows 11 Pro 64-bit

While tested on the above environments, the script may work on other versions of Windows, but this is not guaranteed.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/CriPicca/Windows-Organization-Settings-Error-Fix-Script/blob/main/LICENSE) file for details.

## Disclaimer

Modifying the Windows registry carries inherent risks. Use this script at your own discretion and ensure you have backed up your registry beforehand.

## Contributions

Contributions are welcome! If you encounter issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## Author

- Cristian Piccardo - [GitHub Profile](https://github.com/CriPicca)
