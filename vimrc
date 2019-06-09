syntax on

colorscheme molokai 
set number
set smartindent
set mouse=a
set cc=80
highlight ColorColumn ctermbg=red
hi Comment ctermfg=LightGreen
autocmd filetype cpp,c inoremap {<CR> {<CR>}<Esc>O

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

au Filetype python setl et ts=4 sw=4

