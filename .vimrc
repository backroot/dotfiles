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

" 現在行をわかりやすく表示
set cursorline

" 検索時などに大文字小文字無視
set ignorecase

" 検索時などに大文字で始めたら大文字小文字無視しない
set smartcase

" 改行コードをLFに設定する
autocmd BufNewFile * set fileformat=unix
" .elファイルをhtmlファイルとして認識する
autocmd BufNewFile,BufRead *.ep set filetype=html
" .ctp ファイルをphpファイルとして認識する
autocmd BufNewFile,BufRead *.ctp set filetype=php

" 括弧内へ移動
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap <> <><LEFT>
inoremap %% %%<LEFT>

inoremap {<CR> {<CR>}<UP><Esc><S-A><CR><Tab>
inoremap [<CR> [<CR>]<UP><Esc><S-A><CR><Tab>
inoremap (<CR> (<CR>)<UP><Esc><S-A><CR><Tab>

nnoremap :: <S-A>:<Esc>
nnoremap ;; <S-A>;<Esc>
nnoremap ,, <S-A>,<Esc>
nnoremap // <S-I>//<Esc>
nnoremap ## <S-I>#<Esc>

inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap `` ``<LEFT>

" コメント入力
inoremap /**<CR> /**<CR><Space>*<Space><CR>*/<UP>
inoremap """<CR> """<CR><CR>"""<UP><Tab>

inoremap <C-l> <RIGHT>
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>

"------------------------------
" プラグイン設定
"------------------------------

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('powerline/powerline')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('leafgarland/typescript-vim')
call dein#add('jason0x43/vim-js-indent')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('clausreinke/typescript-tools.vim')
call dein#add('joonty/vdebug')

call dein#end()

" :call dein#install()

"------------------------------
" neocomplcache
" https://github.com/Shougo/neocomplcache.vim
"------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-s>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"------------------------------
" Vundle
"------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------
" Vim Airline Theme
"------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'


"------------------------------
" Jedi
"------------------------------
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1

"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r""

"------------------------------
" Javascript
"------------------------------
let g:js_indent_typescript = 1
let g:used_javascript_libs = 'jquery,angularjs,react'

"------------------------------
" 改行時の自動コメントアウトを無効
"------------------------------
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
augroup END

"------------------------------
" 閉じタグの補完
"------------------------------
augroup auto_tag_close
    function! s:close_tag()
        inoremap <buffer> </ </<C-x><C-o><Esc><S-f><<Insert>
        inoremap <buffer> <CR></ <CR></<C-x><C-o><Esc><Up>o<Tab>
        inoremap <buffer> <Esc>o</ <Esc>o</<C-x><C-o><Esc><Up>o<Tab>
    endfunction
    autocmd!
    autocmd FileType xml :call s:close_tag()
    autocmd FileType html :call s:close_tag()
    autocmd FileType javascript  :call s:close_tag()
augroup END

"------------------------------
" シンタックス＆カラー設定
"------------------------------

" 構文毎に文字色を変化
syntax on

" カラースキーマ
colorscheme desert
