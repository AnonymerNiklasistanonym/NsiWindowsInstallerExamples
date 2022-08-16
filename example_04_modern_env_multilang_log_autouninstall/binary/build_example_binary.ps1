#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"

# Install the following things first:
# - clang

# Get the current directory
$CallDir = $pwd
# Go to the location of this directory even if the script is being run from
# somewhere else
Set-Location $PSScriptRoot

clang++ "main.cpp" -o example.exe

# Go back to the call directory
Set-Location $CallDir

# Wait for any input before closing the window
Write-Host "`n>> The script has finished. Press any key to close the window."
[Console]::ReadKey()
