# Add alias for which
Set-Alias -Name which -Value Get-Command

function Set-LastAccessTimestamp
{
    Param([Parameter(Mandatory=$true)][string]$file)

    Write-Output $null >> $file
}

Set-Alias touch Set-LastAccessTimestamp

function Get-GitDir
{
    Param([string]$pathStr = '.')
    $path = Resolve-Path -Path $pathStr
    $gitDir = Join-Path -Path $path -ChildPath ".git"

    if (Test-Path -Path $gitDir)
    {
        return $gitDir
    }

    $parentDir = Split-Path -Parent $path

    if (-Not $parentDir)
    {
        return $null;
    }

    return Get-GitDir $parentDir
}

function Add-ToPath
{
    Param([string]$Path)
    $Path = Resolve-Path -Path $Path

    $split = ":"
    if ($IsWindows)
    {
        $split = ";"
    }

    $paths = $ENV:PATH -split $split | Where-Object { $_ }
    if (-not ($paths -contains $Path))
    {
        $paths += $Path
    }

    $ENV:PATH = $paths -join $split
}

if ($IsMacOS)
{
    Add-ToPath -Path "/usr/local/bin"
}

function Prompt {
    $realLASTEXITCODE = $LASTEXITCODE;

    [Console]::ResetColor();

    Write-Host $($(Get-Location) -replace ($env:HOME), "~") -NoNewline -ForegroundColor Green

    Write-Host ""
    $global:LASTEXITCODE = $realLASTEXITCODE;
    return "> ";
}
