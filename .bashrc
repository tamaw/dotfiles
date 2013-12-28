# Author: Tama Waddell
# Date: Fri Nov 26 

# Check for an interactive session
[ -z "$PS1" ] && return


#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;32m\]\u \[\e[1;34m\]\w \[\e[1;32m\]\$ \[\e[1;37m\] '
#PS1='\[\e[0;33m\][\u\[\e[0;35m\]@\[\e[0;33m\]\h] \[\e[0;33m\][\[\e[0;35m\]\W\[\e[0;33m\]] \[\e[0;00m\] '

# Shell Variables
export LANG=en_AU.UTF-8
export EDITOR=vim
export GREP_COLOR="1;33"
export _JAVA_AWT_WM_NONREPARENTING=1


# Tab completion for sudo
complete -cf sudo

# Functions
function futurama() { curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2; }
function commit() { curl -s http://whatthecommit.com/ | grep '\<p>' | cut -d'>' -f2 | cut -d'<' -f2; }

# Extract Function
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)    tar xjf $1    ;;
            *.tar.gz)    tar xzf $1    ;;
            *.bz2)        bunzip2 $1    ;;
            *.gz)        gunzip $1    ;;
            *.rar)        unrar e $1    ;;
            *.tar)        tar xf $1    ;;
            *.tbz2)        tar xjf $1    ;;
            *.tgz)        tar xzf $1    ;;
            *.zip)        unzip $1    ;;
            *.7z)        7z x $1        ;;
            *.Z)        uncompress $1   ;;
            *)        echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Aliases
alias mkdir="mkdir -p -v"
alias df='df -h'
alias du='du -c -h'
alias ping='ping -c 5'
alias ..='cd ..'
alias mysql="mysql -p "

alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias pg='ps -Af | grep $1'         # requires an argument

# Colours
export GREP_COLOR="1;33"
alias grep='grep --color=auto'
alias ls='ls -hF --color=always'
eval $(dircolors -b)
alias diff='colordiff'

# Awesome Wm
alias theme="vim ~/.config/awesome/themes/theme.lua"
alias config="vim ~/.config/awesome/rc.lua"

# ls shortcuts
alias ls='ls -hF --color=always'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety first
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

