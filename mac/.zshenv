# uv
export PATH="/Users/nolanmiller/.local/bin:$PATH"
export PATH="$HOME/Projects/dotfiles/mac/bin:$PATH"

function yabai_launch() {
    echo "yabai_launch"
    local space="$1"
    local appName="$2"

    yabai -m space --focus $space
    open -a $appName
}
