set nocompatible

" default to dark background
set background=dark

" use `jj` or `jk` to exit insert mode
inoremap jj <ESC>
inoremap jk <ESC>

" spell check shortcuts
:set spelllang=en_US
nnoremap <leader>s :set spell!<CR>

" show partial commands in status var
set showcmd
" hide buffers by default instead of closing
set hidden
" better case-sensitivity when searching
set smartcase

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

" Make j and k line-wrap aware by default
noremap <silent> j gj
noremap <silent> k gk

" Keep cursor always four lines from the edge
set scrolloff=4
" Add cursorline
set cursorline

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
let g:syntastic_python_checkers = ['python', 'pylint', 'flake8']
let g:syntastic_aggregate_errors = 1

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


" nerdtree config
nmap <C-n> :NERDTreeToggle<CR>

" Add the YouCompleteMe plugin if its available on this machine
" See https://github.com/ycm-core/YouCompleteMe#full-installation-guide
" silent! packadd YouCompleteMe

" YouCompleteMe config
" let g:ycm_clangd_binary_path = "/usr/bin/clangd-9"

" vim-airline config
" let g:airline_theme='angr'
let g:airline_theme='minimalist'

" haskell-vim config
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2

" ===============================
" coc.nvim config
" ===============================

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if exists('*complete_info')
"     inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"     imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" " Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>qf  <Plug>(coc-fix-current)
