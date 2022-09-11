#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"

# Install the following things first:
# - NSIS

# Display makensis version
Write-Host "makensis:"
$makensisWasFound = [bool] (Get-Command -ErrorAction Ignore -Type Application makensis)
if ($makensisWasFound) {
    makensis -VERSION
    Write-Host ""
} else {
    throw "WARNING: makensis was not found, Windows installer can not be created"
}

# Get the current directory
$CallDir = $pwd
# Go to the location of this directory even if the script is being run from
# somewhere else
Set-Location $PSScriptRoot

# Create the windows installer
makensis windows_installer.nsi

# Go back to the call directory
Set-Location $CallDir

# Wait for any input before closing the window
Write-Host "`n>> The script has finished. Press any key to close the window."
[Console]::ReadKey()
