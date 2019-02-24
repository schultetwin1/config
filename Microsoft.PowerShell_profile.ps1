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

function Reload-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

function Start-VsCmd
{
    Param(
        [ValidateNotNullOrEmpty()]
        [ValidateSet("x64", "x86", "x64_86", "x86_64", "x64_arm", "x86_arm")]
        [string]$Arch = "x64")

    $vsdevcmd = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsDevCmd.bat"
    if (-not (Test-Path -Path $vsdevcmd))
    {
        Write-Error -Message "Unable to find vsdevcmd at $vsdevcmd"
        return;
    }

    $variables = cmd /c " `"$vsdevcmd`" -arch=$Arch -host_arch=amd64 && set "
    if ($lastexitcode -ne 0)
    {
        Write-Error -Message "$vsdevcmd failed to with code $lastexitcode.`n$variables"
        return $lastexitcode
    }

    $variables | ForEach-Object {
        if ($_ -match "^(.*?)=(.*)$")
        {
            Set-Content "env:\$($matches[1])" $matches[2]
        }
    }
}

function Prompt {
    # Print Current Time
    Write-Host("[") -nonewline -foregroundcolor DarkGray
    Write-Host(Get-Date -format HH:mm:ss) -nonewline -foregroundcolor Gray
    Write-Host("] ") -nonewline -foregroundcolor DarkGray
    Write-Host($PWD) -foregroundcolor Green
    Write-Host(">") -nonewline -foregroundcolor Gray
    return " ";
}
