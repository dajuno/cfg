set nocompatible
set modeline

call pathogen#infect()

filetype plugin indent on
syntax enable

" disable auto & smartident bc otherwise (py)comments are not indented
" set autoindent
" set smartindent
" set nosmartident

" setlocal noautoindent
" setlocal nocindent
" setlocal nosmartindent
" setlocal indentexpr=

" hard wrap
set formatoptions=t
set textwidth=79
set wrapmargin=0

set cursorline

" code folding... or just for python?
" set foldmethod=indent
" set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set number
set mouse=a

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000


"" from archlinux.vim
set backspace=indent,eol,start  " more powerful backspacing 

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bcf,.fdb_latexmk,.fls,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg,.pdf,.run.xml,.synctex.gz

set colorcolumn=79

" " spell checker
" " setlocal spell
" " set mousemodel=popup_setpos

set t_Co=256
set guiheadroom=0

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set showmatch
set ruler
set hlsearch
set incsearch
set showcmd

set laststatus=2

" au BufNewFile,BufRead *.tikz set syntax=tex
au BufNewFile,BufRead *.tikz set filetype=tex

let mapleader = ";"

let g:slime_target = "tmux"
let g:slime_python_ipython = 1

let python_highlight_all=1

let g:slime_paste_file = "$HOME/.slime_paste"

let g:SimpylFold_docstring_preview = 1
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" map <Leader>vip :call VimuxIpy()<CR>
" vmap <silent> <Leader>e :python run_visual_code()<CR> 
" noremap <silent> <Leader>c :python run_cell(save_position=False, cell_delim='####')<CR> 

" let g:airline_extensions = ['syntastic', 'tmuxline', 'tabline']

let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#excludes = ['LaTeX TOC', '__Tagbar__']
let g:airline_exclude_filenames = ['LaTeX TOC']
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#whitespace#show_message = 0

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum' "'jellybeans'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9

set background=light
colorscheme desert-warm-256 "BusyBee default zenburn camo
" for vim-pandoc-syntax:
hi! link Conceal Special
set gfn=Liberation\ Mono\ for\ Powerline\ 10
" set shell=/bin/bash
set shell=/bin/zsh
set encoding=utf8

set grepprg=grep\ -nH\ $*

if has("gui_running")
    set guioptions-=T
endif

let g:tex_flavor='latex'
" let g:tex_fold_enabled = 1
" let g:tex_nine_config = {
"     \'compiler': 'latexmk -pdf',
"     \'synctex': 1
"             \}

let g:tagbar_autoclose = 0
autocmd Filetype tex source ~/.vim/bundle/auctex/auctex.vim
"
" autocmd FileType python map <buffer> <F6> :call Flake8()<CR>
" autocmd BufWritePost *.py call Flake8()

" let ropevim_vim_completion=1

nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

" .tex bindings (more with LL in ftplugin/tex.vim)
autocmd FileType tex nmap <buffer> <F10> :!latexmk -pvc -pdf %<CR>
""" SYNCTEX 
autocmd FileType tex nnoremap <buffer> <F9>   :exec "!szathura %:r.pdf" line('.')  col('.') "% > /dev/null"<cr><cr>

" GMSH
au BufNewFile,BufRead *.geo  set filetype=gmsh


" " minibufexplorer bindings
" " switch buffers
" noremap <C-TAB>   :MBEbn<CR>
" noremap <C-S-TAB> :MBEbp<CR>

" switch windows
" noremap <C-Down>  <C-w>j
" noremap <C-Up>    <C-w>k
" noremap <C-Left>  <C-w>h
" noremap <C-Right> <C-w>l

" resize windows
if bufwinnr(1)
  map <C-w><Left> 10<C-w>< 
  map <C-w><Right> 10<C-w>>
endif

noremap <C-l> :CtrlPBuffer<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
" inoremap <C-s> <ESC>:w<CR>a


autocmd FileType gmsh setlocal commentstring=\/\/\ %s

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" in python files ignore dolfin blabla not found bla msg
" let g:syntastic_quiet_messages = { "regex": '\mdolfin.*\[F403\]' }
let g:syntastic_stl_format = '%E{E: %fe (%e)}%B{, }%W{W: %fw (%w)}'

let g:syntastic_python_flake8_args = '--ignore=F403,N806,N802,N803,E226'

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_enable_balloons = 1

"" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = "1"

"" vim-notes, vim-misc
let g:notes_directories = ['~/Documents/Notes']
let g:pandoc#formatting#mode = "h"


" tmux compatibility ESSENTIAL!!
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif
