filetype plugin indent on

" set background=dark
" let g:onedark_terminal_italics=1
" colorscheme onedark
let g:gruvbox_italic=1
colorscheme gruvbox

" vim-sneak settings
hi SneakPluginTarget ctermfg=black ctermbg=181818
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

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

let g:neoformat_wxml_prettydiff = {
     \ 'exe': 'prettydiff',
     \ 'args': ['mode:"beautify"',
     \ 'lang:"html"',
     \ 'insize:2',
     \ 'readmethod:"filescreen"',
     \ 'endquietly:"quiet"',
     \ 'source:"%:p"'],
     \ 'no_append': 1
     \ }
let g:neoformat_enabled_wxml = ['prettydiff']

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_python = ['black']

" ale plugin
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_virtualtext_cursor=1
nmap  <M-k> <Plug>(ale_previous_wrap)
nmap  <M-j> <Plug>(ale_next_wrap)
" let g:ale_elixir_elixir_ls_release = '/home/zyb/tools/elixir-ls/dist'
" let g:ale_elixir_elixir_ls_config= {
"      \   'elixirLS': {
"      \     'dialyzerEnabled': v:false,
"      \   },
"      \ }
let g:ale_linters = {
      \   'python': ['flake8','isort'],
      \   'javascript': ['eslint'],
      \   'elixir': ['elixir-ls','credo'],
      \}
let g:ale_fixers = {
  \   'scss': ['stylelint'],
  \   'javascript': ['eslint'],
  \}

autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

