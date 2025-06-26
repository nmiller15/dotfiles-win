#!/usr/bin/env zsh

DOTFILES="$HOME/Projects/dotfiles"

start=$(date +%s)

write_conf () {
    local dir=$1
    local out=$2

    echo "Writing $out"
    cat $dir/* > "$out"
    echo "# Conf written on $(gdate)" >> "$out"
}

write_conf "$DOTFILES/mac/tmux" "$DOTFILES/mac/.tmux.conf"

typeset -A links
links=(
  "$HOME/.zshrc" "$DOTFILES/mac/.zshrc"
  "$HOME/.zprofile" "$DOTFILES/mac/.zprofile"
  "$HOME/.zshenv" "$DOTFILES/mac/.zshenv"
  "$HOME/.tmux.conf" "$DOTFILES/mac/.tmux.conf"
  "$HOME/.config/nvim" "$DOTFILES/shared/nvim"
)

for link in "${(@k)links}"; do
  source="${links[$link]}"
  backup="$link.backup"

  if [[ -e "$link" && ! -e "$backup" ]]; then
    mv -f "$link" "$backup"
    echo "Backed up: $backup"
  fi

  parent_dir="${link:h}"
  mkdir -p "$parent_dir"

  ln -sf "$source" "$link"
  echo "Linked: $link"
done

source "$HOME/.zshrc" bootstrap
tmux source-file "$HOME/.tmux.conf"

end=$(date +%s)
elapsed=$((end - start))
echo "Configurations bootstrapped in ${elapsed}ms"
