" be iMproved
set nocompatible

"================================
"" Vundle settings
"================================
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'

	"-------=== Code/Project Nacigation ===--------
	Plugin 'scrooloose/nerdtree'				"Project and file navigation
	Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

	"-------=== Other ===--------------------------
	Plugin 'vim-airline/vim-airline' 			" Lean & mean status/tabline for vim
	Plugin 'vim-airline/vim-airline-themes'		" Themes for airline
	Plugin 'dracula/vim'						" Dracula theme for vim
	Plugin 'tpope/vim-fugitive'					" Git support
	Plugin 'tpope/vim-surround'					" Parentheses, brackets, quotes, XML tags, and more

	"-------=== Language support ===--------------------------
	Plugin 'Valloric/YouCompleteMe'				" Autocomplete plugin
	Plugin 'scrooloose/nerdcommenter'			" Comment stuff out

	"-------=== Python ===--------------------------
	Plugin 'vim-syntastic/syntastic'			" Syntax checking plugin for Vim
	Plugin 'nvie/vim-flake8'
	Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)


call vundle#end()            " required
filetype plugin indent on    " required

"================================
"" General settings
"===============================
syntax on

set number              " line numbers
set ruler

" PEP 8 indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set smarttab
let python_highlight_all=1
filetype indent on      " activates indenting for files

set cursorline
set showmatch

set fileformat=unix
set nobackup            " get rid of anoying ~file

" Включение поддержки русского языка
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
" Spelling
set spelllang=ru_yo,en_us
set encoding=utf-8

set scrolloff=10

set clipboard=unnamed

set backspace=2         " backspace in insert mode works like normal editor

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme dracula

"=====================================================
"" Splitting settings
"=====================================================
set splitbelow
set splitright

" split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"=====================================================
"" NERDTree settings
"=====================================================
" Toggle on NerdTree
map <C-o> :NERDTreeToggle<CR>
let NERDTreeWinSize=40
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
"" Python settings
"=====================================================

" python executables for different plugins
let g:pymode_python='python3'
let g:syntastic_python_python_exec='python3'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pylint', 'pydocstyle', 'python']

" YouCompleteMe
set completeopt-=preview

map <Space> <Leader>
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>
