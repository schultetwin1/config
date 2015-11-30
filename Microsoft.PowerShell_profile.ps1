function Prompt {
    # Print Current Time
    Write-Host("[") -nonewline -foregroundcolor DarkGray
    Write-Host(Get-Date -format HH:mm:ss) -nonewline -foregroundcolor Gray
    Write-Host("] ") -nonewline -foregroundcolor DarkGray
    Write-Host($PWD) -foregroundcolor Green
    Write-Host(">") -nonewline -foregroundcolor Gray
    return " ";
}
