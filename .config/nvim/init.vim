" deinがインストールされるディレクトリの指定
let s:dein_dir = expand('~/.cache/dein') "<- dein によってプラグインがインストールされるディレクトリ ##########
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
" deinがインストールされているかをチェック インストールされていなかったらdeinをダウンロードしてくる
if &runtimepath !~# '/dein.vim'
 if !isdirectory(s:dein_repo_dir)
 execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
 endif
 execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
 
" deinの起動
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)
 
 " tomlファイル（使用するプラグインのリストが記述されているファイル）の場所を指定
 let g:rc_dir = expand('~/.config/nvim/dein') "<- dein.toml dein_lazy.toml を読み込むディレクトリ ##########
 let s:toml = g:rc_dir . '/dein.toml'
 " let s:lazy_toml = g:rc_dir . '/dein_lazy.toml' "<- dein_lazy.toml を使う場合はコメント解除 ##########
 
 " tomlファイルを読み込む
 call dein#load_toml(s:toml, {'lazy': 0})
 " call dein#load_toml(s:lazy_toml, {'lazy': 1}) "<- dein_lazy.toml を使う場合はコメント解除 ##########
 "plugins
 "call dein#add('tomasr/molokai')
 call dein#add('w0rp/ale')
 call dein#add('morhetz/gruvbox')
 "call dein#add('Shougo/neocomplete.vim')
 "call dein#add('davidhalter/jedi-vim')
 " エラー行に表示するマーク
 let g:ale_sign_error = '⨉'
 let g:ale_sign_warning = '⚠'
 " エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
 let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
 " エラー表示の列を常時表示
 let g:ale_sign_column_always = 1
 
 " ファイルを開いたときにlint実行
 let g:ale_lint_on_enter = 1
 " ファイルを保存したときにlint実行
 let g:ale_lint_on_save = 1
 " 編集中のlintはしない
 let g:ale_lint_on_text_changed = 'never'
 
 " lint結果をロケーションリストとQuickFixには表示しない
 " 出てると結構うざいしQuickFixを書き換えられるのは困る
 let g:ale_set_loclist = 0
 let g:ale_set_quickfix = 0
 let g:ale_open_list = 0
 let g:ale_keep_list_window_open = 0

 " 有効にするlinter
 let g:ale_linters = {
 \   'python': ['flake8'],
 \}
 
 " ALE用プレフィックス
 nmap [ale] <Nop>
 map <C-k> [ale]
 " エラー行にジャンプ
 nmap <silent> [ale]<C-P> <Plug>(ale_previous)
 nmap <silent> [ale]<C-N> <Plug>(ale_next)
 
 " status bar
 let g:airline_theme = 'wombat'
 set laststatus=2
 let g:airline#extensions#branch#enabled = 1
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#wordcount#enabled = 0
 let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
 let g:airline_section_c = '%t'
 let g:airline_section_x = '%{&filetype}'
 let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
 let g:airline#extensions#ale#error_symbol = ' '
 let g:airline#extensions#ale#warning_symbol = ' '
 let g:airline#extensions#default#section_truncate_width = {}
 let g:airline#extensions#whitespace#enabled = 1
 " 設定の終了
 call dein#end()
 call dein#save_state()
endif
 


filetype plugin indent on
syntax on
autocmd ColorScheme * highlight Question ctermbg=none
"colorscheme Apprentice
"colorscheme molokai
"colorscheme hybrid

" === gruvbox ===
colorscheme gruvbox

set background=dark
set t_Co=256            " gruvboxをカラースキーマにするときに必要！
let g:ligthline = { 'colorscheme': 'gruvbox' }
" === gruvbox ===




set list
set number
set relativenumber
set cursorline
set virtualedit=onemore
set wrapscan

set noerrorbells
set showmatch
set cmdheight=2
set laststatus=2
set showcmd
hi Comment ctermfg=3
set title
set clipboard+=unnamedplus
set nocompatible
set backspace=indent,eol,start

set encoding=utf-8
set fenc=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

set splitbelow

" ESC to jj
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>
" プラグインのインストールをチェック 未インストールのプラグインがあればインストールする
if dein#check_install()
 call dein#install()
endif

