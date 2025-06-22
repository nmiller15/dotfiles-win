print "Customizing ZSH prompt..."

setopt prompt_subst

BLUE="%F{magenta}"
CYAN="%F{cyan}"
GREEN="%F{green}"
DARKGRAY="%F{240}"   # 240 is a dark-gray ANSI 256 code
RESET="%f"

parse_git_branch() {
  local branch
  branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null)
  [[ -n $branch ]] && echo " ($branch)"
}

PROMPT="${BLUE}%n@%m ${CYAN}%~${GREEN}\$(parse_git_branch) ${DARKGRAY}& ${RESET}"
