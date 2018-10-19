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

# Terminal prompt customize
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[magenta]}%m${reset_color}(%*%) %~
----> %# "

# Add path for dmenu
# Microsoft Visual Studio Code on ArchLinux
VSCODE=/opt/visual-studio-code
if [[ -e $VSCODE ]]; then
    PATH=$PATH:$VSCODE
fi
