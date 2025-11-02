DOTFILES="$HOME/Projects/dotfiles"

# History settings
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Profile options
set -o vi # vim keybindings

for DIR in "$DOTFILES/omarchy/zsh" "$DOTFILES/shared/zsh"; do
    for FILE in "$DIR"/*.sh; do
        [ -r "$FILE" ] || continue

        if [[ "$MODE" == "bootstrap" ]]; then
            start=$(date +%s%3N)
        fi

        source "$FILE"

        if [[ "$MODE" == "bootstrap" ]]; then
            end=$(date +%s%3N)
            elapsed_ms=$((end - start))
            echo "$(basename "$FILE") sourced in ${elapsed_ms}ms"
        fi
    done
done

fpath+=($HOME/Projects/dotfiles/omarchy/bin)

# Removed because it takes too long to load
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
