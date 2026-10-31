param(
    [switch]$ApplyChanges
)

# Set the project folders and the age limit.
$sourceFolder = Join-Path $PSScriptRoot "SampleFiles"
$archiveFolder = Join-Path $PSScriptRoot "Archive"
$cutoffDate = (Get-Date).AddDays(-7)

Write-Host "Checking files older than 7 days..."
Write-Host "Cutoff date: $cutoffDate"

# Find files whose LastWriteTime is earlier than the cutoff date.
$filesToArchive = Get-ChildItem -Path $sourceFolder -File |
    Where-Object { $_.LastWriteTime -lt $cutoffDate }

if ($filesToArchive.Count -eq 0) {
    Write-Host "No files older than 7 days were found."
    return
}

# Create the Archive folder if it does not exist.
if (-not (Test-Path -Path $archiveFolder)) {
    New-Item -Path $archiveFolder -ItemType Directory | Out-Null
}

# Preview by default. Use -ApplyChanges to perform the copy.
foreach ($file in $filesToArchive) {
    if ($ApplyChanges) {
        Copy-Item -Path $file.FullName -Destination $archiveFolder
        Write-Host "Copied: $($file.Name)"
    }
    else {
        Copy-Item -Path $file.FullName -Destination $archiveFolder -WhatIf
    }
}

if (-not $ApplyChanges) {
    Write-Host "Preview only. Run with -ApplyChanges to copy the files."
}
