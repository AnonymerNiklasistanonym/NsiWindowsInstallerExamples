#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"

# Install the following things first:
# - NSIS

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Write-Warning "Start-Process powershell -verb RunAs -ArgumentList `"$PSScriptRoot\install_nsis_plugin.ps1`""
    Break
}

# Display node/npm/makensis version
Write-Host "makensis:"
$makensisWasFound = [bool] (Get-Command -Type Application makensis)
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

# Download the plugin
$EnVarPluginUrl = "https://nsis.sourceforge.io/mediawiki/images/7/7f/EnVar_plugin.zip"
$EnVarPluginArchive = Join-Path $PSScriptRoot "EnVar.zip"
$NsisDir = Join-Path "${env:ProgramFiles(x86)}" "NSIS"
Invoke-WebRequest -Uri $EnVarPluginUrl -OutFile $EnVarPluginArchive
Write-Host "`n>> Downloaded EnVar plugin to $EnvarPluginArchive"

# Install the plugin
Expand-Archive $EnvarPluginArchive -DestinationPath $NsisDir -Force
Get-ChildItem (Join-Path $NsisDir "Plugins")
Write-Host "`n>> Extract EnVar plugin to $NsisDir"
Get-ChildItem (Join-Path $NsisDir "Plugins")

# Go back to the call directory
Set-Location $CallDir

# Wait for any input before closing the window
Write-Host "`n>> The script has finished. Press any key to close the window."
[Console]::ReadKey()
