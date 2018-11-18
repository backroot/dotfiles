#!/usr/bin/bash

# 表示したい項目と実際に実行するコマンドを連想配列として定義する。
declare -A list=(
  ['Lock']='dm-tool lock'
  ['Logout']='i3-msg exit'
  ['Poweroff']='systemctl poweroff'
  ['Reboot']='systemctl reboot'
)

# $1がnot zeroなら$1に入っているコマンドを実行する。
# $1がzeroなら連想配列のkeyを表示する。
[[ -n $1 ]] && eval ${list[$1]} || echo ${!list[@]} | sed 's/ /\n/g'
