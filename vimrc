" vimrc

" === Vunde ===

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-fugitive'
Bundle 'junegunn/seoul256.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'plasticboy/vim-markdown'

" ReStructredText plugins
"Bundle 'Rykka/riv.vim'
" vim-rst equires simplejson
"Bundle 'edthedev/vim-rst'

" === General ===
"
set nocompatible
set showmode
set background=dark
set ffs=        " use fileformat from file (e.g., DOS/Unix)

" filesystem searching
set path+=**    " :find descends subdirs
set wildignore+=**/*.log.*
set wildignore+=**/*.pyc

" put all swap files together in one place, for Dropbox's sake
" (the ^= prepends to the existing value, allowing fallback to defaults)
set directory^=$HOME/.vim/swap//
set hidden   " allow switching away from unsaved buffers

set ttimeoutlen=50  " makes statusbar respond faster when switching modes

" === Tabs and Indents ===
set expandtab
set sts=4
set sw=4
set autoindent

"set number
set showbreak=.
set linebreak   " only wrap at reasonable characters


" === Search ===
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault    " global replace by default
" clear search highlight
nnoremap <leader><space> :noh<cr>
" don't move on word-under-cursor search, just search and highlight
nmap <silent>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

" === Navigation ===

" move by visual lines (instead of logical)
nmap j gj
nmap k gk

" move between windows with control
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" avoid silly C-j conflict with imap plugin
nnoremap <SID>I_won’t_ever_type_this <Plug>IMAP_JumpForward


" === Syntax ===

filetype indent plugin on
syntax on
let g:matchparen_insert_timeout = 5

" === Colors ===
set t_Co=256
"colorscheme jellybeans
"colorscheme ir_black
"colorscheme synic
"colorscheme tir_black

"colorscheme desert256
"
" nice low-contrast theme except for the green comments
let g:seoul256_background = 233
colorscheme seoul256
"autocmd VimEnter,Colorscheme * :hi Comment ctermfg=59
highlight Comment ctermfg=103 cterm=italic

highlight clear Visual
"highlight Visual term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
highlight Visual ctermfg=lightgrey ctermbg=23


" === Plugin : AirLine ===
set laststatus=2  " show status line even with a single window
let g:airline_powerline_fonts = 1  " fancy arrows
"let g:airline_theme="jellybeans"
let g:airline_theme="serene"
"let g:airline_theme="zenburn"
"let g:airline#extensions#tabline#enabled = 1  " if one tab, buffers at top
set noshowmode  " since airline does this for us

"
" === Plugin : IndentGuides ===
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2


" === Plugin : YCM ===

" Quiet YCM warnings when using C++
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1

" === Plugin :  latexsuite ===
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'


" === Plugin :  markdown ===
"let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=99
