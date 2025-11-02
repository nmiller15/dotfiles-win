#!/usr/bin/env zsh

DOTFILES="$HOME/Projects/dotfiles"
. "$DOTFILES/omarchy/zsh/functions.sh"

bootstrap_start=$(gdate +%s%3N)

write_conf () {
    local dir=$1
    local out=$2

    echo "Writing $out"
    cat $dir/* > "$out"
    echo "# Conf written on $(gdate)" >> "$out"
}

write_conf "$DOTFILES/shared/tmux" "$DOTFILES/shared/.tmux.conf"

typeset -A links
links=(
  "$DOTFILES/omarchy/.zshrc" "$HOME/.zshrc"
  "$DOTFILES/omarchy/.zprofile" "$HOME/.zprofile"
  "$DOTFILES/omarchy/.zshenv" "$HOME/.zshenv"
  "$DOTFILES/shared/.tmux.conf" "$HOME/.tmux.conf"
  "$DOTFILES/shared/nvim" "$HOME/.config"
)

for source in "${(@k)links}"; do
  link="${links[$source]}"
  backup="$link.backup"

  if [[ -e "$link" && ! -e "$backup" ]]; then
      if [[ ! -d "$link" ]]; then
        mv -f "$link" "$backup"
        echo "Backed up: $backup"
      fi
  fi

  if [[ -d "$source" && ! -e "$link" ]]; then
      mkdir -p "$link"
  else
      parent_dir="${link:h}"
      mkdir -p "$parent_dir"
  fi 

  ln -sf "$source" "$link"
  
  if [[ -d "$source" ]]; then
      echo "Linked ${source:t} directory to $link"
  else
      echo "Linked ${source:t} to $link"
  fi
done

echo "Sourcing configuration files..."
source "$HOME/.zshenv"
MODE=bootstrap source "$HOME/.zshrc"
tmux source-file "$HOME/.tmux.conf"

echo "Restarting services..."

bootstrap_end=$(gdate +%s%3N)
elapsed_ms=$(echo "$bootstrap_end - $bootstrap_start" | bc)
elapsed_sec=$(echo "scale=3; $elapsed_ms / 1000" | bc)
echo "Configurations bootstrapped in ${elapsed_sec}s"
