"filetype indent on

set nocompatible
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set history=500


autocmd FileType html set shiftwidth=2
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
execute pathogen#infect()
syntax on
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['eslint']

"set hlsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

set conceallevel=1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"


"set wildmode=longest,list

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

cnoremap w!! w !sudo tee > /dev/null %

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap jk <esc>
cnoremap jk <esc>

filetype plugin  on
"packadd! matchit
"runtime macros/matchit.vim

set hidden

"set path+=/work
"

"set ignorecase
"set smartcase
"set infercase

set incsearch

set shortmess+=I
set nu

autocmd BufRead *BigOcto_what_i_installed*  :$;

"Just to make it skip to exact occurrence instead of just  the line containing
"the occurence
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

"JSX
let g:jsx_ext_required=0

"Run/Execute
autocmd BufRead *.js  map <F5> :!react-native run-android<CR>
autocmd BufRead *.vim  map <F5>  :source %<CR>
autocmd BufRead .vimrc  map <F5> :source %<CR>


set runtimepath+=/home/guru/testmpc/

function! CloseTagInJSX()
    let _ft = &filetype
    execute "set filetype=xml"
    execute "gg"
    execute "set filetype=" . _ft

endfunction

"Close HTML tags
""FIXME : make something more robust
iabbrev </ <C-o>:set omnifunc=xmlcomplete#CompleteTags<CR></<C-X><C-O>

""FIXME : make something more robust
au VimEnter * SwapList flexbox flex flexDirection
au VimEnter * SwapList orientation row column
au VimEnter * SwapList flexalign flex-start center flex-end

