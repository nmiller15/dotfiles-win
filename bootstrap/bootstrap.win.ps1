$dotfiles = "C:\Code\dotfiles"

$links = @(
    @{ source = "$dotfiles\windows\PowerShell_profile.ps1"; link = $PROFILE },
    @{ source = "$dotfiles\windows\_vimrc"; link = "$HOME\_vimrc" }
)

foreach ($entry in $links) {
    $source = $entry.source
    $link = $entry.link
    $backup = "$link.backup"

    if (Test-Path $link) {
        if (!(Test-Path $backup)) {
            Rename-Item -Path $link -NewName $backup -Force
            Write-Host "Backed up: $backup"
        } 
    }

    # Ensure parent directory exists
    $parent = Split-Path $link
    if (!(Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    # Create the symlink
    New-Item -ItemType SymbolicLink -Path $link -Target $source -Force | Out-Null
    Write-Host "Linked: $link"
}

# Reload your profile if linked
if ($PROFILE -eq $links[0].link) {
    . $PROFILE
}
