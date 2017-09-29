set nocompatible

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Good defaults
Plug 'tpope/vim-sensible'

" Color schemes

Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'jnurmine/Zenburn'
" Plug 'tomasr/molokai'

" Commenting
Plug 'tpope/vim-commentary'

" Highlight annoying whitespace
Plug 'ntpeters/vim-better-whitespace'

" Initialize plugin system
call plug#end()

" GUI Settings
" colorscheme base16-solarized-dark
if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ 
    set lines=43 columns=132
endif

" Numbered lines.
set number

" Tab settings.
set expandtab
set shiftwidth=4
set autoindent     " Do auto-indenting
set nocindent      " But don't do wacky C style indenting


" Search settings
set ignorecase
set smartcase
set hlsearch

set noswapfile "do not generate .swap file
set history=50     " keep 50 lines of command line history



" Enable clipboard support
if exists('+clipboard')
    if v:version >= 704 || (v:version == 703 && has('patch74'))
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" Switching between files
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F6> :bp<CR>
nnoremap <F7> :bn<CR>
nnoremap <C-Tab> :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>
" CDC = Change working directory to directory of current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,lcd :lcd %:p:h<CR>:pwd<CR>

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" lhs comments -- select a range then hit ,# to insert hash comments
" or ,/ for // comments, or ,c to clear comments.
map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch<CR>

" wrapping comments -- select a range then hit ,* to put  /* */ around
" selection, or ,d to clear them
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> <Esc>:nohlsearch<CR>

" to clear hlsearch -- hit ,h to clear highlighting from last search
map ,h :nohlsearch <CR>

" Put the cursor where I start typing search pattern
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>

" Perl-related highlighting and folding
" let perl_extended_vars = 1
" let perl_fold = 1 " Perl folding done automatically by Vim!
"let perl_fold_blocks = 1 " Folds block segments --> if statements and loops
