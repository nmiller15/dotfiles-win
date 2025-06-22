print 'Setting up aliases...'

alias ll='ls -lah'
alias vim='nvim'

# Nav
alias pd='cd ~/Projects/'
alias ud='cd ~'
alias nc='cd ~/.config/nvim'

# git
alias gs='git status'
alias gp='git pull'
alias gc='git commit -m'
alias ga='git add .'

# util
alias reload="source ~/.zshrc" # Change this to bootstrap once set up and change to src
alias pushblog="/Users/nolanmiller/Projects/log-nolan/scripts/pushblog.sh" # Add this to the path
alias server='ssh -i ~/.ssh/tryagain.pem ubuntu@3.15.29.106'
