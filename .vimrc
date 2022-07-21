" filetype plugin on
syntax on

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'craigemery/vim-autotag'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'preservim/nerdtree'
"Plugin 'yegappan/grep'
Plugin 'milkypostman/vim-togglelist'
"Plugin 'ap/vim-buftabline'
Plugin 'junegunn/fzf.vim'
Plugin 'jdonaldson/vaxe'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'brooth/far.vim'

"Themes
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Mines
"colorscheme gruvbox
colorscheme base16-default-dark
set hidden
set hlsearch
set noswapfile
set backspace=indent,eol,start
set completeopt-=preview
set noeb vb t_vb=
set nowrap
au GUIEnter * set vb t_vb=

"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
"if exists('space_match')
  "call matchdelete(space_match)
"endif
"let space_match = matchadd('Conceal', '\v( @<= )|(  @=)', -1, -1, {'conceal': '·'})
"set conceallevel=1
set listchars=tab:\ \ ,nbsp:␣,precedes:«,extends:»
set list
set tabstop=4
set shiftwidth=4
"set colorcolumn=120

let mapleader = ','
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

let g:ctrlp_working_path_mode = 0
let NERDTreeShowHidden=1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','%{getcwd()}',' '])
endfunction
autocmd VimEnter * call AirlineInit()

" The -s are sent to ag, in this case makes the search case sensitive
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-s', fzf#vim#with_preview(), <bang>0)

let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
"let g:go_debug_windows = {
	"\ 'vars':       'leftabove 30vnew',
	"\ 'stack':      'leftabove 20new',
	"\ 'goroutines': 'botright 10new',
	"\ 'out':        'botright 5new',
"\ }

let g:far#source = 'ag'

nmap <C-P> :FZF<CR>
nnoremap <leader>. :Ag <C-r>=expand('<cword>')<CR><CR>
nnoremap <leader>n :NERDTreeToggle<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

hi Conceal ctermbg=NONE
hi Conceal ctermfg=NONE
hi Conceal guifg=NONE
hi Conceal guibg=NONE

if has('nvim')
	Plugin 'tveskag/nvim-blame-line'

	autocmd BufEnter * EnableBlameLine
endif

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

