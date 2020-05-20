"NOT COMPLIANT WITH VI
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set modelines=0

"SPACING
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set textwidth=79
set smarttab "Use the shiftwidth setting for inserting TAB
set expandtab "tabs are spaces
set autoindent
set fileformat=unix
filetype indent plugin on
set autoindent 

"SHOW
"""""""""""""""""""""""""""""""""""""""""""""""""""
set number          "show line numbers
set relativenumber  "relative line number
set showcmd         "show command in bottom bar
set cursorline      "show a visual under cursor
set showmatch       "show matching () []
set wildmenu        "long menu for tab completitions
"set wildmode=list:longest,full
set hidden          "hide buffers w/o saving
set splitbelow      "open new vertical split bottom
set splitright      "open new horizontal split right

"HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch "highlight matching [{()}]
let python_highlight_all = 1
set cursorline "highlight current line
syntax enable

"COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

"SEARCHING
"""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch "Enable searching as you type
set incsearch "searc as character are entered
set hlsearch "highlight matches
nnoremap / /\v
vnoremap / /\v
set ignorecase "search case-insensitive
set smartcase
set gdefault
set showmatch

"MOVEMENT
"""""""""""""""""""""""""""""""""""""""""""""""""""
"move vertically by visual line (skip fake long lines)
nnoremap j gj
nnoremap k gk
"move to Beginning/end of line (for comfort)
nnoremap B ^
nnoremap E $
"split navigation
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"muscle memory
inoremap <Left> 	<NOP>
inoremap <Right> 	<NOP>
inoremap <Up> 		<NOP>
inoremap <Down> 	<NOP>
nnoremap <Left> 	<NOP>
nnoremap <Right> 	<NOP>
nnoremap <Up> 		<NOP>
nnoremap <Down> 	<NOP>
"fast scrolling
set ttyfast
"Backspace added functionality
set backspace=indent,eol,start

"SHORTCUTS
"""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=";"   "leader is the comma
                    "remap esc for convenience
inoremap jk <esc> 
inoremap kj <esc>
                    "Execute script within vim with F9
nnoremap <buffer> <F9> :exec '!clear;python' shellescape(@%,1)<cr>
                    "Turn off highlighting
nnoremap <esc><esc> :nohlsearch<CR>

"UTF-8 SUPPORT
"""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

"SYSTEM CLIPBOARD
""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed
                    "Map Ctl+c for copy in visual
map <C-c> "+y<CR>   
set mouse+=a        "enable mouse support
set undofile        "mantian undo history
set undodir=~/.vim/undodir

"From the VIM help
"""""""""""""""""""""""""""""""""""""""""""""""
set history=200
set ruler
set showcmd
set wildmenu
set cmdheight=2

"***************Plugin configurations by Nico*********************

"Plugin for Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"PLugin for NERDtree
map <C-n> :NERDTreeToggle<CR>

"Plugin ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

"Plugin Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"Plugin for vim-Rainbow (use Rainbow Load/Toggle for on/off)
let g:rainbow_active = 1

"Plugin Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
