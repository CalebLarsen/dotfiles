set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=0
let mapleader = ","

" vim plug
call plug#begin('~/.vim/plugged')

" plugins
Plug 'preservim/nerdtree'
Plug 'fatih/molokai'
Plug 'raimondi/delimitmate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" {{{
    nnoremap <silent> <leader><space> :Files<CR>
" }}}
call plug#end()

" set file specific things on
filetype on
filetype plugin on
filetype indent on

" plugin options
"
" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " if no files opened (ie, $ vim) then open by default autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif "open if file is a directory
let NERDTreeShowHidden=1
command! NT NERDTreeToggle
command CDC cd %:p:h | NERDTreeCWD | NERDTreeRefreshRoot
command CDK cd .. | NERDTreeCWD | NERDTreeRefreshRoot

"LUCID STUFF
command CDL cd ~/lucid/main | NERDTreeCWD | NERDTreeRefreshRoot

nnoremap <Leader>cd :cd %:p:h<CR>
noremap <C-h> :tabp<CR>
noremap <C-l> :tabn<CR>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>500<C-W>>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>t :NT<CR>
nnoremap <Leader>n :NT<CR>

" vim-airline
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1 " allow powerline fonts
let g:Powerline_symbols = 'fancy'

" end plugin options
"
" custom key mappings
"
"
set ts=4 sw=4 ai
set shiftround
set tabstop=4
set expandtab
set t_Co=256
set winminwidth=0
set hlsearch
set incsearch

nmap <Leader>h <C-W>h500<C-W>>
nmap <Leader>l <C-W>l500<C-W>>
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>. <C-W>j:q<CR>
nnoremap <Leader>cd :cd %:p:h<CR>

" clipboard (linux)
vnoremap <C-c> :%w !xclip -i -sel c<CR><CR>
vnoremap <C-v> :r !xclip -o -sel -c<CR><CR>
"
" end custom key mappings

" dockerfile syntax highlighting
au BufReadPost dockerfile set ft=dockerfile
au BufReadPost dockerfile-arm set ft=dockerfile

" set color scheme
"set background=dark
colorscheme molokai

" show line numbers
set number

" keep cursor in center of screen
set scrolloff=999

" change location of swap files
set directory=/tmp

" scrolling
set mouse=a
set ttymouse=xterm2

" disable button clicks
:noremap <LeftMouse> <nop>
:noremap <2-LeftMouse> <nop>
:inoremap <LeftMouse> <nop>
:inoremap <2-LeftMouse> <nop>

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" COC.NVIM

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
