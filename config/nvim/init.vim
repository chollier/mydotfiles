if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYNVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'flowtype/vim-flow'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
" enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iCyMind/NeoSolarized'
Plug 'kien/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
" Elixir Lang plugins
" Plug 'elixir-lang/vim-elixir'
Plug 'flazz/vim-colorschemes'
" Plug 'kchmck/vim-coffee-script', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'terryma/vim-expand-region'
" Plug 'rking/ag.vim'
" Cursor color
" Graph your Vim undo tree in style.
" Plug 'sjl/gundo.vim'
" Use fork for neovim instead
Plug 'simnalamburt/vim-mundo'

" Html/Xml editing
Plug 'tpope/vim-ragtag', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': 'html' }

Plug 'elzr/vim-json', { 'for':  ['html', 'javascript', 'json', '.eslintrc']}

" vim plugin for tmux.conf
Plug 'tmux-plugins/vim-tmux'


Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
" Plug 'rorymckinley/vim-rubyhash', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'vim-scripts/closetag.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/syntastic'
" Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'ekalinin/Dockerfile.vim'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'Shougo/unite.vim'
Plug 'jparise/vim-graphql'


if filereadable(expand('~/.config/nvim/.nvimrc.bundles.local'))
    source ~/.config/nvim/.nvimrc.bundles.local
endif

call plug#end()

inoremap jj <ESC>l
inoremap jk <ESC>l

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
set background=dark
" neosolarized options
let g:neosolarized_visibility = "high"
colorscheme NeoSolarized

set spelllang=en_US        " Set region to British English
set mouse=a
if !has('nvim')
  set encoding=utf-8
endif
set scrolloff=3
set cursorline
set cursorcolumn
set showmatch
" filetype plugin indent on
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

nnoremap <leader>ev :edit $MYNVIMRC<CR>
nnoremap <leader>ez :edit ~/.zshrc<CR>
nnoremap <leader>et :edit ~/.tmux.conf<CR>

" fzf config
nnoremap <C-p> :Files<CR>
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <Leader>aa :Ag<CR>
" nnoremap <silent> <Leader>al :cl<CR>
" nnoremap <silent> <Leader>ac :ccl<CR>
" nnoremap <silent> <Leader>an :cn<CR>
" nnoremap <silent> <Leader>ap :cp<CR>

" Searching {{{
set ignorecase
set incsearch
set hlsearch

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" nnoremap <Leader><Leader> V

" Copy & paste to system clipboard
vmap <Leader>y "+y

set autoread
" No swap files
set noswapfile
set nobackup
set nowb


nnoremap <CR> G
nnoremap <BS> gg

" Vim expand region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-V> <Plug>(expand_region_shrink)
" " }}}
"
"
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0


nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
" Repeat last change on selected range
vmap . :normal .<CR>




" let g:ctrlp_user_command = 'ag %s -l -p .agignore --nocolor -g ""'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


if has("autocmd")
  autocmd bufwritepost init.vim source $MYNVIMRC
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
if !has('nvim')
  set ttymouse=sgr
endif

" set conceallevel=1
" set concealcursor=nvic
" let g:javascript_conceal_function   = "ƒ"
" let g:javascript_conceal_this       = "@"
let g:jsx_ext_required = 0

nnoremap nf :NERDTreeFind<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
au BufEnter *.js syn match error contained "\<debugger\>"

set undofile                    " Save undo's after file closes
set undodir=~/.config/nvim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" " selelct what you've just pasted
nnoremap gp `[v`]
"
set pastetoggle=<F2>
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

" let g:syntastic_always_populate_loc_list = 1
" " let g:syntastic_auto_loc_list = 1
" " let g:syntastic_check_on_open = 1
" " let g:syntastic_check_on_wq = 0
" let g:syntastic_warning_symbol = "▲"
" let g:syntastic_error_symbol = '✘'
" let g:syntastic_vim_checkers           = ['vint']
" let g:syntastic_javascript_checkers = ['eslint', 'flow']
" let g:syntastic_javascript_flow_exe = 'flow'
" " Use local node_modules binary
" let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

"
:nmap <leader>s :s/\(<c-r>=expand("<cword>")<cr>\)/

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
hi def link jsObjectKey Label

function! ESLintFix()
  silent execute "!./node_modules/.bin/eslint --fix %"
  edit! %
  Neomake
endfunction

nnoremap <leader>el :call ESLintFix()<CR>

function! RubocopFix()
  silent execute "!rubocop -a %"
  edit! %
  Neomake
endfunction

nnoremap <leader>rf :call RubocopFix()<CR>


" neomake

nmap <Leader>o :lopen<CR>      " open location window
nmap <Leader>c :lclose<CR>     " close location window
nmap <Leader>, :ll<CR>         " go to current error/warning
nmap <Leader>n :lnext<CR>      " next error/warning
nmap <Leader>p :lprev<CR>      " previous error/warning

" Use node_modules' eslint
let s:eslint_path = system('PATH=$(yarn bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
" In case we need to debug Neomake, uncomment this
" let g:neomake_verbose=3
" let g:neomake_logfile='/tmp/error.log'

" Make GitGutter Neomake signs nicer
let g:neomake_warning_sign = {
  \ 'text': "▲",
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✘',
  \ 'texthl': 'ErrorMsg',
  \ }

" Custom flowtype Neomake maker
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction


if findfile('.flowconfig', '.;') !=# ''
  let g:flow_path = StrTrim(system('PATH=$(yarn bin):$PATH && which flow'))
  if g:flow_path != 'flow not found'
    let g:neomake_javascript_flow_maker = {
          \ 'exe': 'sh',
          \ 'args': ['-c', g:flow_path.' --json 2> /dev/null | flow-vim-quickfix'],
          \ 'errorformat': '%E%f:%l:%c\,%n: %m',
          \ 'cwd': '%:p:h'
          \ }
    let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'flow']
    let g:neomake_jsx_enabled_makers = g:neomake_jsx_enabled_makers + [ 'flow']
    let g:flow#enable = 0
    let g:flow#flowpath = g:flow_path
  endif
endif

if !empty(g:neomake_javascript_enabled_makers)
  autocmd! BufWritePost * Neomake
end

autocmd! BufWritePost *.rb Neomake mri


