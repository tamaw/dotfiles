" File: .vimrc
" Created by: Tama Waddell
" Date: Tue Sep 28 20:39:06 EST 2010
" vim: foldlevel=0

" General  Settings
syntax on           " Always show syntax highlighting
filetype plugin indent on  " External filetype plugins enabled
set nocompatible    " Dont be backwards compatible with vi 
set autoread        " Read the file if changed from an external application
set autowrite       " Write the file on commands like :next :make
set nomodeline      " remove modeline as it had previous security issues
set showcmd         " Show partial commands in last line of screen
set encoding=utf-8  " Sets the character encoding used
set wildmenu        " Enables enhanced tab completion
set showmode        " Shows if you are in Insert, Replace or Visual mode
set history=999     " Amount of history vim remebers
set filetype=on     " Enable filetype detection
set showmatch       " Highlights matching mrackets
set mat=2           " Highlight matching brackets for 0.5 seconds
set numberwidth=1   " Number of columns used for line numbers
set undolevels=100    " Unlimited undos
"set cpoptions="aABceFs" " vim default undos
set number          " Each line has a line number
set hidden          " Hide buffers when they are abandoned
set ruler           " Show line and column number of the cursors position
set backspace=indent,eol,start     " allow backspacing over everything in insert mode
set hid             " Change buffer without saving

" Spelling
set spelllang=en_au
map <leader>ss :setlocal spell!<cr>

"Indent settings
set shiftwidth=4        " number of spaces for each auto indent
set tabstop=4           " number of spaces a tab counts for
set softtabstop=4       " Backspace fake tabs
set expandtab           " Tabs don't convert to spaces
set smarttab            " Tabs begging of line spaces elsewhere
set autoindent          " Automatically indent

"Fold settings
set foldenable          " Enable folding
set foldmethod=marker   " Fold where there is markers
set foldlevel=999       " Default high fold level so all are shown
"set foldopen-=search    " Do not open folds when searching
"set foldopen-=undo      " Do not open folds when undoing changes

"Error settings
set noerrorbells " No error beeps
set novisualbell " No visual beeps

"Font settings

" GUI settings
set tabpagemax=100
set scrolloff=5     " 5 lines to the cursor when moving vertical

"Appearance
colorscheme desert
set background=dark

"Search Options
"set hlsearch
set incsearch
set smartcase
set magic           "Allows regex pattern matching

"Vim Diff
set diffopt+=iwhite "remove whitespaces in diff'ing

" Short cuts
"nnoremap <space> za
"imap <c-space> <c-x><c-o>


" Options for PHP
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd BufEnter * cd %:p:h " Change to the folder where you opened the file

" Auto-completion for common file types (untested)
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" Mappings
map <Leader>X I/*A*/ <cr>
nmap <Leader>T : TlistToggle<cr><C-w><C-w> " Toggle ctags
map <F9> :mksession! ~/.vim/session 
map <F10> :source ~/.vim/session <cr> 

" Backup files
set nobackup
set noswapfile


" Mutt email client
au BufRead /tmp/mutt-* set tw=72

"Status Line
set laststatus=2
set statusline=
set statusline+=%-3.3n\     " buffer number
set statusline+=%f\         " filename
set statusline+=%h%m%r%w    " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    "file type
set statusline+=%=          " right align
set statusline+=0x%-8B      " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P        " file position

"set statusline=
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

" In Xmonad sometimes gvim renders a half line. Keys binded to fix it.
map <F12> :let &lines=&lines-1
map <S-F12> :let &lines=&lines+1

"Use supertab with eclim
let g:SuperTabDefaultCompletionTypeDiscovery = [ "&completefunc:<c-x><c-u>", "omnifunc:<c-x><c-o>" ]
let g:SuperTabLongestHighlight = 1


