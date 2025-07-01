$DOTFILES = "c:\Code\dotfiles\windows\powershell"

Get-ChildItem -Path $DOTFILES -Filter '*.ps1' | Sort-Object Name | ForEach-Object {
    $ps1_sw = [System.Diagnostics.Stopwatch]::StartNew()
    . $_.FullName
    $elapsed = "{0:N3}s" -f $ps1_sw.Elapsed.TotalSeconds
    
    if ($env:BOOTSTRAP) {
        Write-Host "Sourced $_ in $elapsed"
    }
}


