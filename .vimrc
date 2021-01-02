let mapleader = "\<space>"
call plug#begin()
  Plug 'easymotion/vim-easymotion'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-unimpaired'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'vim-test/vim-test'
  Plug 'dense-analysis/ale'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'vim-airline/vim-airline'
"  let g:plug_timeout = 30000                                 " Increase vim-plug timeout for YouCompleteMe
"  Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

" Download and install vim-plug (cross platform), if not already installed.
if empty(glob(
    \ '$HOME/' . (has('win32') ? 'vimfiles' : '.vim') . '/autoload/plug.vim'))
  execute '!curl -fLo ' .
    \ (has('win32') ? '\%USERPROFILE\%/vimfiles' : '$HOME/.vim') . 
    \ '/autoload/plug.vim --create-dirs ' .
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set background=dark
syntax on 					                                        " Enable syntax highlighting.
filetype plugin indent on			                              " Enable file type based indentation.

packloadall                                                 " Load all plugins in the start/ directory.
silent! helptags ALL                                        " Load help files for all plugins. silent! hides any output and errors.

set hlsearch                                                " Highlights the search results.
set incsearch                                               " Searches dynamically as you type.
set autoindent					                                    " Respect indentation on a new line.
set expandtab					                                      " Expand tab to spaces. Essential in Python.
set tabstop=2					                                      " Number of spaces tab is counted for.
set shiftwidth=2				                                    " Number of spaces to use for autoindent.
set backspace=2					                                    " Fix backspace behavior on most terminals.
set noswapfile                                              " Disable swap files.
set foldmethod=indent                                       " Fold based on indentation.
set wildmenu                                                " :e with wildmenu enabled.
set wildmode=list:longest,full                              " Complete till longest string in list.
set tags=tags;                                              " Look for a tags file recursively in parent directories.

noremap <leader>n :NERDTreeToggle<cr>                       

let NEDTreeShowBookmarks = 1                                " Display bookmarks on the startup.
" autocmd VimEnter * NERDTree                               " Enable NERDTree on startup.
" Autoclose NERDTree if it's the only windows left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

colorscheme PaperColor	                                    " Changing a colorscheme.
