$DOTFILES = "c:\Code\dotfiles\windows"

# Loop through all subdirectories and source all .ps1 files in them
Get-ChildItem -Path $DOTFILES -Directory | ForEach-Object {
    Get-ChildItem -Path $_.FullName -Filter '*.ps1' | Sort-Object Name | ForEach-Object {
        . $_.FullName
    }
}
