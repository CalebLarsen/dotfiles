set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=0

" vim plug
call plug#begin('~/.vim/plugged')
" plugins
Plug 'scrooloose/nerdtree'
"Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'raimondi/delimitmate'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/closetag.vim'
Plug 'vim-scripts/a.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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


" function to close vim if there aren't any useful buffers open
function! CheckLeftBuffers()
    if tabpagenr('$') == 1
        let i = 1
        while i <= winnr('$')
            if getbufvar(winbufnr(i), '&buftype') == 'help' ||
                \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
                \ exists('t:NERDTreeBufName') &&
                \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
                \ bufname(winbufnr(i)) == '__Tag_List__'
                let i += 1
            else
                break
            endif
        endwhile
        if i == winnr('$') + 1
            qall
        endif
    unlet i
    endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

" ale
" let g:ale_linters = {
"     \   'go': ['go vet',
"     \          'golint'],
"     \   'typscript': [''],
"     \   'html': ['prettier'],
"     \   'scss': ['prettier'],
"     \   'css': ['prettier'],
"     \   'markdown': ['prettier'],
"     \   'json': ['prettier'],
"     \   'yaml': ['prettier'],
"     \}
" let g:ale_fixers = {
"     \   'go': ['goimports'],
"     \   'html': ['prettier'],
"     \   'scss': ['prettier'],
"     \   'css': ['prettier'],
"     \   'markdown': ['prettier'],
"     \   'json': ['prettier'],
"     \   'yaml': ['prettier'],
"     \}
" let g:ale_fix_on_save = 1
" let g:ale_open_list = 1 " list errors in window at bottom
" let g:ale_list_window_size = 7 " height of error list at bottom
" let g:ale_lint_delay = 1500
" let g:ale_lint_on_text_changed = 'always'
" let g:airline#extensions#ale#enabled = 1
" let g:ale_echo_msg_error_str = 'err'
" let g:ale_echo_msg_warning_str = 'warn'
" let g:ale_echo_msg_format = '%s [%linter%]'
" nmap <silent> <C-n> <Plug>(ale_next_wrap)
" nmap <silent> <C-m> <Plug>(ale_previous_wrap)

" You Complete Me
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_echo_current_diagnostic = 0
"let g:ycm_max_diagnostics_to_display = 0
"  let g:ycm_filter_diagnostics = {
"    \ 'java': {
"    \      'regex': ['.*'],
"    \      'level': 'error',
"    \    }
"    \ }

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1 " highlighting for go
" let g:go_fmt_command = "goimports"
" let g:go_addtags_transform = "camelcase"
let g:go_auto_type_info = 1 " show type info in status bar
" inoremap iee <C-o>:GoIfErr<CR>


" cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" vim-airline
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1 " allow powerline fonts
let g:Powerline_symbols = 'fancy'

" end plugin options
"
" custom key mappings
"
set ts=4 sw=4 ai
set tabstop=4
set expandtab
set t_Co=256
command! NT NERDTreeToggle
set winminwidth=0
let mapleader = ","
nmap <Leader>h <C-W>h500<C-W>>
nmap <Leader>l <C-W>l500<C-W>>
:nnoremap <Leader>j <C-W>j
:nnoremap <Leader>k <C-W>k
:nnoremap <Leader>. <C-W>j:q<CR>

" clipboard (linux)
vnoremap <C-c> :%w !xclip -i -sel c<CR><CR>
vnoremap <C-v> :r !xclip -o -sel -c<CR><CR>
"
" end custom key mappings

" extra stuff
"
" set custom tab width
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 et
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 et

" dockerfile syntax highlighting
au BufReadPost dockerfile set ft=dockerfile
au BufReadPost dockerfile-arm set ft=dockerfile

" format json
command! FormatJSON %!python -m json.tool

" fix backspace on mac
set backspace=2

" set color scheme
"set background=dark
colorscheme molokai

" folding
set foldmethod=syntax
set foldnestmax=3
set foldlevel=30
set nofoldenable

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

" change colors for errors/warnings
highlight ALEError ctermbg=Red ctermfg=Black
highlight ALEWarning ctermbg=Blue ctermfg=Black

":iunmap <Esc>OA
":iunmap <Esc>OB
":iunmap <Esc>OC
":iunmap <Esc>OD
":iunmap <Esc>OF
":iunmap <Esc>OH
":iunmap <Esc>[5~
":iunmap <Esc>[6~
"
"JAVA
set nocompatible

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
