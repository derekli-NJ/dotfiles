syntax on

set noshowmode
colorscheme molokai 
set number
set smartindent
set incsearch
set scrolloff=5
""set mouse=a
set cc=80
highlight ColorColumn ctermbg=red
hi Comment ctermfg=LightGreen
"autocmd filetype cpp,c inoremap {<CR> {<CR>}<Esc>O

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
"inoremap {;<CR> {<CR>};<ESC>O

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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
