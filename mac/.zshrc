DOTFILES="$HOME/Projects/dotfiles"

# History settings
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Profile options
set -o vi # vim keybindings

for FILE in $DOTFILES/mac/shell/*.sh; do
    if [[ "$1" == "bootstrap" ]]; then
        start=$(date +%s%3)
    fi
    [ -r $FILE ] && source "$FILE"
    if [[ "$1" == "bootstrap" ]]; then
        end=$(date +%s%3)
        elapsed=$(($end - $start))
        echo "${FILE:t} sourced in ${elapsed}ms"
    fi
done

