"------------------------------
" 基本設定
"------------------------------

" 文字コード
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" 行番号を表示
set nu
" カーソルの行、列位置を表示
set ruler

set list
set listchars=tab:>-,extends:<

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" スマートインデントなし
set nosmartindent

" 自動インデントに使われる空白の数 
set shiftwidth=4

" タブの空白文字数
set tabstop=4

" タブをを入力した時、空白文字に置換
set expandtab

" スワップファイルを作成しない
set noswapfile

" バックアップファイルを作成する
set backup
set backupdir=~/.vim/tmp

" バックスペースでオートインデントの空白及び前の行の空白を削除可能にする
set backspace=indent,eol,start

" 改行コードをLFに設定する
autocmd BufNewFile * set fileformat=unix
" .elファイルをhtmlファイルとして認識する
autocmd BufNewFile,BufRead *.ep set filetype=html
" .ctp ファイルをphpファイルとして認識する
autocmd BufNewFile,BufRead *.ctp set filetype=php

" 閉じ括弧の自動入力
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>

inoremap " ""<LEFT>
inoremap ' ''<LEFT>


"------------------------------
" プラグイン設定
"------------------------------

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/unite.vim')

call dein#end()

" :call dein#install()

"------------------------------
" シンタックス＆カラー設定
"------------------------------

" 構文毎に文字色を変化
syntax on

" カラースキーマ
colorscheme desert
