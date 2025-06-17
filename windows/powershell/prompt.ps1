function prompt {
	$git = ""
		if (Test-Path .git) {
			$branch = git rev-parse --abbrev-ref HEAD 2>$null
				if ($branch) {
					$git = " (git:$branch)"
				}
		}

	Write-Host "$env:USERNAME@$env:COMPUTERNAME " -ForegroundColor Blue -NoNewline
	Write-Host "$PWD" -ForegroundColor Magenta -NoNewline
	if ($git) {
		Write-Host $git -ForegroundColor Cyan -NoNewline
	}
	Write-Host " &" -ForegroundColor Gray -NoNewline
	return " " 
}
