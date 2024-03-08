# Define a list of Registry keys paths to be deleted to resolve the error
$registryKeys = @(
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies",
    "HKCU\Software\Microsoft\WindowsSelfHost",
    "HKCU\Software\Policies",
    "HKLM\Software\Microsoft\Policies",
    "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies",
    "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate",
    "HKLM\Software\Microsoft\WindowsSelfHost",
    "HKLM\Software\Policies",
    "HKLM\Software\WOW6432Node\Microsoft\Policies",
    "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies",
    "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate"
)

# Get the number of CPU cores to determine the parallel processing limit
$parallelLimit = [Environment]::ProcessorCount

# Array to store the results of the registry keys deletion
$results = @()

# Function to remove a specified registry key
function Remove-RegistryKey {
    param (
        [string]$Key
    )

    try {
        $regPath = "Registry::$Key"
        # Check if the registry key exists
        if (Test-Path $regPath) {
            Write-Host "Removing registry key: $Key ..."
            # Start the deletion process as administrator
            Start-Process -FilePath "reg" -ArgumentList "delete `"$Key`" /f" -Verb RunAs -NoNewWindow -Wait
            # Return the result of the operation
            return [pscustomobject]@{
                Key = $Key
                Success = $true
            }
        } else {
            Write-Host "Registry key not found: $Key"
            # Return an object indicating failure
            return [pscustomobject]@{
                Key = $Key
                Success = $false
            }
        }
    } catch {
        Write-Host "Error occurred while removing registry key: $Key - $_"
        # Return an object indicating failure
        return [pscustomobject]@{
            Key = $Key
            Success = $false
        }
    }
}

# Execute the removal of registry keys in parallel
$results = $registryKeys | ForEach-Object -Parallel -ThrottleLimit $parallelLimit {
    # Perform the removal of the registry key and return the result
    Remove-RegistryKey -Key $_
}

# Save the results to a log file
$results | Export-Csv -Path "RegistryCleanupLog.csv" -NoTypeInformation

Write-Host "Registry cleanup operations completed. Results are saved in RegistryCleanupLog.csv"