#!/usr/bin/bash

DOTFILES="$HOME/Projects/dotfiles"
# . "$DOTFILES/omarchy/zsh/functions.sh"

bootstrap_start=$(date +%s%3N)

write_conf () {
    local dir=$1
    local out=$2

    echo "Writing $out"
    cat $dir/* > "$out"
    echo "# Conf written on $(date)" >> "$out"
}

write_conf "$DOTFILES/shared/tmux" "$DOTFILES/omarchy/.tmux.conf"

typeset -A links
links=(
  # "$DOTFILES/omarchy/.zshrc"                    "$HOME/.zshrc" # try the defaults first
  # "$DOTFILES/omarchy/.zprofile"                 "$HOME/.zprofile"
  # "$DOTFILES/omarchy/.zshenv"                   "$HOME/.zshenv"
  # "$DOTFILES/omarchy/.bashrc"                   "$HOME/.bashrc" # steal what you want from here
  # "$DOTFILES/omarchy/hypr"                      "$HOME/.config" # take all files wholesale
  "$DOTFILES/omarchy/hypr/bindings.conf"        "$HOME/.config/hypr/bindings.conf"
  "$DOTFILES/omarchy/hypr/hyprland.conf"        "$HOME/.config/hypr/hyprland.conf"
  "$DOTFILES/omarchy/hypr/monitors.conf"        "$HOME/.config/hypr/monitors.conf"
  "$DOTFILES/omarchy/hypr/input.conf"           "$HOME/.config/hypr/input.conf"
  # "$DOTFILES/omarchy/hypr/hypridle.conf"        "$HOME/.config/hypr/hypridle.conf" # "Shouldn't need touching"
  # "$DOTFILES/omarchy/hypr/hyprlock.conf"        "$HOME/.config/hypr/hyprlock.conf" # "symlinked already to the theme"
  "$DOTFILES/omarchy/waybar/config.jsonc"       "$HOME/.config/waybar/config.jsonc"
  # "$DOTFILES/omarchy/waybar/style.css"          "$HOME/.config/waybar/style.css"   # "symlinked already to the theme"
  "$DOTFILES/omarchy/walker/config.toml"        "$HOME/.config/walker/config.toml"
  "$DOTFILES/omarchy/.tmux.conf"                 "$HOME/.tmux.conf"
  "$DOTFILES/shared/starship.toml"              "$HOME/.config/starship.toml"
  "$DOTFILES/shared/alacritty.toml"             "$HOME/.config/alacritty/alacritty.toml"
  "$DOTFILES/shared/nvim"                       "$HOME/.config/nvim"
)

for source in "${!links[@]}"; do
  link="${links[$source]}"
  backup="${link}.backup"

  # 🧩 If something already exists at the link location (file or directory)
  if [[ -e "$link" && ! -L "$link" ]]; then
    if [[ ! -e "$backup" ]]; then
      mv -f "$link" "$backup"
      echo "Backed up existing path: $link → $backup"
    else
      echo "Backup already exists: $backup (skipping rename)"
    fi
  fi

  # 🪣 Ensure the parent directory exists
  parent_dir="$(dirname "$link")"
  mkdir -p "$parent_dir"

  # 🪄 Create or update the symlink
  ln -sfn "$source" "$link"

  # 📢 Log what happened
  if [[ -d "$source" ]]; then
    echo "Linked directory $(basename "$source") → $link"
  else
    echo "Linked file $(basename "$source") → $link"
  fi
done

echo "Sourcing configuration files..."
# source "$HOME/.zshenv"
# MODE=bootstrap source "$HOME/.zshrc"
# tmux source-file "$HOME/.tmux.conf"

echo "Restarting services..."

bootstrap_end=$(date +%s%3N)
elapsed_ms=$((bootstrap_end - bootstrap_start))   # integer milliseconds
elapsed_sec=$(awk "BEGIN {printf \"%.3f\", $elapsed_ms / 1000}")

echo "Configurations bootstrapped in ${elapsed_sec}s"
