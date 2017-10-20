"filetype indent on

set nocompatible
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set history=500


autocmd FileType html set shiftwidth=2
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
syntax on
filetype plugin indent on

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" let g:syntastic_enable_signs = 0
" let g:syntastic_echo_current_error = 0
" let g:syntastic_enable_balloons = 0
" let g:syntastic_enable_highlighting = 0

" let g:syntastic_javascript_checkers=['eslint']




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

let g:javascript_plugin_flow = 1

set foldmethod=indent
set nofoldenable

"set wildmode=longest,list

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

cnoremap w!! w !sudo tee > /dev/null %

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"It slows down when typing j.. And it is irritating.
"inoremap jk <esc>
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
autocmd BufRead test.js  map <F5> :w <CR>:!node %<CR>
autocmd BufRead *.vim  map <F5>  :source %<CR>
autocmd BufRead .vimrc  map <F5> :source %<CR>
autocmd BufRead *.html  map <F5> :!firefox %<CR>

autocmd BufRead *.py  noremap <F5> :w <CR>:!python3.5 -q %<CR>
autocmd BufRead *.py  vnoremap <F5> :!python3.5 -q <CR>


autocmd VimEnter *.py NERDTree
autocmd VimEnter *.py wincmd p "Switch from the NERDTree buffer

autocmd BufEnter * lcd %:p:h

"autocmd VimEnter :syntax match Ramda /R\./ conceal


set runtimepath+=/home/guru/testmpc/



""FIXME : make something more robust
au VimEnter * SwapList flexbox flex flexDirection
au VimEnter * SwapList orientation row column
au VimEnter * SwapList flexalign flex-start center flex-end
au VimEnter * SwapList position absolute relative

"enable keyboard shortcuts for tern
let g:tern_map_keys=1
"show argument hints
"let g:tern_show_argument_hints='on_hold'

"semi-colon has special meaning : upwards up to ...
set tags=./tags;,tags;

let g:wordmotion_prefix = '<Leader>'
let g:wordmotion_mappings={
            \ '<C-R><C-W>' : ''
            \ }

let g:slime_target="tmux"
let g:slime_paste_file="$HOME/.slime_paste"
"let g:slime_default_config={"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
                 
"Otherwise it cripples the backward search .. '?'
let NERDTreeMapHelp='<f1>'

let g:user_emmet_settings = {
\   'javascript.jsx' : {
\       'extends' : 'jsx',
\       'quote_char' : "'",
\   },
\}


let g:jedi#popup_on_dot = 0
" let g:jedi#auto_initialization = 0
autocmd FileType python setlocal completeopt-=preview

" let g:syntastic_python_pylint_exe = 'pylint3'
let g:ale_python_pylint_executable = 'pylint3'

let g:ale_linters = {'python' : ['pylint']}
