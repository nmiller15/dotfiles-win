$dotfiles = "C:\Code\dotfiles"
$sw = [System.Diagnostics.Stopwatch]::StartNew()

$links = @(
    @{ source = "$dotfiles\windows\PowerShell_profile.ps1"; link = $PROFILE },
    @{ source = "$dotfiles\windows\_vimrc"; link = "$HOME\_vimrc" }
    @{ source = "$dotfiles\shared\nvim"; link = "$HOME\AppData\Local\nvim" }
    @{ source = "$dotfiles\windows\komorebi-bar.json"; link = "$HOME\komorebi-bar.json" }
    @{ source = "$dotfiles\windows\komorebi.ahk"; link = "$HOME\OneDrive - CAB\Documents\AutoHotkey\komorebi.ahk" }
    @{ source = "$dotfiles\windows\komorebi.json"; link = "$HOME\komorebi.json" }
    @{ source = "$dotfiles\windows\whkdrc"; link = "$HOME\.config\whkdrc" }
)

Write-Host "Linking config files..."
foreach ($entry in $links) {
    $source = $entry.source
    $link = $entry.link
    $backup = "$link.backup"


    if (!(Test-Path $backup)) {
        Rename-Item -Path $link -NewName $backup -Force
        Write-Host "Backed up: $backup"
    } 
    # Ensure parent directory exists
    $parent = Split-Path $link

    if (!(Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    # Create the symlink
    if (Test-Path $source -PathType Container) {
        robocopy $source $link /E /NDL /NS /NJH /NJS /NC /R:3 /W:5
        Write-Host "Copied: $link"
    } else {
        New-Item -ItemType SymbolicLink -Path $link -Target $source -Force | Out-Null
        Write-Host "Linked: $link"
    }
}

Write-Host "Installing tools..."
try {
    & "$DOTFILES\windows\bin\tools.ps1"
    Write-Host "Tools installed successfully."
} catch {
    Write-Host "Failed to install tools: $_"
}

Write-Host "Sourcing config files..."
$env:BOOTSTRAP = "true";
. $PROFILE

Write-Host "Reloading services..."
# komorebic stop --whkd --bar
# komorebic start --whkd --bar
komorebic stop
komorebic start
& "$HOME\OneDrive - CAB\Documents\AutoHotkey\komorebi.ahk"

Remove-Item Env:BOOTSTRAP

$elapsed = "{0:N3}s" -f $sw.Elapsed.TotalSeconds
Write-Host "Config bootstrapped in $elapsed"
