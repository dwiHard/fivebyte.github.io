set encoding=UTF-8
set t_Co=256                                " set 256 colors
syntax enable                               " syntax highlight
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results
set laststatus=2
call plug#begin()
Plug 'projekt0n/github-nvim-theme'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

let g:github_function_style = "italic"
let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]
let g:github_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
let g:github_comment_style = "italic"
let g:github_keyword_style = "italic"
let g:github_function_style = "italic"
let g:github_variable_style = "italic"

" AirLine
colorscheme github_dark_default
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='papercolor'

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle <CR> " F12 toggles file explorer

" Airline
let g:airline#extensions#tabline#formatter = 'default'

" FZF
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
map <silent><C-r> :Files<CR>
nnoremap <silent> <C-t> :execute 'Ag ' . input('Ag/')<CR>

" Vertical line
lua << EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}
EOF
