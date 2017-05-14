if &compatible
  set nocompatible               " Be iMproved
endif

" set runtimepath+=/home/david/.config/nvim/dein/repos/github.com/Shougo/dein.vim
" call dein#begin('/home/david/.config/nvim/dein')
" call dein#add('Shougo/dein.vim')
" call dein#add('neomake/neomake')
" call dein#end()

filetype plugin indent on


call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
" Plug 'zchee/deoplete-clang'

Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
" Plug 'bfredl/nvim-ipy'
" Plug 'ivanov/vim-ipython'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'jpalardy/vim-slime'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'  " dependency of colorscheme-switcher
call plug#end()

" set statusline+=%#ErrorMsg#%{neomake#statusline#LoclistStatus()}

let mapleader = '-'
 
" hard wrap
set formatoptions=t
set textwidth=79
set wrapmargin=0
set colorcolumn=79

" tabulator
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" appearance
set number
set showmatch
set cursorline
set background=dark

set mouse=a

set undofile                " Save undo's after file closes
set undodir=$HOME/.config/nvim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" COLORSCHEMES
" colorscheme desert-warm-256 "BusyBee default zenburn camo
set termguicolors

colorscheme base16-default-dark " or desert-warm-256 or apprentice

" function! SwitchLightDark()
"     if g:colors_name == 'flattened_light'
"         colorscheme flattened_dark
"         redraw
"     elseif g:colors_name == 'flattened_dark'
"         colorscheme flattened_light
"         redraw
"     endif
" endfunction

" enable conceal syntax elements for pandoc
" hi! link Conceal Special

let g:colorscheme_switcher_define_mappings = 0
let g:colorscheme_switcher_exclude_builtins = 1
let g:colorscheme_switcher_exclude = ['desert-warm-256', 'mayansmoke', 'pyte', 'zenburn', 'apprentice', 'base16-default-light', 'base16-ocean', 'base16-flat', 'flattened_dark', 'gruvbox', 'seoul256', 'seoul256-light']
nmap <F6> :NextColorScheme<CR>

" MAPPINGS
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap <space> za
command InitVim edit ~/.config/nvim/init.vim

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" focus on new splits
set splitbelow
set splitright

" autocmds
au BufNewFile,BufRead *.geo set filetype=gmsh
au BufNewFile,BufRead *.tikz set filetype=tex

""" PLUGINS
" neomake
autocmd! BufWritePost * Neomake
let g:neomake_serialize = 1
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_args = ['--ignore=F405,F403,N806,N802,N803,E226,E402,W503']
" let g:neomake_python_flake8_maker = {
    " \ 'args': ['--ignore=F403,N806,N802,N803,E226'],
" \ }
    " \ 'errorformat': '%f:%l:%c: %m'
" let g:neomake_verbose = 3
let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_cpp_gcc_args = ['-fsyntax-only', '-Wall', '-Wextra', '-fopenmp']  " , '-Wno-unknown-pragmas']

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 0

" configure deoplete for lertag/vimtex 
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
    \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
    \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
    \ .')'

" Airline
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#excludes = ['LaTeX TOC', '__Tagbar__']
let g:airline_exclude_filenames = ['LaTeX TOC']
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#whitespace#show_message = 0
set gfn=Liberation\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'bubblegum' "'jellybeans'
let g:airline_theme = 'apprentice' "'jellybeans'
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

let g:airline_section_z = airline#section#create('%p%% %{g:airline_symbols.linenr}%#__accent_bold#%3l:%#__restore__#%2v') 
let g:airline_skip_empty_sections = 1
" let g:airline_section_warning = airline#section#create('%{neomake#statusline#LoclistStatus()}')

" TagBar
nmap <F8> :TagbarToggle<CR>

" Unite.vim
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <leader>f :<C-u>Unite -start-insert file<cr>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/neovim:!<cr>
nnoremap <leader>l :Unite -quick-match buffer<cr>

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
      \ 'gmsh': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/'}
  \ }

autocmd FileType python let g:NERDSpaceDelims = 0
autocmd FileType yaml let g:NERDSpaceDelims = 1

" SimpylFold
let g:SimpylFold_docstring_preview = 1
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<


" Slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let python_highlight_all=1
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend
nmap <leader>sc <Plug>SlimeConfig

" FastFold
let g:tex_fold_enabled=1

" VimTeX
let g:polyglot_disabled = ['latex']   " disable vim-polyglot
let g:tex_flavor = 'latex'  " vim detects tex
let g:vimtex_enabled = 1
let g:vimtex_fold_enabled = 0
let g:vimtex_view_enabled = 1
let g:vimtex_view_method = 'zathura'  " -x nvr --remote-silent %f -c %l'
let g:vimtex_latexmk_progname = 'nvr'


" tagbar for markdown/pandoc
" .ctags:
"--langdef=markdown
"--langmap=markdown:.md
"--regex-markdown=/^(#+)[ \t]+([^#]*)/\1 \2/h,header,Markdown Headers/
"--regex-markdown=/\[([^\[]+)\]\(([^\)]+)\)/\1/l,link,Markdown Links/
"--regex-markdown=/!\[\]\(.*[\/ ](.*\.[a-z]{3})\)/\1/i,image,Markdown Image/
let g:tagbar_type_pandoc = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
                \ 'h:headings',
                \ 'l:links',
                \ 'i:images'
            \ ],
    \ "sort" : 0
\ }

