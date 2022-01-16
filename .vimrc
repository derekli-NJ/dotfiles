syntax on

"vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" :PlugInstall
call plug#begin()

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" For Go: https://github.com/ycm-core/YouCompleteMe/issues/3074
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1

set noshowmode
colorscheme sublime-monokai 
set number
set signcolumn=number

"Persistent undo between sessions
set undofile   
set undodir=~/.vim/undodir

set autoindent
set smartindent
set incsearch

"5 line buffer between cursor and top/bottom of screen
set scrolloff=5

hi Comment ctermfg=LightGreen
set backspace=indent,eol,start

"Matching braces for convenience
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap        (  ()<Left>
"inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap        [  []<Left>
"inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

"4 space tabs for python & haskell
au Filetype python setl et ts=4 sw=4
au Filetype haskell setl et ts=4 sw=4

"Mips Syntax Highlighting
autocmd BufNewFile,BufRead *.fs setl ft=asm

filetype plugin on

"Built-in autocomplete with vim
" set omnifunc=syntaxcomplete#Complete

"Maps tab to autocomplete if in the middle of a word
"function! InsertTabWrapper()
"      let col = col('.') - 1
"      if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"      else
"        return "\<c-p>"
"      endif
"    endfunction
"    inoremap <tab> <c-r>=InsertTabWrapper()<cr>


"Custom status bar
set laststatus=2
set statusline=
set statusline+=\ 
set statusline+=«
set statusline+=\ 
set statusline+=%{StatuslineMode()} 
set statusline+=\ 
set statusline+=»
set statusline+=\ 
set statusline+=%y
set statusline+=%=
set statusline+=%F
set statusline+=\ 
set statusline+=|
set statusline+=\ 
set statusline+=%{'Tab='.tabpagenr()}

hi User1 guibg=OrangeRed4 ctermfg=8 guifg=OrangeRed4 ctermbg=15

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
