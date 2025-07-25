set encoding=utf-8
scriptencoding utf-8

set nocompatible " Vim の Vi 互換機能を無効化 "

" ファイルエンコーディングの設定 "
set fileencodings=ucs-bom,utf-8,euc-jp,cp932 " ファイル読み込みの文字コード "
set fileencoding=utf-8 " ファイル書き込みの文字コード "
set fileformats=unix,dos,mac " 改行コードの設定 "

" 表示設定 "
set number " 行数を表示 "
syntax on " 文字に色をつける "
colorscheme lucario " カラースキーム有効化 "
set ambiwidth=double " 一部記号が崩れる問題を解決 "
set guifont=inconsolata:h16 " font(Windows, mac) "
set cursorline " カーソルラインをハイライト表示 "
" ステータスバーの表示 "
set statusline=%F%m%r%h%w%=[行:%l][列:%c][%{&fileencoding}]%y
set laststatus=2 " ステータスバーを常に表示 "

" 特定の拡張子に指定の syntax を強制 "
autocmd BufNewFile,BufRead *.fish  set filetype=sh

" インデントの設定 "
set expandtab " タブ入力をスペースとして入力 "
set tabstop=4 " タブ入力がされたとき幅を４にする "
set autoindent " 自動インデントを行う "
set smartindent " 自動インデントを行う・その２ "
set shiftwidth=4 " 自動インデントの幅を４にする "
set softtabstop=4 " 連続したスペースに対してタブやバックスペースを４つずつ動かす "

" バックアップの設定 "
set nobackup " バックアップファイルを作らない "
set noundofile " undo 履歴を残さない "

" 操作設定 "
set mouse=a " マウスを有効化 "
set backspace=indent,eol,start " バックスペースで削除できるようにする "
" カーソルが橋まで行った場合に行を移動できるようにする "
set whichwrap=b,s,h,l,<,>,[,],~
" 折り返し表示されている行をカーソルを移動できるようにする "
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" 検索設定 "
set incsearch " 1文字入力のたびに検索を行う "
set ignorecase " 検索するときに大文字小文字を区別しない "
set smartcase " 検索するときに〜その２ "

" エイリアス "
command Boterm bo terminal ++rows=15
