map <Space> <leader>

set path+=**

syntax on
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save in insert mode

autocmd InsertEnter * norm zz               " always vertically center current line in insert mode
autocmd BufWritePre * %s/\s\+$//e           " always remove triling white spaces
autocmd BufWritePost ~/.bash_aliases !bash  " always execute bash after its modification

set autoread                                        " Auto reload changed files
set wildmode=longest,list,full                      " autocompletion
set wildmenu                                        " Tab autocomplete in command mode
set backspace=indent,eol,start                      " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                               " Clipboard support
set expandtab shiftwidth=4 tabstop=4 softtabstop=4  " Two spaces for tabs everywhere
set hlsearch                                        " Highlight search results
set ignorecase smartcase                            " Search queries intelligently set case
set incsearch                                       " Show search results as you type
set nowrap                                          " Don't wrap long lines
set listchars=extends:?                             " Show arrow if line continues rightwards
set listchars+=precedes:?                           " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile               " Turn off backup files
set number relativenumber                           " Enable relative line numbers
set scrolloff=5                                     " Leave 5 lines of buffer when scrolling
set sidescrolloff=10                                " Leave 10 characters of horizontal buffer when scrolling
" set number                                          " Enable line numbers

colorscheme slate

map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>erc :e! ~/.vimrc<CR>


" ----- enable // disable auto commenting -----
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" ----- enable // disable autodindent -----
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" ----- split window -----
set splitbelow splitright " Open new splits to the bottom // right
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>
" navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ----- tabs -----
nnoremap <C-t> :tabnew<CR>
" navigation
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>

" ----- cursor cross -----
set cursorline cursorcolumn " enable cursor cross
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b

" ----- Persistent undo -----
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" ----- Comments -----
map <leader>8 :s/^/** /<CR>  " abaqus comment
map <leader>* :s/^** //<CR>  " uncomment abaqus
map <leader>3 :s/^/# /<CR>   " python // bash comment
map <leader># :s/^# //<CR>   " uncomment python // bash
