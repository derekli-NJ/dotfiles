syntax on

set noshowmode
colorscheme molokai 
set number relativenumber

" Absolute line numbers when in insert mode
silent! autocmd InsertEnter * :set relativenumber!
silent! autocmd InsertLeave * :set relativenumber!

"Persistent undo between sessions
set undofile   
set undodir=~/.vim/undodir

set autoindent
set smartindent
set incsearch

"5 line buffer between cursor and top/bottom of screen
set scrolloff=5

"Ruler and comment coloring
set cc=80
highlight ColorColumn ctermbg=red
hi Comment ctermfg=LightGreen

"Matching braces for convenience
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

"Disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"Disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"4 space tabs for python
au Filetype python setl et ts=4 sw=4

filetype plugin on

"Built-in autocomplete with vim
set omnifunc=syntaxcomplete#Complete

"Maps tab to autocomplete if in the middle of a word
function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
      else
        return "\<c-p>"
      endif
    endfunction
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>


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
