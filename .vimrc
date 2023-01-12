set nocompatible
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set history=500
" To curb vim's desire to execute whenever it encounters ex: (even though it
" may mean example: )
set nomodeline

syntax on
filetype plugin indent on

autocmd FileType html set shiftwidth=2
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" when editing maths tex files :up (save if necessary) then use 
" :!tup (makefile-like building tool)
autocmd FileType plaintex map <buffer> <F7> :up:!tup
autocmd FileType tex map <buffer> <F7> :up:!tup

autocmd FileType r map <buffer> <F7> :w:SlimeSend1 source('<C-R>%')

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
" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "∅"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ᴎ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

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

" It slows down when typing j.. And it is irritating.
" inoremap jk <esc>
" cnoremap jk <esc>

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
set grepprg=ag\ --nogroup\ --column
set grepformat=%f:%l:%c:%m

"JSX
let g:jsx_ext_required=0

"Run/Execute
autocmd BufRead *.js  map <F5> :!react-native run-android<CR>
autocmd BufRead test.js  map <F5> :w <CR>:!node %<CR>
autocmd BufRead *.vim  map <F5>  :source %<CR>
autocmd BufRead .vimrc  map <F5> :source %<CR>
autocmd BufRead *.html  map <F5> :!xdg-open %:p<CR>
autocmd BufRead *.rs  map <F5> :update <CR>:!cargo run<CR>

autocmd BufRead *.py  noremap <F5> :w <CR>:!python3.6 -q %<CR>
autocmd BufRead *.py  vnoremap <F5> :!python3.5 -q <CR>

autocmd BufRead *.mzn  map <F5> :w <CR>:!minizinc %<CR>



" autocmd VimEnter *.py NERDTree
" autocmd VimEnter *.py wincmd p "Switch from the NERDTree buffer

" Subtitles
" file
" autocmd BufRead,BufEnter *.srt set filetype=subtitle
autocmd FileType subrip set ignorecase
autocmd BufRead,BufEnter *.srt set nomodifiable

" Clashes with vim fugitive
" autocmd BufEnter * lcd %:p:h
" set acd

" autocmd VimEnter :syntax match Ramda "R\." conceal
" syntax match Ramda "R\." conceal


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
let g:slime_default_config={"socket_name": "default", "target_pane": ":.0"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1

" autocmd FileType r map <buffer> <F7> :w:SlimeSend1 source('<C-R>%')
" map <F8> :SlimeSend0 
" map <F9> :SlimeSend1 #end-of-previously-sent
nnoremap <F9> :SlimeSend1 #end-of-previously-sent
autocmd FileType r map <buffer> <F8> :SlimeSend1 source('<C-R>%')
                 
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

let g:ale_r_lintr_options='lintr::with_defaults(object_name_linter = NULL, infix_spaces_linter = NULL, single_quotes_linter = NULL)'

let g:AutoCloseExpandSpace = 0

autocmd FileType python noremap <buffer> <F12> :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1
let g:autopep8_ignore='E731'

au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible
set dictionary+=/home/guru/guru-infos/diary/most_used_words
set thesaurus+=/usr/share/dict/thes/mthesaur.txt

set keywordprg=dict\ -d\ wn

au VimEnter *.notes set spell|set bg=dark
au VimEnter *_notes set spell|set bg=dark

autocmd BufRead,BufNewFile 20* set spell
autocmd BufRead,BufNewFile *diff set spell

"Show the modifications made to the original file (snippet found in Vim Doc)
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

set termwinkey=<C-L>

" To make `vim http://url` function without having to install elinks
" let g:netrw_http_cmd='curl'
" let g:netrw_http_xcmd='-s -L -o'
let g:netrw_http_cmd='wget'
let g:netrw_http_xcmd='-q -O'
let g:netrw_silent=1

autocmd Filetype gitcommit :set spell | set textwidth=72

" Open pdfs to read in mupdf
" au BufRead 2read :nnoremap gf :!mupdf "<cfile>" &<CR>
" au BufRead 2read :nnoremap gf ^vg_<C-o>gf
" au BufRead 2read :nnoremap gf ^vg_:!mupdf "<C-r><C-*>"<CR>
au BufRead 2read :nnoremap gf ^vg_""y:!mupdf "<C-r>""<CR>

autocmd FileType ratpoison setlocal commentstring=#\ %s
autocmd FileType eukleides setlocal commentstring=%\ %s
au BufRead,BufNewFile *.euk set filetype=eukleides

autocmd FileType zinc setlocal commentstring=%\ %s

" persistent-undo
set undofile
set undodir=~/.vim/undodir
au BufWritePre /tmp/* setlocal noundofile

" Remove trailing whitespace from R files
autocmd BufWritePre *.R :%s/\s\+$//e

" To make the lime-green cursor stand out and attract our gaze without
" resorting to blinking. (making the matching parenthesis less pronounced)
hi MatchParen cterm=bold ctermbg=brown ctermfg=yellow


" To just force us use vim movements (with a higher-level meaning: paragraph, code block..)
" Sleep for 1 second
" noremap h h1gs
" noremap j j1gs
" noremap k k1gs
" noremap l l1gs
