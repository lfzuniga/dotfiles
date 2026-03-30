" ---------------------
"  Syntax and indent
"  --------------------
syntax on
set showmatch " show matching braces when text indicator is over them

set nocompatible
filetype plugin indent on " enable file type detection
set autoindent
set colorcolumn=120

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
colorscheme tokyonight


" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

" finding into files
set path+=** "very similar to fuzy finder
set wildmenu


"-----------------
"Basic editing config
"-----------------
set shortmess+=I
set nu " number lines
set rnu " relative line numbering
set incsearch "incremental search
set hls "highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set scrolloff=5 " show lines above and below cursor (when possible)
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase





"NOTE:  add the fzf (finder) and the nerdtree to vim




" Enable searching as you type, rather than waiting till you press enter.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set mouse+=a

" Mapping to be able to move lines like in VS code
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" --------------
"  Misc
"  -------------
" This is to be able to copy into clipboard
set clipboard=unnamed
" Mappings to have you use keys
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
