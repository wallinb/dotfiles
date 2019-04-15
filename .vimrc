" ##############################################################################
" VIM general config
" ##############################################################################
"

set shell=/bin/bash

set nocompatible

set clipboard=autoselect

" Use aliases
let $BASH_ENV="~/.bash_aliases"

" Set to auto read when a file is changed from the outside
set autoread

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Cue the magic (regex)
set magic

" Buffers can be hidden (not have to explicitly write, etc...)
set hidden

" Shhh
set visualbell
set noerrorbells

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on

" Set 5 lines - when moving vertically using j/k
set so=5

" Turn on the WiLd menu (vim cmd auto-complete w/ tab)
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*dist/*,*tmp/*,*build/*,*.DS_Store

" Always show current position
set ruler

" Title terminal with name of file
set title

" Set line num
set number
set relativenumber

" Height of the command bar
set cmdheight=1

" Show command status
set showcmd

" Be careful, and you can avoid this backup annoyingness
set nobackup
set nowb
set noswapfile

" Show matching brackets
set showmatch
set mat=2 " tenths of seconds

" Set utf8 as standard encoding and en_US as the standard language
set encoding=UTF-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set diffopt+=vertical


" ##############################################################################
" Key binds
" ##############################################################################

let mapleader=","
let maplocalleader=","

" Disable arrows, must not show weakness
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" remap jj to escape in insert mode
inoremap jj <Esc>

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" And commands can wrap
set whichwrap+=<,>,h,l

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" ##############################################################################
" Plugins
" ##############################################################################

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'idanarye/vim-merginal'
Plug 'sodapopcan/vim-twiggy'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'jpalardy/vim-slime'
Plug 'mileszs/ack.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'davidhalter/jedi-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'walkermatt/vim-mapfile'
Plug 'rodjek/vim-puppet'
Plug 'godlygeek/tabular'
Plug 'tell-k/vim-autopep8'
Plug 'vim-scripts/paredit.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/Solarized'
Plug 'leafgarland/typescript-vim'
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'vim-scripts/diffchar.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'ambv/black'
Plug 'fisadev/vim-isort'
Plug 'szymonmaszke/vimpyter'

call plug#end()

let g:slime_target="tmux"

let g:tex_flavor='latex'

let g:jsx_ext_required=0

nnoremap <F2> :FZF<CR>
nnoremap <F3> :Gstatus<CR>
nnoremap <F4> :Twiggy<CR>

let notes={ 'Name': 'Notes', 'path': '~/drive/notes',}
let g:riv_projects=[notes]

let vim_markdown_preview_toggle=3
let vim_markdown_preview_pandoc=1
" let vim_markdown_preview_browser='firefox'
" let vim_markdown_preview_github=0
" let vim_markdown_preview_hotkey='<c-m>'
" let vim_markdown_preview_hotkey='<c-m>'
" let vim_markdown_preview_browser='Google Chrome'

let g:EasyClipUseSubstituteDefaults=1
nmap M <Plug>MoveMotionEndOfLinePlug

let g:ackprg = 'ag --nogroup --nocolor --column'

autocmd Filetype ipynb nnoremap <Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nnoremap <Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nnoremap <Leader>n :VimpyterStartNteract<CR>

nnoremap <leader>, :ALENext<CR>

" ##############################################################################
" Filetype
" ##############################################################################

au BufRead,BufNewFile *.map,*.sym set filetype=mapfile

" ##############################################################################
" Look
" ##############################################################################

" Allows transparent background
" hi Normal ctermbg=none

" Folding
syntax enable
set foldmethod=manual
set foldlevel=99
hi Folded ctermfg=250
hi Folded ctermbg=236

let g:nord_uniform_diff_background=1
colorscheme nord

" Statusline
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Col:\ %c
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %#warningmsg#
set statusline+=\ %*

function! MyFoldText()
    let line=getline(v:foldstart)
    return '↸ ' . line
endfunction

set foldtext=MyFoldText()

" ##############################################################################
" Search related
" ##############################################################################

set grepprg=grep\ -nH\ $*

" Ignore case when searching
set ignorecase

" all lower -> insensitive, any upper -> sensitive
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg=@"
    execute "normal! vgvy"

    let l:pattern=escape(@", '\\/.*$^~[]')
    let l:pattern=substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/=l:pattern
    let @"=l:saved_reg
endfunction


" ##############################################################################
" Tab behavior
" ##############################################################################

" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4
filetype indent on
set autoindent " Basic auto-indent


" ##############################################################################
" Wrapping
" ##############################################################################

set wrap
set linebreak "Only at linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" ##############################################################################
" Auto commands
" ##############################################################################

autocmd FileType c,cpp,java,php,python,puppet autocmd BufWritePre <buffer> %s/\s\+$//e

" Tab behavior for filetypes
autocmd FileType html,htmldjango,xml,javascript,yaml,css setlocal shiftwidth=2 tabstop=2 softtabstop=2

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source %

" Run Black when writing python code
autocmd BufWritePre *.py execute ':Black'

" Run isort when writing python code
autocmd BufWritePre *.py execute ':Isort'
