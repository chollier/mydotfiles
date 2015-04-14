syntax enable
call pathogen#infect()


inoremap jj <ESC>l

" Spaces and tabs {{{
set tabstop=2      " number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
" " }}}
"
" " UI and Layout {{{
set t_Co=256               " Number of colors used in terminal
let base16colorspace=256
" " colorscheme badwolf        " Awesome colorscheme
" colorscheme molokai
" colorscheme Tomorrow-Night-Eighties
" colorscheme solarized
set background=dark
" solarized options
let g:solarized_visibility = "high"
" let g:solarized_termcolors = 256
colorscheme solarized

set spelllang=en_US        " Set region to British English
set mouse=a
set encoding=utf-8
set scrolloff=3
set cursorline
set showmatch
filetype plugin indent on
" set textwidth=79         " Max text-width
" Wildmenu
set wildmenu
set wildmode=longest:full,full
" Splits
set splitbelow
set splitright
" Status line
set laststatus=2
set number
let mapleader="\<Space>"
map  <Leader>t <plug>NERDTreeTabsToggle<CR>


" Multiple windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <silent> sv :vsplit<CR>
nnoremap <silent> sh :split<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>ez :edit ~/.zshrc<CR>
nnoremap <leader>et :edit ~/.tmux.conf<CR>

" Searching {{{
set ignorecase
set incsearch
set hlsearch

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

nnoremap <Leader><Leader> V

" Copy & paste to system clipboard
vmap <Leader>y "+y

set autoread
" No swap files
set noswapfile
set nobackup
set nowb


nnoremap <CR> G
nnoremap <BS> gg


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" Vim expand region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-V> <Plug>(expand_region_shrink)
" " }}}
"
"
"
let g:airline_powerline_fonts = 1


nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
" Repeat last change on selected range
vmap . :normal .<CR>


" Ag remap
nnoremap <Leader>aa :call MyAgSearch()<CR>
nnoremap <silent> <Leader>al :cl<CR>
nnoremap <silent> <Leader>ac :ccl<CR>
nnoremap <silent> <Leader>an :cn<CR>
nnoremap <silent> <Leader>ap :cp<CR>


let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

augroup configgroup
  autocmd!
" TrimWhiteSpaces when saving
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

function! MyAgSearch()
    let l:defaultFileType = expand("%:e")

    call inputsave()
    let l:pattern = input('Ag pattern >>> ')
    call inputrestore()

    call inputsave()
    let l:fileType=input('File Type [default=' . l:defaultFileType .'] >>> ')
    call inputrestore()
    if empty(l:fileType)
        execute "Ag" l:pattern "**/*." . l:defaultFileType
    else
        execute "Ag" l:pattern "**/*." . l:fileType
    endif
endfunction

" Remove trailing whitespace
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

set timeoutlen=1000 ttimeoutlen=0
set ttymouse=sgr

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_this       = "@"
let g:jsx_ext_required = 0
autocmd FileType javascript syntax clear jsFuncBlock
nnoremap nf :NERDTreeFind<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" " selelct what you've just pasted
nnoremap gp `[v`]
"
" " reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
