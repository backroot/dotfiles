# Created by newuser for 5.5.1

alias sudo='sudo -E '
alias vi='vim'
alias ls='ls --color=auto'
alias ll='ls -al'

autoload -Uz colors
colors

autoload -Uz compinit
compinit

HISTFILE=~/.zsh_histry
HISTSIZE=10000
SAVEHIST=10000

PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[magenta]}%m${reset_color}(%*%) %~
----> %# "
