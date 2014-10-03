#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# OS-specific things
if [[ "$OSTYPE" =~ ^darwin.*$ ]]; then
    PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
else
    alias less='less -R' # preserves colors in `less`
fi

# Aliases
alias ls='ls -F --color=auto'

# Environment
PS1='[\u@\h: \w]\$ '
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less
# sequence to set the terminal title to "user@hostname: pwd"
TITLEBAR='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
# ignore commands starting with space and duplicates
HISTCONTROL=ignoreboth
# ignore common commands in bash history
HISTIGNORE='ls:bg:fg:history'
PROMPT_COMMAND="$TITLEBAR"

# If a private bin directory exists, add it to PATH
[[ -d ~/bin ]] && PATH="$PATH:~/bin"

# solarized dircolors (needs coreutils from homebrew on Mac OS X)
[[ -r ~/.dircolors.ansi-dark ]] && eval `dircolors ~/.dircolors.ansi-dark`

# Settings
# Don't exit when accidentally pressing ^D
set -o ignoreeof

# Append, rather than overwrite history files
# Useful for when multiple bash sessions are running
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
