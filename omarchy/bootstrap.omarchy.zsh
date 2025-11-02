#!/usr/bin/env zsh

DOTFILES="$HOME/Projects/dotfiles"
. "$DOTFILES/omarchy/zsh/functions.sh"

bootstrap_start=$(date +%s%3N)

write_conf () {
    local dir=$1
    local out=$2

    echo "Writing $out"
    cat $dir/* > "$out"
    echo "# Conf written on $(date)" >> "$out"
}

write_conf "$DOTFILES/shared/tmux" "$DOTFILES/shared/.tmux.conf"

typeset -A links
links=(
  # "$DOTFILES/omarchy/.zshrc"                    "$HOME/.zshrc" # try the defaults first
  # "$DOTFILES/omarchy/.zprofile"                 "$HOME/.zprofile"
  # "$DOTFILES/omarchy/.zshenv"                   "$HOME/.zshenv"
  "$DOTFILES/omarchy/.bashrc"                   "$HOME/.bashrc" # steal what you want from here
  "$DOTFILES/omarchy/hypr"                      "$HOME/.config" # take all files wholesale
  # "$DOTFILES/omarchy/hypr/bindings.conf"        "$HOME/.config/hypr/bindings.conf"
  # "$DOTFILES/omarchy/hypr/hyprland.conf"        "$HOME/.config/hypr/hyprland.conf"
  # "$DOTFILES/omarchy/hypr/monitors.conf"        "$HOME/.config/hypr/monitors.conf"
  # "$DOTFILES/omarchy/hypr/input.conf"           "$HOME/.config/hypr/input.conf"
  # "$DOTFILES/omarchy/hypr/hypridle.conf"        "$HOME/.config/hypr/hypridle.conf" # "Shouldn't need touching"
  # "$DOTFILES/omarchy/hypr/hyprlock.conf"        "$HOME/.config/hypr/hyprlock.conf" # "symlinked already to the theme"
  "$DOTFILES/omarchy/waybar/config.jsonc"       "$HOME/.config/waybar/config.jsonc"
  # "$DOTFILES/omarchy/waybar/style.css"          "$HOME/.config/waybar/style.css"   # "symlinked already to the theme"
  "$DOTFILES/omarchy/walker/config.toml"        "$HOME/.config/walker/config.toml"
  "$DOTFILES/shared/starship.toml"              "$HOME/.config/starship.toml"
  "$DOTFILES/shared/alacritty.toml"             "$HOME/.config/alacritty/alacritty.toml"
  # "$DOTFILES/shared/.tmux.conf"                 "$HOME/.tmux.conf"
  # "$DOTFILES/shared/nvim"                       "$HOME/.config"
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

bootstrap_end=$(date +%s%3N)
elapsed_sec=$((bootstrap_end - bootstrap_start))   # integer ms
echo "Configurations bootstrapped in $((elapsed_ms / 1000.0))s"
