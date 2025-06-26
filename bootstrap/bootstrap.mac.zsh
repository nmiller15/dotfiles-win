#!/usr/bin/env zsh

DOTFILES="$HOME/Projects/dotfiles"

bootstrap_start=$(gdate +%s%3N)

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

MODE=bootstrap source "$HOME/.zshrc"
tmux source-file "$HOME/.tmux.conf"

bootstrap_end=$(gdate +%s%3N)
elapsed_ms=$(echo "$bootstrap_end - $bootstrap_start" | bc)
elapsed_sec=$(echo "scale=3; $elapsed_ms / 1000" | bc)
echo "Configurations bootstrapped in ${elapsed_sec}s"
