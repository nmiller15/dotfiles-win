if [[ -z "$TMUX" ]]; then
	tmux attach || tmux new-session
fi
