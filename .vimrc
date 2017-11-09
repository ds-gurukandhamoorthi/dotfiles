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
let g:javascript_conceal_null                 = "∅"
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

let g:AutoCloseExpandSpace = 0
abbrev this self

autocmd FileType python noremap <buffer> <F12> :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1
let g:autopep8_ignore='E731'

" add this to vim-cute-python
" syntax match pyNiceOperator "!=" conceal cchar=≠
" syntax keyword pyNiceOperator None conceal cchar=∅
" syntax keyword pyNiceOperator yield conceal cchar=↢
" syntax keyword pyNiceOperator while conceal cchar=⟳
" " syntax keyword pyNiceOperator from conceal cchar=⥺
" syntax keyword pyNiceOperator from conceal cchar=⊂
" syntax keyword pyNiceOperator for conceal cchar=∀
" syntax keyword pyNiceOperator if conceal cchar=⁇
" syntax keyword pyNiceOperator else conceal cchar=‼
" syntax keyword pyNiceOperator elif conceal cchar=⁉
" syntax keyword pyNiceOperator def conceal cchar=ƒ
" syntax keyword pyNiceOperator product conceal cchar=∏
" syntax keyword pyNiceOperator len conceal cchar=⍴
" syntax keyword pyNiceOperator range conceal cchar=…
" syntax keyword pyNiceOperator all conceal cchar=∀
" syntax keyword pyNiceOperator any conceal cchar=∃
" syntax keyword pyNiceOperator self conceal cchar=@
" syntax keyword pyNiceOperator int conceal cchar=ℤ
" syntax keyword pyNiceOperator float conceal cchar=ℝ
" syntax keyword pyNiceOperator complex conceal cchar=ℂ
" syntax keyword pyNiceOperator return conceal cchar=⇦
" syntax keyword pyNiceOperator import conceal cchar=⇲
" syntax match pyNiceOperator "\<contains\>" conceal cchar=∋
"  syntax keyword pyNiceOperator from conceal cchar=⊆
" syntax keyword pyNiceOperator print conceal cchar=⎙
" syntax keyword pyNiceOperator str conceal cchar=𝕤
" syntax keyword pyNiceOperator set conceal cchar=𝕊
" syntax keyword pyNiceOperator tuple conceal cchar=𝕋
" syntax keyword pyNiceOperator list conceal cchar=𝕃
" syntax keyword pyNiceOperator True conceal cchar=Ｔ
" syntax keyword pyNiceOperator False conceal cchar=Ｆ
" syntax match pyNiceOperator "\[0\]" conceal cchar=₀
" syntax match pyNiceOperator "\[1\]" conceal cchar=₁
" syntax match pyNiceOperator "\[2\]" conceal cchar=₂
" syntax match pyNiceOperator "\[3\]" conceal cchar=₃
" syntax match pyNiceOperator "\[4\]" conceal cchar=₄
" syntax match pyNiceOperator "\[5\]" conceal cchar=₅
" syntax match pyNiceOperator "\[6\]" conceal cchar=₆
" syntax match pyNiceOperator "\[7\]" conceal cchar=₇
" syntax match pyNiceOperator "\[8\]" conceal cchar=₈
" syntax match pyNiceOperator "\[9\]" conceal cchar=₉
" syntax match pyNiceOperator "\[-1\]" conceal cchar=₋
" syntax match pyNiceOperator "\[a\]" conceal cchar=ₐ
" syntax match pyNiceOperator "\[e\]" conceal cchar=ₑ
" syntax match pyNiceOperator "\[h\]" conceal cchar=ₕ
" syntax match pyNiceOperator "\[i\]" conceal cchar=ᵢ
" syntax match pyNiceOperator "\[j\]" conceal cchar=ⱼ
" syntax match pyNiceOperator "\[k\]" conceal cchar=ₖ
" syntax match pyNiceOperator "\[l\]" conceal cchar=ₗ
" syntax match pyNiceOperator "\[m\]" conceal cchar=ₘ
" syntax match pyNiceOperator "\[n\]" conceal cchar=ₙ
" syntax match pyNiceOperator "\[o\]" conceal cchar=ₒ
" syntax match pyNiceOperator "\[p\]" conceal cchar=ₚ
" syntax match pyNiceOperator "\[r\]" conceal cchar=ᵣ
" syntax match pyNiceOperator "\[s\]" conceal cchar=ₛ
" syntax match pyNiceOperator "\[t\]" conceal cchar=ₜ
" syntax match pyNiceOperator "\[u\]" conceal cchar=ᵤ
" syntax match pyNiceOperator "\[v\]" conceal cchar=ᵥ
" syntax match pyNiceOperator "\[x\]" conceal cchar=ₓ
" syntax keyword pyNiceOperator abs conceal cchar=|
" syntax keyword pyNiceOperator enumerate conceal cchar=𝕖
" syntax keyword pyNiceOperator zip conceal cchar=𝕫
" syntax keyword pyNiceOperator next conceal cchar=≺
""returns one result symbolized by the circle
"syntax keyword pyNiceOperator join conceal cchar=⨁
""returns many values  symbolized by the dots..
"syntax keyword pyNiceOperator split conceal cchar=⁜
" syntax keyword pyNiceOperator other conceal cchar=Ö
" syntax match pyNiceKeyword "\<\%(math\.\)\?exp\>" conceal cchar=ℯ
" syntax keyword pyNiceOperator assert conceal cchar=⊦
" syntax keyword pyNiceOperator reversed conceal cchar=ᴙ
" syntax keyword pyNiceOperator sorted conceal cchar=⇅
" syntax keyword pyNiceOperator help conceal cchar=❔
" syntax keyword pyNiceOperator description conceal cchar=¿
" the inverted ¿ resembles the symbol d in 'd'escription
