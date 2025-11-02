alias mac_path='~/Projects/dotfiles/mac/zsh/path.sh'
# print "Configuring PATH..."

# Set PATH properly
export PATH="$HOME/bin:$PATH"

export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/.lmstudio/bin:$PATH"
export PATH="/usr/local/opt/postgresql@17/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/Projects/dotfiles/shared/bin:$PATH"
