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

# Replace caps lock key to left control key
#XMODMAP=~/.Xmodmap
#if [[ -e $XMODMAP  ]]; then
#    xmodmap ~/.Xmodmap
#fi

# Add path for dmenu
# Microsoft Visual Studio Code on ArchLinux
VSCODE=/opt/visual-studio-code
if [[ -e $VSCODE ]]; then
    PATH=$PATH:$VSCODE
fi

## Show git info

# Read vcs_info
autoload -Uz vcs_info

## vcs_info_msg_0_変数をどのように表示するかフォーマットの指定
# デフォルトのフォーマット
#  %s: どのバージョン管理システムを使っているか（git, svnなど）
#  %b: ブランチ名
zstyle ':vcs_info:*' formats '(%s)[%b]'

# 特別な状態（mergeでコンフリクトしたときなど）でのフォーマット
#  %a: アクション名（merge, rebaseなど）
zstyle ':vcs_info:*' actionformats '(%s)[%b|%a]'

# プロンプトが表示される毎にバージョン管理システムの情報を取得
#  precmd: プロンプトが表示される毎に実行される関数
#  vcs_info: バージョン管理システムから情報を取得
precmd () { vcs_info }

# 右プロンプトに表示
#  prompt_subst: プロンプトを表示する際に変数を展開するオプション
setopt prompt_subst

# vcs_info_msg_0_: バージョン管理システムの情報
#  RPROMPT: 右プロンプトに情報を表示するときの環境変数
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
