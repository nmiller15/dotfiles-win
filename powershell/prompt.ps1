function prompt {
    $git = ""
    if (Test-Path .git) {
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        if ($branch) {
            $git = " (git:$branch)"
        }
    }

    Write-Host "$env:USERNAME@$env:COMPUTERNAME " -ForegroundColor Red -NoNewline   # amber/orange accent
    Write-Host "$PWD" -ForegroundColor DarkYellow -NoNewline                              # warm beige
    if ($git) {
        Write-Host $git -ForegroundColor Yellow -NoNewline                                   # brownish tone
    }
    Write-Host ""
    Write-Host "&" -ForegroundColor DarkGray -NoNewline                                    # neutral low-contrast
    return " "
}
