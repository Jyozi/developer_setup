
if !&compatible
  set nocompatible
endif

let g:ruby_default_path = systemlist('rbenv which ruby 2>/dev/null || which ruby')[0]
" let g:python_host_prog = $PYENV_ROOT . '/shims/python2'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

filetype off
filetype plugin indent off

" dein
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_lazy_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:toml_lazy_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

set encoding=utf-8

set clipboard+=unnamedplus

" move with insert mode
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" special chars
set ambiwidth=single
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" tab
autocmd FileType javascript  set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.ts set tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.tsx set tabstop=2 shiftwidth=2
autocmd FileType json set tabstop=2 shiftwidth=2
set smarttab
set expandtab
set autoindent

" 検索
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" コマンド補完
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" syntax on
syntax on

" indent on
filetype plugin indent on

" line
set number
set cursorline
hi clear CursorLine
hi CursorLineNr term=bold cterm=bold ctermfg=yellow ctermbg=NONE
hi LineNr term=bold ctermfg=lightgray ctermbg=234
hi Search cterm=bold ctermfg=black

" esc bind
inoremap <silent> jj <ESC>

" save cursor
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" for supertab
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

"Autopep8 Scripts-----------------------------
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

autocmd FileType python nmap <S-f> :call Autopep8()<CR>
"Autopep8 Scripts-------------------------
