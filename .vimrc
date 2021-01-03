" URL: https://github.com/onetrickponyy/dotfiles
" Author: Rust 
" Description: Personal .vimrc file
"
" All the plugins managed via vim-plug, run :PlugInstall to install all
" plugins from Github, :PlugUpdate to update. Leader key is the spacebar.
"
" => Pre-load {{{1
let mapleader = "\<space>"
" => vim-plug plugins {{{1
call plug#begin()
  Plug 'easymotion/vim-easymotion'            " Quick and precise navigation.
  Plug 'preservim/nerdtree'                   " NERDTree.
  Plug 'tpope/vim-unimpaired'                 " Buffer changes.
  Plug 'ctrlpvim/ctrlp.vim'                   " Quick file match.
  Plug 'tpope/vim-fugitive'                   " Git inside Vim.
  Plug 'christoomey/vim-tmux-navigator'       " Navigate wihtout conflicts.
  Plug 'vim-test/vim-test'                    " Builds and test.
  Plug 'dense-analysis/ale'                   " Asynchronous Lint Engine.
  Plug 'NLKNguyen/papercolor-theme'           " Colorscheme.
  Plug 'vim-airline/vim-airline'              " Status line.
call plug#end()
" => Design {{{1
colorscheme PaperColor	                                    " Changing a colorscheme.
set background=dark                                         " Changing the background.
" => Settings {{{1 
syntax on 					                            " Enable syntax highlighting.
filetype plugin indent on	                      " Enable file type based indentation.

packloadall                                     " Load all plugins in the start/ directory.
silent! helptags ALL                            " Load help files for all plugins. silent! hides any output and errors.
set hlsearch                                    " Highlights the search results.
set incsearch                                   " Searches dynamically as you type.
set autoindent				                          " Respect indentation on a new line.
set expandtab					                          " Expand tab to spaces. Essential in Python.
set tabstop=2					                          " Number of spaces tab is counted for.
set shiftwidth=2				                        " Number of spaces to use for autoindent.
set backspace=2					                        " Fix backspace behavior on most terminals.
set noswapfile                                  " Disable swap files.
set foldmethod=marker                           " Fold based on indentation.
set wildmenu                                    " :e with wildmenu enabled.
set wildmode=list:longest,full                  " Complete till longest string in list.
set tags=tags;                                  " Look for a tags file recursively in parent directories.
" => Plugin configuration {{{1
" Download and install vim-plug (cross platform), if not already installed.
if empty(glob(
    \ '$HOME/' . (has('win32') ? 'vimfiles' : '.vim') . '/autoload/plug.vim'))
  execute '!curl -fLo ' .
    \ (has('win32') ? '\%USERPROFILE\%/vimfiles' : '$HOME/.vim') . 
    \ '/autoload/plug.vim --create-dirs ' .
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

noremap <leader>n :NERDTreeToggle<cr>                       

let NEDTreeShowBookmarks = 1                        " Display bookmarks on the startup.
" autocmd VimEnter * NERDTree                       " Enable NERDTree on startup.
" Autoclose NERDTree if it's the only windows left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

