Write-Host "Setting Up Config Files"

$destination = "$HOME/.vimrc"
if ($IsWindows) {
  $destination = "$HOME\_vimrc"
}
Copy-Item -Path $PSScriptRoot\vimrc -Destination $destination

if (-not (Test-Path -Path $PROFILE)) {
    New-Item -Path $PROFILE -ItemType File -Force | Out-Null
}
Copy-Item -Path $PSScriptRoot\Microsoft.PowerShell_profile.ps1 -Destination $PROFILE
. $PROFILE
Write-Host "Done"
