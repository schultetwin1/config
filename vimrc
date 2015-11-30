" Matt Schulte's vimrc
" Mostly taken from DougBlack's tutorial

" COLORS
colorscheme elflord             " adequate colorscheme for now
syntax enable                   " enable syntax processing

" SPACES & TABS
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " number of spaces in TAB when editing
set shiftwidth=4                " shift width of 4
set expandtab                   " tabs are spaces
set smartindent                 " smart indenting
set backspace=indent,eol,start  " enable backspace in insert mode

" UI CONFIG
set number                      " show line numbers
set cursorline                  " highlight the current line
filetype indent on              " load filetype-specific indent files
set lazyredraw                  " redraw only when we need to
set showmatch                   " highlights matching [{()}]

" SEARCHING
set incsearch                   " search as characters are entered
set hlsearch                    " highlight search matches

" FOLDING
set foldenable                  " enable folding
set foldlevelstart=10           " Open most folds by default unless very deep
set foldnestmax=10              " 10 nested folds max
nnoremap <space> za     
set foldmethod=syntax           " Fold lines on syntax

" BACK UP FILES
set nobackup                    " Don't make a backup before overwritting
set nowritebackup               " Don't make backups while writing

" PATHOGEN
execute pathogen#infect()
