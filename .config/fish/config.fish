set fish_greeting
set -gx PATH /home/tama/.local/bin /home/tama/.dotnet/tools /home/tama/.local/scripts $PATH
set -g theme_nerd_fonts yes
set -g theme_color_scheme light
set -g theme_date_format "+"
alias ghc "stack ghc"
alias ghci "stack ghci"
alias kubectl "minikube kubectl --"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
set EDITOR nvim

alias ls "ls --color --hyperlink=auto"
