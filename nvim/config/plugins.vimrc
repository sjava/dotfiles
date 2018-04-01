filetype plugin indent on

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set shortmess+=c
set completeopt-=preview
let g:tmuxcomplete#trigger = ''

" deoplete-tern
let g:deoplete#sources#ternjs#tern_bin = 'ternjs'
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue'
      \ ]

" echodoc
set noshowmode
let g:echodoc#enable_at_startup=1

set background=dark
" let g:gruvbox_italic=1
" let g:gruvbox_italicize_strings=1
" colorscheme gruvbox

let g:onedark_terminal_italics=1
colorscheme onedark

" make background transparent
" hi Normal ctermbg=NONE
" hi EndOfBuffer ctermbg=NONE
" hi LineNr ctermbg=234

" CtrlP
let g:ctrlp_prompt_mappings={'PrtClearCache()':['<Leader><F5>']}
let g:ctrlp_prompt_mappings={'PrtdeleteEnt()':['<Leader><F7>']}
let g:ctrlp_match_window='bottom,order:btt,min:2,max:25'
set wildmenu " enhanced autocomplete
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot,*deps*
",*public/css/*,*public/js*

" delimitMate options
let delimitMate_expand_cr=1

" enable matchit (for matching tags with %)
" runtime macros/matchit.vim

" vim-sneak settings
hi SneakPluginTarget ctermfg=black ctermbg=181818
let g:sneak#label = 1
nmap f <Plug>SneakLabel_s
nmap F <Plug>SneakLabel_S

" disable colorizer at startup
let g:colorizer_startup = 0
let g:colorizer_nomap = 1

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
      \   'guifgs': [ 'darkorange3', 'seagreen3', 'royalblue3','firebrick'],
      \   'ctermfgs': [ 'lightyellow', 'lightcyan', 'lightmagenta','lightblue'],
      \   'operators': '_,_',
      \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \   'separately': {
      \       '*': {},
      \       'tex': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \       },
      \       'lisp': {
      \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \       },
      \       'vim': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \       },
      \       'html': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'jinja': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'css': 0,
      \   }
      \}
let g:neoformat_html_prettydiff = {
      \ 'exe': 'prettydiff',
      \ 'args': ['mode:"beautify"',
      \ 'lang:"html"',
      \ 'insize:2',
      \ 'readmethod:"filescreen"',
      \ 'endquietly:"quiet"',
      \ 'source:"%:p"'],
      \ 'no_append': 1
      \ }
let g:neoformat_enabled_html = ['prettydiff']

 let g:neoformat_vue_prettier = {
       \ 'exe': 'prettier',
       \ 'args': ['--stdin',
       \ '--parser vue',
       \ '--single-quote',
       \ '--trailing-comma es5'],
       \ 'stdin': 1
       \ }
let g:neoformat_enabled_vue = ['prettier']

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.py,*.ex,*.exs Neoformat
  autocmd BufWritePre *.css,*.less,*scss Neoformat
  autocmd BufWritePost *.vue,*.html Neoformat
  " autocmd BufWritePost *.css,*.js,*.py,*.vue,*.html,*scss IndentLinesReset
augroup END

" ale plugin
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
nmap  <M-k> <Plug>(ale_previous_wrap)
nmap  <M-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
      \   'python': ['flake8','isort'],
      \   'javascript': ['eslint'],
      \   'elixir': ['credo'],
      \}

" language client
" set hidden
" set completefunc=LanguageClient#complete
" set omnifunc=LanguageClient#complete
" autocmd FileType elixir setlocal omnifunc=LanguageClient#complete
" autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
" let g:LanguageClient_diagnosticsEnable=0
" let g:LanguageClient_serverCommands = {
"       \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"       \ 'python': ['pyls'],
"       \ }
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"     \ 'elixir': ['~/elixir_tools/elixir-ls/language_server.sh'],
"     \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" choosewin{
" invoke with '-'
nmap  -  <Plug>(choosewin)
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1
" choosewin}

let g:neoterm_position='vertical'
function g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

let g:alchemist#elixir_erlang_src="/home/zyb/elixir_tools/elixir_erlang_src"
let g:UltiSnipsSnippetsDir="~/.dotfiles/nvim/UltiSnips"
