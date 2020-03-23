set nocompatible

" use `jj` or `jk` to exit insert mode
inoremap jj <ESC>
inoremap jk <ESC>

" spell check shortcuts
:set spelllang=en_US
nnoremap <leader>s :set spell! 


" Always use spaces instead of tabs
set expandtab

" From https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Line numbers
set number
" Enable highlighting when searching
set hlsearch

" enable all Python syntax hightlighting features
let python_highlight_all = 1

" Toggle key for majutsushi/tabar
nmap <F8> :TagbarToggle<CR>

" Recommend syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python3', 'pylint']

" Add fzf to vim runtime path
set rtp+=~/.fzf

" fzf configuration
" https://github.com/junegunn/fzf#using-git
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
